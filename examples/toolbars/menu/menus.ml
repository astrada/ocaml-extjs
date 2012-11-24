let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.tip.QuickTipManager";
      Js.string "Ext.menu.*";
      Js.string "Ext.form.field.ComboBox";
      Js.string "Ext.layout.container.Table";
      Js.string "Ext.container.ButtonGroup"
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let ext_example_msg args =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.example.msg")
    args

(* functions to display feedback*)
let onButtonClick btn _ =
  ext_example_msg
    [|Js.Unsafe.inject (Js.string "Button Click");
      Js.Unsafe.inject (Js.string "You clicked the \"{0}\" button.");
      Js.Unsafe.inject btn##text
    |]

let onItemClick item _ =
  ext_example_msg
    [|Js.Unsafe.inject (Js.string "Menu Click");
      Js.Unsafe.inject (Js.string "You clicked the \"{0}\" menu item.");
      Js.Unsafe.inject item##text
    |]

let onItemCheck item checked =
  ext_example_msg
    [|Js.Unsafe.inject (Js.string "Item Check");
      Js.Unsafe.inject (Js.string "You {1} the \"{0}\" menu item.");
      Js.Unsafe.inject item##text;
      Js.Unsafe.inject (if Js.to_bool checked then Js.string "checked" else Js.string "unchecked")
    |]

let onItemToggle item pressed =
  ext_example_msg
    [|Js.Unsafe.inject (Js.string "Button Toggled");
      Js.Unsafe.inject (Js.string "Button \"{0}\" was toggled to {1}.");
      Js.Unsafe.inject item##text;
      Js.Unsafe.inject pressed
    |]

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      (Ext_tip_QuickTipManager.get_instance ())##init(
        Js.undefined,
        Js.undefined);

      let dateMenu =
        Ext.instance##create(
          Js.def (Js.string "Ext.menu.DatePicker"), Js.def ({|
            handler = Js.wrap_callback (fun dp date ->
              ext_example_msg
                [|Js.Unsafe.inject (Js.string "Date Selected");
                  Js.Unsafe.inject (Js.string "You choose {0}.");
                  Js.Unsafe.inject Ext_Date.instance##format(date, Js.string "M j, Y")
                |]
            )
          |})) in

      let colorMenu =
        Ext.instance##create(
          Js.def (Js.string "Ext.menu.ColorPicker"), Js.def ({|
            handler = Js.wrap_callback (fun cm color _ ->
              ext_example_msg
                [|Js.Unsafe.inject (Js.string "Color Selected");
                  Js.Unsafe.inject (Js.string "<span style=\"color:#")##concat_2(color, Js.string ";\">You choose {0}.</span>");
                  Js.Unsafe.inject color
                |]
            )
          |})) in

      let store =
        Ext.instance##create(
          Js.def (Js.string "Ext.data.ArrayStore"), Js.def ({|
            fields = Js.array [|Js.string "abbr"; Js.string "state"|];
            data = Js.Unsafe.variable "Ext.example.states"
          |})) in

      let combo =
        Ext.instance##create(
          Js.def (Js.string "Ext.form.field.ComboBox"), Js.def ({|
            hideLabel = Js._true;
            store = store;
            displayField = Js.string "state";
            typeAhead = Js._true;
            queryMode = Js.string "local";
            triggerAction = Js.string "all";
            emptyText = Js.string "Select a state...";
            selectOnFocus = Js._true;
            width = 135;
            iconCls = Js.string "no-icon"
          |})) in

      let menu =
        Ext.instance##create(
          Js.def (Js.string "Ext.menu.Menu"), Js.def ({|
            id = Js.string "mainMenu";
            style = {|
              overflow = Js.string "visible"     (* For the Combo popup *)
            |};
            items = Js.array [|
              Js.Unsafe.inject combo;                  (* A Field in a Menu *)
              Js.Unsafe.inject {|
                text = Js.string "I like Ext";
                checked = Js._true;       (* when checked has a boolean value, it is assumed to be a CheckItem *)
                checkHandler = Js.wrap_callback onItemCheck
              |};
              Js.Unsafe.inject (Js.string "-");
              Js.Unsafe.inject {|
                text = Js.string "Radio Options";
                menu = {|        (* <-- submenu by nested config object *)
                  items = Js.array [|
                    (* stick any markup in a menu *)
                    Js.Unsafe.inject
                      (Js.string "<b class=\"menu-title\">Choose a Theme</b>");
                    Js.Unsafe.inject {|
                      text = Js.string "Aero Glass";
                      checked = Js._true;
                      group = Js.string "theme";
                      checkHandler = Js.wrap_callback onItemCheck
                    |};
                    Js.Unsafe.inject {|
                      text = Js.string "Vista Black";
                      checked = Js._false;
                      group = Js.string "theme";
                      checkHandler = Js.wrap_callback onItemCheck
                    |};
                    Js.Unsafe.inject {|
                      text = Js.string "Gray Theme";
                      checked = Js._false;
                      group = Js.string "theme";
                      checkHandler = Js.wrap_callback onItemCheck
                    |};
                    Js.Unsafe.inject {|
                      text = Js.string "Default Theme";
                      checked = Js._false;
                      group = Js.string "theme";
                      checkHandler = Js.wrap_callback onItemCheck
                    |};
                  |]
                |}
              |};
              Js.Unsafe.inject {|
                text = Js.string "Choose a Date";
                iconCls = Js.string "calendar";
                menu = dateMenu (* <-- submenu by reference *)
              |};
              Js.Unsafe.inject {|
                text = Js.string "Choose a Color";
                menu = colorMenu (* <-- submenu by reference *)
              |};
            |]
        |})) in

      let tb =
        Ext.instance##create(Js.def (Js.string "Ext.toolbar.Toolbar"),
                             Js.undefined)
      in
      tb##render(Js.string "toolbar");
      tb##suspendLayouts();

      let _ =
        Js.Unsafe.meth_call tb "add" [|
          Js.Unsafe.inject {|
            text = Js.string "Button w/ Menu";
            iconCls = Js.string "bmenu";  (* <-- icon *)
            menu = menu  (* assign menu by instance *)
          |};
          Js.Unsafe.inject {|
            text = Js.string "Users";
            iconCls = Js.string "user";
            menu = {|
              xtype = Js.string "menu";
              plain = Js._true;
              items = {|
                xtype = Js.string "buttongroup";
                title = Js.string "User options";
                columns = 2;
                defaults = {|
                  xtype = Js.string "button";
                  scale = Js.string "large";
                  iconAlign = Js.string "left"
                |};
                items = Js.array [|
                  Js.Unsafe.inject {|
                    text = Js.string "User<br/>manager";
                    iconCls = Js.string "edit";
                    width = 90
                  |};
                  Js.Unsafe.inject {|
                    iconCls = Js.string "add";
                    tooltip = Js.string "Add user";
                    width = 40
                  |};
                  Js.Unsafe.inject {|
                    colspan = 2;
                    text = Js.string "Import";
                    scale = Js.string "small";
                    width = 130
                  |};
                  Js.Unsafe.inject {|
                    colspan = 2;
                    text = Js.string "Who is online?";
                    scale = Js.string "small";
                    width = 130
                  |};
                |]
              |}
            |}
          |};
          Js.Unsafe.inject (
            Ext.instance##create(
              Js.def (Js.string "Ext.button.Split"), Js.def {|
                text = Js.string "Split Button";
                handler = Js.wrap_callback onButtonClick;
                tooltip = {|
                  text = Js.string "This is a an example QuickTip for a toolbar item";
                  title = Js.string "Tip Title"
                |};
                iconCls = Js.string "blist";
                (* Menus can be built/referenced by using nested menu config objects *)
                menu = {|
                  items = Js.array [|
                    Js.Unsafe.inject {|
                      text = Js.string "<b>Bold</b>";
                      handler = Js.wrap_callback onItemClick
                    |};
                    Js.Unsafe.inject {|
                      text = Js.string "<i>Italic</i>";
                      handler = Js.wrap_callback onItemClick
                    |};
                    Js.Unsafe.inject {|
                      text = Js.string "<u>Underline</u>";
                      handler = Js.wrap_callback onItemClick
                    |};
                    Js.Unsafe.inject (Js.string "-");
                    Js.Unsafe.inject {|
                      text = Js.string "Pick a Color";
                      handler = Js.wrap_callback onItemClick;
                      menu = {|
                        showSeparator = Js._false;
                        items = Js.array [|
                          Js.Unsafe.inject (
                            Ext.instance##create(
                              Js.def (Js.string "Ext.ColorPalette"), Js.def {|
                                listeners = {|
                                  select = Js.wrap_callback (fun cp color _ ->
                                    ext_example_msg
                                      [|Js.Unsafe.inject (Js.string "Color Selected");
                                        Js.Unsafe.inject (Js.string "You chose {0}.");
                                        Js.Unsafe.inject color
                                      |]
                                  )
                                |}
                            |}));
                          Js.Unsafe.inject (Js.string "-");
                          Js.Unsafe.inject {|
                            text = Js.string "More Colors...";
                            handler = Js.wrap_callback onItemClick
                          |}
                        |]
                      |}
                    |};
                    Js.Unsafe.inject {|
                      text = Js.string "Extellent!";
                      handler = Js.wrap_callback onItemClick
                    |}
                  |]
                |}
              |}));
          Js.Unsafe.inject (Js.string "-");
          Js.Unsafe.inject {|
            text = Js.string "Toggle Me";
            enableToggle = Js._true;
            toggleHandler = Js.wrap_callback onItemToggle;
            pressed = Js._true
          |}
        |] in

      let _ =
        menu##add(Js.Unsafe.inject (Js.string " ")) in

      (* Menus have a rich api for
       * adding and removing elements dynamically *)
      let item = menu##add(Js.Unsafe.inject {|
        text = Js.string "Dynamically added Item"
      |}) in
      (* items support full Observable API *)
      item##on(Js.string "click", Js.wrap_callback onItemClick);

      (* items can easily be looked up *)
      let _ =
        menu##add(Js.Unsafe.inject {|
          text = Js.string "Disabled Item";
          id = Js.string "disableMe"  (* <-- Items can also have an id for easy lookup *)
          (* disabled = Js._true   <-- allowed but for sake of example we use long way below *)
        |}) in
      (* access items by id or index *)
      menu##items##get(Js.string "disableMe")##disable();

      (* They can also be referenced by id in or components *)
      let _ =
        Js.Unsafe.meth_call tb "add" [|
          Js.Unsafe.inject (Js.string "-");
          Js.Unsafe.inject {|
            icon = Js.string "list-items.gif"; (* icons can also be specified inline *)
            cls = Js.string "x-btn-icon";
            tooltip = Js.string "<b>Quick Tips</b><br/>Icon only button with tooltip<br><b>Activated on mousedown</b>";
            clickEvent = Js.string "mousedown";
            handler = Js.wrap_callback (fun _ _ ->
              ext_example_msg
                [|Js.Unsafe.inject (Js.string "Button Click");
                  Js.Unsafe.inject (Js.string "You clicked the \"icon only\" button.")
                |]
            )
          |};
          Js.Unsafe.inject (Js.string "-")
        |] in

      let scrollMenu =
        Ext.instance##create(Js.def (Js.string "Ext.menu.Menu"), Js.undefined)
      in
      for i = 0 to 49 do
        scrollMenu##add(Js.Unsafe.inject {|
          text = (Js.string "Item ")##concat((Js.number_of_float (float_of_int (i + 1)))##toString());
          handler = Js.wrap_callback onItemClick
        |});
      done;
      (* scrollable menu *)
      tb##add(Js.Unsafe.inject {|
        icon = Js.string "preview.png";
        cls = Js.string "x-btn-text-icon";
        text = Js.string "Scrolling Menu";
        menu = scrollMenu
      |});

      tb##add(Js.Unsafe.inject {|
        text = Js.string "Link";
        url = Js.string "http://www.google.com/search";
        baseParams = {|
          q = Js.string "html+anchor+tag"
        |};
        tooltip = Js.string "This is a link. You can right click. You can see where it will take you"
      |});

      (* add a combobox to the toolbar *)
      let combo =
        Ext.instance##create(
          Js.def (Js.string "Ext.form.field.ComboBox"), Js.def ({|
            hideLabel = Js._true;
            store = store;
            displayField = Js.string "state";
            typeAhead = Js._true;
            queryMode = Js.string "local";
            triggerAction = Js.string "all";
            emptyText = Js.string "Select a state...";
            selectOnFocus = Js._true;
            width = 135
          |})) in
      tb##add(Js.Unsafe.inject combo);
      tb##resumeLayouts(Js._true);
    ),
    ExtUtils.undef,
    ExtUtils.undef)

