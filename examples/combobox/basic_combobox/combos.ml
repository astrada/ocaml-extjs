let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.form.field.ComboBox";
      Js.string "Ext.form.FieldSet";
      Js.string "Ext.tip.QuickTipManager";
      Js.string "Ext.data.*";
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let _ =
  (* Define the model for a State *)
  Ext.instance##define(
    Js.string "State", {|
      extend = Js.string "Ext.data.Model";
      fields = Js.array [|
        {| _type = Js.string "string"; name = Js.string "abbr" |};
        {| _type = Js.string "string"; name = Js.string "name" |};
        {| _type = Js.string "string"; name = Js.string "slogan" |};
      |];
    |},
    ExtUtils.undef)

(* The data for all states *)
let states = Js.array [|
  Js.Unsafe.inject {| abbr = Js.string "AL"; name = Js.string "Alabama"; slogan = Js.string "The Heart of Dixie" |};
  Js.Unsafe.inject {| abbr = Js.string "AK"; name = Js.string "Alaska"; slogan = Js.string "The Land of the Midnight Sun" |};
  Js.Unsafe.inject {| abbr = Js.string "AZ"; name = Js.string "Arizona"; slogan = Js.string "The Grand Canyon State" |};
  Js.Unsafe.inject {| abbr = Js.string "AR"; name = Js.string "Arkansas"; slogan = Js.string "The Natural State" |};
  Js.Unsafe.inject {| abbr = Js.string "CA"; name = Js.string "California"; slogan = Js.string "The Golden State" |};
  Js.Unsafe.inject {| abbr = Js.string "CO"; name = Js.string "Colorado"; slogan = Js.string "The Mountain State" |};
  Js.Unsafe.inject {| abbr = Js.string "CT"; name = Js.string "Connecticut"; slogan = Js.string "The Constitution State" |};
  Js.Unsafe.inject {| abbr = Js.string "DE"; name = Js.string "Delaware"; slogan = Js.string "The First State" |};
  Js.Unsafe.inject {| abbr = Js.string "DC"; name = Js.string "District of Columbia"; slogan = Js.string "The Nation's Capital" |};
  Js.Unsafe.inject {| abbr = Js.string "FL"; name = Js.string "Florida"; slogan = Js.string "The Sunshine State" |};
  Js.Unsafe.inject {| abbr = Js.string "GA"; name = Js.string "Georgia"; slogan = Js.string "The Peach State" |};
  Js.Unsafe.inject {| abbr = Js.string "HI"; name = Js.string "Hawaii"; slogan = Js.string "The Aloha State" |};
  Js.Unsafe.inject {| abbr = Js.string "ID"; name = Js.string "Idaho"; slogan = Js.string "Famous Potatoes" |};
  Js.Unsafe.inject {| abbr = Js.string "IL"; name = Js.string "Illinois"; slogan = Js.string "The Prairie State" |};
  Js.Unsafe.inject {| abbr = Js.string "IN"; name = Js.string "Indiana"; slogan = Js.string "The Hospitality State" |};
  Js.Unsafe.inject {| abbr = Js.string "IA"; name = Js.string "Iowa"; slogan = Js.string "The Corn State" |};
  Js.Unsafe.inject {| abbr = Js.string "KS"; name = Js.string "Kansas"; slogan = Js.string "The Sunflower State" |};
  Js.Unsafe.inject {| abbr = Js.string "KY"; name = Js.string "Kentucky"; slogan = Js.string "The Bluegrass State" |};
  Js.Unsafe.inject {| abbr = Js.string "LA"; name = Js.string "Louisiana"; slogan = Js.string "The Bayou State" |};
  Js.Unsafe.inject {| abbr = Js.string "ME"; name = Js.string "Maine"; slogan = Js.string "The Pine Tree State" |};
  Js.Unsafe.inject {| abbr = Js.string "MD"; name = Js.string "Maryland"; slogan = Js.string "Chesapeake State" |};
  Js.Unsafe.inject {| abbr = Js.string "MA"; name = Js.string "Massachusetts"; slogan = Js.string "The Spirit of America" |};
  Js.Unsafe.inject {| abbr = Js.string "MI"; name = Js.string "Michigan"; slogan = Js.string "Great Lakes State" |};
  Js.Unsafe.inject {| abbr = Js.string "MN"; name = Js.string "Minnesota"; slogan = Js.string "North Star State" |};
  Js.Unsafe.inject {| abbr = Js.string "MS"; name = Js.string "Mississippi"; slogan = Js.string "Magnolia State" |};
  Js.Unsafe.inject {| abbr = Js.string "MO"; name = Js.string "Missouri"; slogan = Js.string "Show Me State" |};
  Js.Unsafe.inject {| abbr = Js.string "MT"; name = Js.string "Montana"; slogan = Js.string "Big Sky Country" |};
  Js.Unsafe.inject {| abbr = Js.string "NE"; name = Js.string "Nebraska"; slogan = Js.string "Beef State" |};
  Js.Unsafe.inject {| abbr = Js.string "NV"; name = Js.string "Nevada"; slogan = Js.string "Silver State" |};
  Js.Unsafe.inject {| abbr = Js.string "NH"; name = Js.string "New Hampshire"; slogan = Js.string "Granite State" |};
  Js.Unsafe.inject {| abbr = Js.string "NJ"; name = Js.string "New Jersey"; slogan = Js.string "Garden State" |};
  Js.Unsafe.inject {| abbr = Js.string "NM"; name = Js.string "New Mexico"; slogan = Js.string "Land of Enchantment" |};
  Js.Unsafe.inject {| abbr = Js.string "NY"; name = Js.string "New York"; slogan = Js.string "Empire State" |};
  Js.Unsafe.inject {| abbr = Js.string "NC"; name = Js.string "North Carolina"; slogan = Js.string "First in Freedom" |};
  Js.Unsafe.inject {| abbr = Js.string "ND"; name = Js.string "North Dakota"; slogan = Js.string "Peace Garden State" |};
  Js.Unsafe.inject {| abbr = Js.string "OH"; name = Js.string "Ohio"; slogan = Js.string "The Heart of it All" |};
  Js.Unsafe.inject {| abbr = Js.string "OK"; name = Js.string "Oklahoma"; slogan = Js.string "Oklahoma is OK" |};
  Js.Unsafe.inject {| abbr = Js.string "OR"; name = Js.string "Oregon"; slogan = Js.string "Pacific Wonderland" |};
  Js.Unsafe.inject {| abbr = Js.string "PA"; name = Js.string "Pennsylvania"; slogan = Js.string "Keystone State" |};
  Js.Unsafe.inject {| abbr = Js.string "RI"; name = Js.string "Rhode Island"; slogan = Js.string "Ocean State" |};
  Js.Unsafe.inject {| abbr = Js.string "SC"; name = Js.string "South Carolina"; slogan = Js.string "Nothing Could be Finer" |};
  Js.Unsafe.inject {| abbr = Js.string "SD"; name = Js.string "South Dakota"; slogan = Js.string "Great Faces;  Great Places" |};
  Js.Unsafe.inject {| abbr = Js.string "TN"; name = Js.string "Tennessee"; slogan = Js.string "Volunteer State" |};
  Js.Unsafe.inject {| abbr = Js.string "TX"; name = Js.string "Texas"; slogan = Js.string "Lone Star State" |};
  Js.Unsafe.inject {| abbr = Js.string "UT"; name = Js.string "Utah"; slogan = Js.string "Salt Lake State" |};
  Js.Unsafe.inject {| abbr = Js.string "VT"; name = Js.string "Vermont"; slogan = Js.string "Green Mountain State" |};
  Js.Unsafe.inject {| abbr = Js.string "VA"; name = Js.string "Virginia"; slogan = Js.string "Mother of States" |};
  Js.Unsafe.inject {| abbr = Js.string "WA"; name = Js.string "Washington"; slogan = Js.string "Green Tree State" |};
  Js.Unsafe.inject {| abbr = Js.string "WV"; name = Js.string "West Virginia"; slogan = Js.string "Mountain State" |};
  Js.Unsafe.inject {| abbr = Js.string "WI"; name = Js.string "Wisconsin"; slogan = Js.string "America's Dairyland" |};
  Js.Unsafe.inject {| abbr = Js.string "WY"; name = Js.string "Wyoming"; slogan = Js.string "Like No Place on Earth" |};
|]

let createStore () =
  (* The data store holding the states; shared by each of the ComboBox
   * examples below *)
  Ext.instance##create(Js.def (Js.string "Ext.data.Store"), Js.def {|
    autoDestroy = Js._true;
    model = Js.string "State";
    data = states;
  |})

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      (Ext_tip_QuickTipManager.get_instance ())##init(
        Js.undefined,
        Js.undefined);

      (* Simple ComboBox using the data store *)
      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.form.field.ComboBox"), Js.def {|
          fieldLabel = Js.string "Select a single state";
          renderTo = Js.string "simpleCombo";
          displayField = Js.string "name";
          width = 320;
          labelWidth = 130;
          store = createStore ();
          queryMode = Js.string "local";
          typeAhead = Js._true;
        |}) in

      (* ComboBox with a custom item template *)
      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.form.field.ComboBox"), Js.def {|
          fieldLabel = Js.string "Select a single state";
          renderTo = Js.string "customTplCombo";
          displayField = Js.string "name";
          width = 320;
          labelWidth = 130;
          store = createStore ();
          queryMode = Js.string "local";

          listConfig = {|
            getInnerTpl = Js.wrap_callback (fun () ->
              Js.string "<div data-qtip=\"{name}. {slogan}\">{name} ({abbr})</div>";
            );
          |};
        |}) in

      (* ComboBox with multiple selection enabled *)
      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.form.field.ComboBox"), Js.def {|
          fieldLabel = Js.string "Select multiple states";
          renderTo = Js.string "multiSelectCombo";
          multiSelect = Js._true;
          displayField = Js.string "name";
          width = 320;
          labelWidth = 130;
          store = createStore ();
          queryMode = Js.string "local";
        |}) in

      (* ComboBox transformed from HTML select *)
      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.form.field.ComboBox"), Js.def {|
          typeAhead = Js._true;
          transform = Js.string "stateSelect";
          width = 135;
          forceSelection = Js._true;
        |}) in


      (* Collapsible code panels; ignore: *)

      Ext.instance##select(
        Js.string "pre.code",
        Js.undefined)##each(Js.wrap_callback (fun pre ->
          Ext.instance##create(Js.def (Js.string "Ext.form.FieldSet"), Js.def {|
            contentEl = pre;
            renderTo = pre##parent();
            title = Js.string "View code for this example";
            collapsible = Js._true;
            collapsed = Js._true;
          |})),
          Js.undefined
        );

    ),
    ExtUtils.undef,
    ExtUtils.undef)

