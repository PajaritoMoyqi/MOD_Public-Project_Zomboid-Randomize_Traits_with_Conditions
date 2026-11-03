PM_RandomizeTraits = PM_RandomizeTraits or {};
PM_RandomizeTraits.settings = PM_RandomizeTraits.settings or {};
PM_RandomizeTraits.traitSettings = {};

PM_RandomizeTraits.settings.Preselect = true;
PM_RandomizeTraits.settings.HardPreselect = true;
PM_RandomizeTraits.settings.AutoReRandomize = true;

-- Trait ID string, e.g. "base:strong", "toadtraits:lucky"
-- (getType():getName() drops the namespace, so it collides between mods)
function PM_getTraitID(traitDef)
    return tostring(traitDef:getType())
end

-- ModOptions option ID: ':' is saved fine, but spaces ("base:out of shape")
-- and '|' (the modOptions.ini separator) are replaced
function PM_getOptionID(traitID)
    return "Trait_" .. (traitID:gsub("[%s|]", "_"))
end

-- Combobox index -> setting value
local SETTING_VALUES = { "Normal", "Exclude", "Preselect" }

-- Presets are stored in Zomboid/Lua/ (same folder as ModOptions.ini), one line each:
--   name|<slot>|<preset name>
--   trait|<slot>|<trait ID>|<Exclude or Preselect>
PM_PRESET_SLOTS = 10
local PRESET_FILE = "PM_RandomizeTraits_Presets.txt"

-- Returns { [slot] = { name = string, traits = { [traitID] = setting } } }, empty slots are nil
function PM_loadPresets()
    local presets = {}
    local reader = getFileReader(PRESET_FILE, true)
    if not reader then
        return presets
    end
    local line = reader:readLine()
    while line do
        local kind, slot, rest = line:match("^(%a+)|(%d+)|(.*)$")
        slot = tonumber(slot)
        if slot and slot >= 1 and slot <= PM_PRESET_SLOTS then
            if kind == "name" then
                presets[slot] = presets[slot] or { traits = {} }
                presets[slot].name = rest
            elseif kind == "trait" then
                local traitID, setting = rest:match("^(.*)|(%a+)$")
                if traitID and (setting == "Exclude" or setting == "Preselect") then
                    presets[slot] = presets[slot] or { traits = {} }
                    presets[slot].traits[traitID] = setting
                end
            end
        end
        line = reader:readLine()
    end
    reader:close()
    -- A slot without a name line is broken; give it a default name
    for slot, preset in pairs(presets) do
        preset.name = preset.name or (getText("UI_PM_RandomizeTraits_Preset_DefaultName") .. " " .. slot)
    end
    return presets
end

function PM_savePresets(presets)
    local writer = getFileWriter(PRESET_FILE, true, false)
    for slot = 1, PM_PRESET_SLOTS do
        local preset = presets[slot]
        if preset then
            writer:write("name|" .. slot .. "|" .. preset.name .. "\r\n")
            for traitID, setting in pairs(preset.traits) do
                writer:write("trait|" .. slot .. "|" .. traitID .. "|" .. setting .. "\r\n")
            end
        end
    end
    writer:close()
end

-- Build options inside OnGameBoot (trait labels and translations are ready here;
-- saved values are restored afterwards, see OnMainMenuEnter below)
Events.OnGameBoot.Add(function()
    local options = PZAPI.ModOptions:create("PM_RandomizeTraits", getText("UI_PM_RandomizeTraits_ModName"))

    options:addTickBox("Preselect", getText("UI_PM_RandomizeTraits_Options_Preselect"), true,
        getText("UI_PM_RandomizeTraits_Options_Preselect_ToolTip"))
    options:addTickBox("HardPreselect", getText("UI_PM_RandomizeTraits_Options_HardPreselect"), true,
        getText("UI_PM_RandomizeTraits_Options_HardPreselect_ToolTip"))
    options:addTickBox("AutoReRandomize", getText("UI_PM_RandomizeTraits_Options_AutoReRandomize"), true,
        getText("UI_PM_RandomizeTraits_Options_AutoReRandomize_ToolTip"))

    -- Filled below with the selectable traits; the buttons use it when clicked
    local traitInfos = {}

    -- Change a trait combobox on the open options screen.
    -- Only the UI element is changed, so Apply saves it and Cancel discards it
    -- (option:setValue would change the stored value right away, even on Cancel)
    local function selectOnScreen(info, index)
        local element = options:getOption(info.optionID).element
        if element and element.selected ~= index then
            element.selected = index
            -- Notify the options screen like a player selection does, so Apply gets enabled
            if element.onChange then
                local args = element.onChangeArgs or {}
                element.onChange(element.target, element, args[1], args[2])
            end
        end
    end

    -- Current on-screen value of a trait combobox (saved value if the screen is not open)
    local function getOnScreen(info)
        local option = options:getOption(info.optionID)
        return option.element and option.element.selected or option:getValue()
    end

    options:addButton("ResetAllNormal", getText("UI_PM_RandomizeTraits_Options_ResetAllNormal"),
        getText("UI_PM_RandomizeTraits_Options_ResetAllNormal_ToolTip"), function()
            for _, info in ipairs(traitInfos) do
                selectOnScreen(info, 1)
            end
        end)

    -- Presets: save/load the trait settings to slots in a file
    local presets = PM_loadPresets()

    local function slotLabel(slot)
        local preset = presets[slot]
        return slot .. ": " .. (preset and preset.name or getText("UI_PM_RandomizeTraits_Preset_Empty"))
    end

    options:addSeparator()
    options:addTitle(getText("UI_PM_RandomizeTraits_Title_Presets"))
    local slotCombo = options:addComboBox("PresetSlot", getText("UI_PM_RandomizeTraits_Options_PresetSlot"),
        getText("UI_PM_RandomizeTraits_Options_PresetSlot_ToolTip"))
    for slot = 1, PM_PRESET_SLOTS do
        slotCombo:addItem(slotLabel(slot), slot == 1)
    end
    local nameEntry = options:addTextEntry("PresetName", getText("UI_PM_RandomizeTraits_Options_PresetName"), "",
        getText("UI_PM_RandomizeTraits_Options_PresetName_ToolTip"))

    local function getSelectedSlot()
        return slotCombo.element and slotCombo.element.selected or slotCombo:getValue()
    end

    -- Selecting a slot loads its trait settings onto the screen (Apply saves them, Cancel discards them).
    -- An empty slot keeps the screen as is, so the current settings can be saved into it.
    -- The name entry shows the slot's name, so saving does not reuse another slot's name
    slotCombo.onChange = function(self)
        local preset = presets[getSelectedSlot()]
        if preset then
            for _, info in ipairs(traitInfos) do
                local setting = preset.traits[info.id] or "Normal"
                for index, value in ipairs(SETTING_VALUES) do
                    if value == setting then
                        selectOnScreen(info, index)
                    end
                end
            end
        end
        if nameEntry.element then
            nameEntry.element:setText(preset and preset.name or "")
        end
    end

    -- Refresh the slot names (they are code-defined, so update both the option and the open screen)
    local function refreshSlotLabels()
        for slot = 1, PM_PRESET_SLOTS do
            slotCombo.values[slot] = slotLabel(slot)
        end
        local element = slotCombo.element
        if element then
            local selected = element.selected
            element:clear()
            for slot = 1, PM_PRESET_SLOTS do
                element:addOption(slotCombo.values[slot])
            end
            element.selected = selected
        end
    end

    options:addButton("PresetSave", getText("UI_PM_RandomizeTraits_Options_PresetSave"),
        getText("UI_PM_RandomizeTraits_Options_PresetSave_ToolTip"), function()
            local slot = getSelectedSlot()
            local name = nameEntry.element and nameEntry.element:getText() or nameEntry:getValue() or ""
            name = name:gsub("[|\r\n]", " "):match("^%s*(.-)%s*$")
            if name == "" then
                name = getText("UI_PM_RandomizeTraits_Preset_DefaultName") .. " " .. slot
            end

            -- Only non-Normal settings are stored; missing traits load as Normal
            local traits = {}
            for _, info in ipairs(traitInfos) do
                local setting = SETTING_VALUES[getOnScreen(info)]
                if setting and setting ~= "Normal" then
                    traits[info.id] = setting
                end
            end
            presets[slot] = { name = name, traits = traits }
            PM_savePresets(presets)
            refreshSlotLabels()
        end)

    -- Collect selectable traits (free traits are profession-only and never shown at character creation)
    local goodTraits = {}
    local badTraits = {}
    local labelCount = {}
    local allTraits = CharacterTraitDefinition.getTraits()
    for i = 0, allTraits:size() - 1 do
        local def = allTraits:get(i)
        if not def:isFree() then
            local traitID = PM_getTraitID(def)
            local info = { id = traitID, optionID = PM_getOptionID(traitID), label = def:getLabel() }
            labelCount[info.label] = (labelCount[info.label] or 0) + 1
            table.insert(traitInfos, info)
            if def:getCost() >= 0 then
                table.insert(goodTraits, info)
            else
                table.insert(badTraits, info)
            end
        end
    end

    local function byLabel(a, b)
        return a.label < b.label
    end
    table.sort(goodTraits, byLabel)
    table.sort(badTraits, byLabel)

    -- Add one Normal/Exclude/Preselect combobox per trait
    local function addTraitComboBoxes(title, traits)
        options:addSeparator()
        options:addTitle(title)
        for _, info in ipairs(traits) do
            local label = info.label
            -- Same label from different mods (e.g. base:tinkerer / toadtraits:tinkerer): show the namespace
            if labelCount[label] > 1 then
                label = label .. " (" .. (info.id:match("^([^:]+):") or info.id) .. ")"
            end
            local combo = options:addComboBox(info.optionID, label, getText("UI_PM_RandomizeTraits_TraitSetting_ToolTip"))
            combo:addItem(getText("UI_PM_RandomizeTraits_Setting_Normal"), true)
            combo:addItem(getText("UI_PM_RandomizeTraits_Setting_Exclude"))
            combo:addItem(getText("UI_PM_RandomizeTraits_Setting_Preselect"))
        end
    end
    addTraitComboBoxes(getText("UI_PM_RandomizeTraits_Title_GoodTraits"), goodTraits)
    addTraitComboBoxes(getText("UI_PM_RandomizeTraits_Title_BadTraits"), badTraits)

    -- Read option values into PM_RandomizeTraits settings (called by the game when options are applied)
    options.apply = function(self)
        PM_RandomizeTraits.settings.Preselect = self:getOption("Preselect"):getValue()
        PM_RandomizeTraits.settings.HardPreselect = self:getOption("HardPreselect"):getValue()
        PM_RandomizeTraits.settings.AutoReRandomize = self:getOption("AutoReRandomize"):getValue()

        for _, info in ipairs(traitInfos) do
            local index = self:getOption(info.optionID):getValue()
            PM_RandomizeTraits.traitSettings[info.id] = SETTING_VALUES[index] or "Normal"
        end
    end

    -- Expose applySettings so it can be called before randomizing
    PM_RandomizeTraits.applySettings = function()
        options:apply()
    end
end)

-- apply is not called on startup, and saved values are only restored after OnGameBoot
Events.OnMainMenuEnter.Add(function()
    if PM_RandomizeTraits.applySettings then
        PM_RandomizeTraits.applySettings()
    end
end)
