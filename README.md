## Information

This mod enhances the 'Random' button in the character selection screen of Project Zomboid. Its main features are as follows:

- You can pre-determine traits to be completely excluded from the selection pool of existing traits.
- You can pre-determine traits you always want included in the result from existing traits.

This mod can be utilized in various ways through three checkboxes and a setting for each trait in the game options.

- Build 41: Open 'Options' and go to the 'Mods' tab (provided by the ModOptions mod).
- Build 42: Open 'Options', go to the 'MODS' tab, and select 'Randomize Traits with Conditions'.

Below the three checkboxes, every trait has its own setting: Normal, Exclude, or Preselect. In Build 42, the traits are grouped into 'Positive Traits' and 'Negative Traits' and sorted by name.

The first checkbox, 'Enable Preselect/Exclude', is checked by default. It allows you to choose which traits to include or exclude from the random process using the Exclude, Normal, and Preselect options (Normal: Include, Exclude: Exclude). When the Preselect option is used, it ensures that trait is always included in the resulting character.

The second checkbox, 'Always Include Preselected Traits', asks whether to activate the Preselect option. This option ensures that the preselected traits are always included in the final result. If this option is unchecked, the randomisation algorithm will endeavour to include the preselected traits as much as possible; however, some of the preselected traits may often be omitted from the final result. It functions correctly only if the first checkbox is checked beforehand. If you do not wish to use Preselect, you can uncheck this box.

The third checkbox, 'Auto Re-Randomize on Profession Change', ensures that if you change a profession during character selection, existing traits would be incompatible with the new profession. So this checkbox option will cause the originally selected traits to be randomly changed again automatically with the profession change. It is checked by default, and it is recommended to leave it as checked.

Build 41 and Build 42 save their settings separately. Settings you made in Build 41 will not carry over to Build 42, so you need to set them again.

In Build 42, if two traits share the same name, the source of the trait is shown after its name in the settings (e.g., 'Tinkerer (toadtraits)' for the More Traits Definitive Edition mod).

In Build 42, profession-only traits are not listed in the settings, since they cannot be chosen on the character creation screen.

### Special notes

If you Preselect two traits that cannot be held together, only positive traits will ever be selected (e.g., 'Brave' and 'Cowardly'). Please also note that if both traits are positive but incompatible ('Strong' and 'Stout') or both are negative but incompatible ('Unfit' and 'Out of Shape'), only one will be automatically selected based on their order in the trait array.

Traits that cannot be possessed by the randomly determined profession will not be selected, even if they are Preselected.

## Known Issues

Nothing yet.

## Mod Compatibility

### Version

Build 41, Build 42 (42.13.0+)

### Required mods

- ModOptions (Build 41)

### Compatible mods

It is implemented to be compatible with most mods that add traits. The list below only includes mods that have been verified, however.

- More Traits (Build 41)
- More Traits Definitive Edition (Build 42)

## Opening the project code to the community

The Mod is available on GitHub for others to contribute.

https://github.com/PajaritoMoyqi/MOD_Public-Project_Zomboid-Randomize_Traits_with_Conditions

At github link, you will find each version of the mod as I continue to build.

Regular updates will be posted to the Steam Workshop when appropriate.

## Authors

### Creators

PajaritoMoyqi - main mod

### Translations

English: PajaritoMoyqi<br>
Korean: PajaritoMoyqi<br>
Spanish(ES): PajaritoMoyqi<br>
Spanish(AR): PajaritoMoyqi<br>
Japanese: PajaritoMoyqi<br>

## ID

Workshop ID: 3828709874<br>
Mod ID: PM_RandomizeTraitsWithConditions<br>



## 정보

이 모드는 프로젝트 좀보이드의 캐릭터 선택창에 있는 특성 '랜덤' 버튼을 훨씬 다채롭게 해줍니다. 주요 기능은 다음과 같습니다.

- 존재하는 특성들 중 선택지에서 아예 제외할 특성을 미리 고를 수 있습니다.
- 존재하는 특성들 중 항상 결과에 포함되었으면 하는 특성을 미리 고를 수 있습니다.

이 모드는 게임 옵션에 있는 세 개의 체크박스와 각 특성에 대한 설정을 통해 다양한 방식으로 활용할 수 있습니다.

- 빌드 41: '옵션'을 열고 '모드' 탭으로 이동합니다(ModOptions 모드에서 제공).
- 빌드 42: '옵션'을 열고 'MODS' 탭으로 이동한 후, '조건에 따른 특성 무작위 지정'을 선택하세요.

세 개의 체크박스 아래에는 각 특성마다 'normal', 'exclude', 'preselect'이라는 별도의 설정이 있습니다. 빌드 42에서는 특성이 '긍정적 특성'과 '부정적 특성'으로 분류되어 이름 순으로 정렬되어 있습니다.

첫 번째 체크박스 'Preselect, Exclude 활성화'는 기본적으로 체크되어 있으며, Exclude, Normal, Preselect 옵션을 사용하여 랜덤 과정에 어떤 특성을 포함하고 제외할지를 고를 수 있으며(Normal: 포함, Exclude: 제외), Preselect 옵션을 사용하게 되면 랜덤의 결과로 나온 캐릭터에 항상 그 특성이 포함되도록 합니다.

두 번째 체크박스 '무조건 결과에 포함될 특성 고르기'는 Preselect 옵션을 활성화할 것인지를 묻는 것입니다. 이 옵션을 켜면 Preselect한 특성이 무조건 결과에 포함됩니다. 만일 이 옵션의 체크박스를 해제하면 랜덤 알고리즘은 preselect된 특성을 먼저 결과값에 넣기 위해 노력하겠지만, 종종 최종 결과에서 preselect된 특성 몇 가지가 빠지는 경우가 생기게 됩니다. 이 옵션은 첫 번째 체크박스가 선행적으로 체크되어 있어야만 정상 동작하며, 만일 Preselect는 사용하고 싶지 않다면 이 체크박스를 해제하여도 됩니다.

세 번째 체크박스 '직업 변경시 특성 자동 재랜덤'을 체크해두면, 특성 선택 중 직업을 바꾸는 경우 해당 직업이 가질 수 없는 특성이 있을 수도 있기 때문에 원래 선택되었던 특성이 다시 랜덤하게 바뀌도록 합니다. 디폴트로 체크되어 있으며, 체크된 채로 두는 것을 권장합니다.

빌드 41과 빌드 42는 설정을 별도로 저장합니다. 빌드 41에서 설정한 내용은 빌드 42에 연결되지 않으므로, 다시 설정해야 합니다.

빌드 42에서는 두 가지 특성이 같은 이름을 가질 경우, 설정 화면에서 특성 이름 뒤에 해당 특성의 출처가 표시됩니다(예: 'More Traits Definitive Edition' 모드의 경우 'Tinkerer (toadtraits)').

빌드 42에서는 직업 전용 특성이 캐릭터 생성 화면에서 선택할 수 없기 때문에 설정 목록에 표시되지 않습니다.

### 특이사항

만일 같이 보유하는 것이 불가능한 두 특성을 Preselect로 해둔다면, 항상 긍정적인 특성만 뽑힙니다(예를 들어 '용감함'과 '겁쟁이'). 둘 다 긍정적인 특성인데 양립할 수 없거나('튼튼함'과 '통통함') 둘 다 부정적인 특성인데 양립할 수 없으면('건강 이상'과 '비실함') 특성 배열 내 순서에 따라 자동적으로 하나만 뽑히게 되니 또한 유의하시기 바랍니다.

랜덤으로 결정된 직업이 가질 수 없는 특성은 Preselect를 했더라도 뽑히지 않습니다.

## 알려진 이슈

현재는 없습니다.

## 모드 호환성

### 버전

41 빌드, 42 빌드 (42.13.0+)

### 선행 모드

- ModOptions (Build 41)

### 호환 모드

특성을 추가하는 대부분의 모드와 호환되도록 구현되어 있습니다. 아래 적힌 것은 실제 확인이 끝난 모드들을 적었을 뿐입니다.

- More Traits (Build 41)
- More Traits Definitive Edition (Build 42)

## 프로젝트 코드가 공개되어 있습니다

해당 모드의 코드는 깃허브에서 찾아보실 수 있습니다.

https://github.com/PajaritoMoyqi/MOD_Public-Project_Zomboid-Randomize_Traits_with_Conditions

깃허브 링크에 가면 각 버전 및 제가 어떻게 빌드해왔는지에 대해 코드로 확인하실 수 있습니다.

정식 업데이트는 테스트를 거쳐 적절한 시기에 Steam Workshop으로 배포합니다.

## 저자

### 코드 작성자

PajaritoMoyqi - 메인 모드

### 번역

영어: PajaritoMoyqi<br>
한국어: PajaritoMoyqi<br>
스페인어(스페인): PajaritoMoyqi<br>
스페인어(아르헨티나): PajaritoMoyqi<br>
일본어: PajaritoMoyqi<br>

## ID

Workshop ID: 3828709874<br>
Mod ID: PM_RandomizeTraitsWithConditions<br>



## Información

Este mod mejora el botón «ALEATORIO» de la pantalla de selección de personajes de Project Zomboid. Sus principales características son las siguientes:

- Puedes predeterminar los rasgos que deseas excluir por completo del conjunto de rasgos existentes.
- Puedes predeterminar los rasgos que siempre deseas incluir en el resultado a partir de los rasgos existentes.

Este mod se puede utilizar de diversas maneras mediante tres casillas de selección y una configuración para cada rasgo en las opciones del juego.

- Versión 41: Abre «Opciones» y ve a la pestaña «Mods» (proporcionada por el mod ModOptions).
- Versión 42: Abre «Opciones», ve a la pestaña «MODS» y selecciona «Aleatorizar rasgos con condiciones».

Debajo de las tres casillas de selección, cada rasgo tiene su propio ajuste: normal, exclude o preselect. En la versión 42, los rasgos se agrupan en «Rasgos positivos» y «Rasgos negativos» y se ordenan por nombre.

La primera casilla, «Activar Preselect/Exclude», está marcada de forma predeterminada. Te permite elegir qué rasgos incluir o excluir del proceso aleatorio utilizando las opciones Excluir, Normal(Normal: incluir, Exclude: excluir) y Preselect. Cuando se utiliza la opción Preselect, se garantiza que ese rasgo se incluya siempre en el personaje resultante.

La segunda casilla, «Siempre incluir rasgos preseleccionados», pregunta si se desea activar la opción Preselect. Esta casilla garantiza que los rasgos preseleccionados siempre se incluyan en el resultado final. Si esta casilla no está marcada, el algoritmo de aleatorización intentará incluir los rasgos preseleccionados en la medida de lo posible; sin embargo, es probable que algunos de ellos se omitan con frecuencia en el resultado final. Solo funciona correctamente si la primera casilla está marcada previamente. Si no deseas utilizar Preselect, puedes desmarcar esta casilla.

La tercera casilla, «Re-aleatorizar al cambiar de profesion», garantiza que, si cambia de profesión durante la selección del personaje, los rasgos existentes serán incompatibles con la nueva profesión. Por lo tanto, esta casilla hará que los rasgos seleccionados originalmente se cambien aleatoriamente de nuevo de forma automática con el cambio de profesión. Está marcada de forma predeterminada y se recomienda dejarla marcada.

Las versiones 41 y 42 guardan sus configuraciones por separado. Las configuraciones que hayas realizado en la versión 41 no se transferirán a la versión 42, por lo que deberás volver a configurarlas.

En la versión 42, si dos rasgos comparten el mismo nombre, la fuente del rasgo se muestra después de su nombre en la configuración (por ejemplo, «Tinkerer (toadtraits)» para el mod de More Traits Definitive Edition).

En la versión 42, los rasgos exclusivos de profesiones no aparecen en la lista de configuraciones, ya que no se pueden seleccionar en la pantalla de creación de personajes.

### Notas especiales

Si preseleccionas dos rasgos que no pueden combinarse, solo se seleccionarán los rasgos positivos (por ejemplo, «Valiente» y «Cobarde»). Ten en cuenta también que si ambos rasgos son positivos pero incompatibles («Fuerte» y «Robusto») o ambos son negativos pero incompatibles («En mala forma» y «Fuera de forma»), solo se seleccionará uno automáticamente en función de su orden en la matriz de rasgos.

Los rasgos que no pueden poseer las profesiones determinadas aleatoriamente no se seleccionarán, aunque estén preseleccionados(Preselect).

## Problemas conocidos

Ninguno por ahora.

## Compatibilidad con mods

### Versión

Build 41, Build 42 (42.13.0+)

### Mods necesarios

- ModOptions (Build 41)

### Mods compatibles

Está implementado para ser compatible con la mayoría de los mods que añaden rasgos. Sin embargo, la siguiente lista solo incluye los mods que han sido verificados.

- More Traits (Build 41)
- More Traits Definitive Edition (Build 42)

## Opening the project code to the community

El mod está disponible en GitHub para que otros puedan contribuir.

https://github.com/PajaritoMoyqi/MOD_Public-Project_Zomboid-Randomize_Traits_with_Conditions

En el enlace de GitHub encontrarás cada versión del mod a medida que voy desarrollándolo.

Las actualizaciones periódicas se publicarán en Steam Workshop cuando sea oportuno.

## Autores

### Creadores

PajaritoMoyqi - mod principal

### Traducciones

Inglés: PajaritoMoyqi<br>
Coreano: PajaritoMoyqi<br>
Español(ES): PajaritoMoyqi<br>
Español(AR): PajaritoMoyqi<br>
Japonés: PajaritoMoyqi<br>

## ID

Workshop ID: 3828709874<br>
Mod ID: PM_RandomizeTraitsWithConditions<br>



## 情報

このモードは、プロジェクト・ゾンボイドのキャラクター選択画面にある特性「ランダム」ボタンを大幅に多彩にします。主な機能は以下の通りです。

- 存在する特性の中の選択肢から完全に除外する特性を事前に選択できます。
- 存在する特性の中から常に結果に含めたい特性を事前に選択できます。

このMODは、3つのチェックボックスと、ゲームオプション内の各特性ごとの設定を通じて、さまざまな方法で利用できます。

- ビルド41：「オプション」を開き、「MOD」タブに移動します（ModOptions MODによる機能）。
- ビルド42：「オプション」を開き、「MODS」タブに移動して、「条件付きで特性をランダム化」を選択します。

3つのチェックボックスの下には、各特性ごとに「normal」、「exclude」、「preselect」という設定があります。ビルド42では、特性は「ポジティブ特性」と「ネガティブ特性」に分類され、名前順に並べ替えられています。

最初のチェックボックス「Preselect/Excludeを有効化」はデフォルトでチェックされており、Exclude、Normal、Preselectのオプションを使用してランダム過程にどの特性を包含・除外するかを選択できます（Normal：包含、Exclude：除外）。Preselectオプションを使用すると、ランダム結果として出たキャラクターに必ずその特性が含まれるようになります。

二つ目のチェックボックス「事前選択した特性を常に含める」は、Preselectオプションを有効化するかどうかを問うものです。このオプションをオンにすると、Preselectした特性が必ず結果に含まれます。もしこのオプションのチェックボックスをオフにすると、ランダムアルゴリズムはプリセレクトされた特性を優先的に結果に含めようとしますが、最終結果からプリセレクトされた特性のいくつかが除外されてしまうことがしばしばあります。正常に動作するには、最初のチェックボックスが事前にチェックされている必要があります。プリセレクトを使用しない場合は、このチェックボックスをオフにできます。

三つ目のチェックボックス「職業変更時に自動で再ランダム」をオンにすると、特性選択中に職業を変更した場合、その職業が持てない特性がある可能性があるため、元々選択されていた特性が再びランダムに変更されます。デフォルトでオンになっており、オンのままにしておくことを推奨します。

ビルド41とビルド42では、設定が別々に保存されます。ビルド41で行った設定はビルド42には引き継がれないため、再度設定を行う必要があります。

ビルド42では、2つの特性が同じ名前を持つ場合、設定画面では名前の後にその特性の出典が表示されます（例：「More Traits Definitive Edition」モードの場合は「Tinkerer (toadtraits)」）。

Build 42 では、職業限定の特性はキャラクター作成画面で選択できないため、設定画面には表示されません。

### 特記事項

同時に所持できない二つの特性をPreselectに設定した場合、常に肯定的な特性のみが選択されます（例：「勇敢」と「臆病」）。両方が肯定的特性で両立不可能の場合（「丈夫」と「強靭」）や、両方が否定的特性で両立不可能の場合（「不調」と「不調気味」）は、特性配列内の順序に従って自動的に一つだけが選ばれるため、こちらもご注意ください。

ランダムに決定された職業が持つことができない特性は、プリセレクトを設定していても選ばれません。

## 既知の問題

現在はありません。

## モード互換性

### バージョン

41 ビルド、42 ビルド（42.13.0+）

### 先行モード

- ModOptions (Build 41)

### 互換モード

特性を追加するほとんどのモードと互換性があるように実装されています。以下に記載したのは実際に確認が完了したモードのみです。

- More Traits (Build 41)
- More Traits Definitive Edition (Build 42)

## プロジェクトコードが公開されています

当モードのコードはGitHubでご覧いただけます。

https://github.com/PajaritoMoyqi/MOD_Public-Project_Zomboid-Randomize_Traits_with_Conditions

GitHubリンクにアクセスすると、各バージョンおよびビルド方法についてコードで確認できます。

正式アップデートはテストを経て、適切な時期にSteam Workshopで配布します。

## 著者

### コード作成者

PajaritoMoyqi　ー　メインMOD

### 翻訳

英語：PajaritoMoyqi<br>
韓国語：PajaritoMoyqi<br>
スペイン語(スペイン)：PajaritoMoyqi<br>
スペイン語(アルゼンチン)：PajaritoMoyqi<br>
日本語：PajaritoMoyqi<br>

## ID

Workshop ID: 3828709874<br>
Mod ID: PM_RandomizeTraitsWithConditions<br>