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

    -- Collect selectable traits (free traits are profession-only and never shown at character creation)
    local traitInfos = {}
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
