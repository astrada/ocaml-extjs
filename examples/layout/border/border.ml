let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.window.Window";
      Js.string "Ext.container.Viewport"
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      let cw =
        Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
          xtype = Js.string "window";
          closable = Js._false;
          minimizable = Js._true;
          title = Js.string "Constrained Window";
          height = 200;
          width = 400;
          constrain = Js._true;
          html = Js.string "I am in a Container";
          itemId = Js.string "center-window";
          minimize = Js.wrap_meth_callback (fun this () ->
            this##floatParent##down(Js.string "button#toggleCw")##toggle();
          );
        |})
      in

      let newRegions = Js.array [|
        Js.Unsafe.inject {|
          region = Js.string "north";
          title = Js.string "North 2";
          height = 100;
          collapsible = Js._true;
          weight = -120;
        |};
        Js.Unsafe.inject {|
          region = Js.string "east";
          title = Js.string "East 2";
          width = 100;
          collapsible = Js._true;
          weight = -110;
        |};
        Js.Unsafe.inject {|
          region = Js.string "west";
          title = Js.string "West 2";
          width = 100;
          collapsible = Js._true;
          weight = -110;
        |};
      |]
      in

      ExtUtils.set_global "viewport" Js.undefined;

      let closeRegion e target header tool =
        let region = header##ownerCt in
        ignore (newRegions##unshift(region##initialConfig));
        (ExtUtils.get_global "viewport")##remove(region)
      in

      ExtUtils.set_global "viewport"
        (Ext.instance##create(Js.def (Js.string "Ext.Viewport"), Js.def {|
          layout = {|
            _type = Js.string "border";
            padding = 5;
          |};
          defaults = {|
            split = Js._true
          |};
          items = Js.array [|
            Js.Unsafe.inject {|
              region = Js.string "north";
              collapsible = Js._true;
              title = Js.string "North";
              split = Js._true;
              height = 100;
              minHeight = 60;
              html = Js.string "north"
            |};
            Js.Unsafe.inject {|
              region = Js.string "west";
              collapsible = Js._true;
              title = Js.string "Starts at width 30%";
              split = Js._true;
              width = Js.string "30%";
              minWidth = 100;
              minHeight = 140;
              html = Js.string "west<br>I am floatable"
            |};
            Js.Unsafe.inject {|
              region = Js.string "center";
              html = Js.string "center center";
              title = Js.string "Center";
              minHeight = 80;
              items = Js.array [|cw|];
              bbar = Js.array [|
                Js.Unsafe.inject (Js.string "Text followed by a spacer");
                Js.Unsafe.inject (Js.string " ");
                Js.Unsafe.inject {|
                  itemId = Js.string "toggleCw";
                  text = Js.string "Constrained Window";
                  enableToggle = Js._true;
                  toggleHandler = Js.wrap_callback (fun _ _ ->
                    cw##setVisible(not (cw##isVisible()));
                  );
                |};
                Js.Unsafe.inject {|
                  text = Js.string "Add Region";
                  listeners = {|
                    click = Js.wrap_callback (fun _ _ _ ->
                      if newRegions##length > 0 then begin
                        let region = newRegions##pop() in
                        Js.Unsafe.set region "tools" (Js.array [|
                          {| _type = Js.string "close";
                             handler = Js.wrap_callback closeRegion;
                          |}
                        |]);
                        (ExtUtils.get_global "viewport")##add(region);
                      end else begin
                        (Ext_MessageBox.get_instance ())##show(Js.def {|
                          title = Js.string "All added";
                          msg = Js.string "Close one of the dynamic regions first";
                          (*minWidth = Ext_MessageBox.instance##minWidth;*)
                          buttons = (Ext_MessageBox.get_instance ())##_OK;
                          icon = (Ext_MessageBox.get_instance ())##_ERROR;
                        |},
                        Js.undefined,
                        Js.undefined);
                      end);
                  |};
                |};
                Js.Unsafe.inject {|
                  text = Js.string "Change Titles";
                  listeners = {|
                    click = Js.wrap_callback (fun _ _ _ ->
                      let panels = (ExtUtils.get_global "viewport")##query(Js.string "panel") in
                      Ext.instance##each(
                        panels,
                        Js.wrap_callback (fun panel _ _ ->
                          panel##setTitle(panel##title##concat(Js.string "!"))),
                        Js.undefined,
                        Js.undefined);
                    );
                  |};
                |};
              |];
            |};
            Js.Unsafe.inject {|
              region = Js.string "east";
              collapsible = Js._true;
              floatable = Js._true;
              split = Js._true;
              width = 200;
              minWidth = 120;
              minHeight = 140;
              title = Js.string "East";
              layout = {|
                _type = Js.string "vbox";
                padding = 5;
                align = Js.string "stretch"
              |};
              items = Js.array [|
                Js.Unsafe.inject {|
                  xtype = Js.string "textfield";
                  labelWidth = 70;
                  fieldLabel = Js.string "Text field"
                |};
                Js.Unsafe.inject {|
                  xtype = Js.string "component";
                  html = Js.string "I am floatable"
                |};
              |];
            |};
            Js.Unsafe.inject {|
              region = Js.string "south";
              height = 100;
              split = Js._true;
              collapsible = Js._true;
              title = Js.string "Splitter above me";
              minHeight = 60;
              html = Js.string "center south";
              weight = -100
            |};
            Js.Unsafe.inject {|
              region = Js.string "south";
              collapsible = Js._true;
              split = Js._true;
              height = 200;
              minHeight = 120;
              title = Js.string "South";
              layout = {|
                _type = Js.string "border";
                padding = 5
              |};
              items = Js.array [|
                Js.Unsafe.inject {|
                  title = Js.string "South Central";
                  region = Js.string "center";
                  minWidth = 80;
                  html = Js.string "South Central"
                |};
                Js.Unsafe.inject {|
                  title = Js.string "South Eastern";
                  region = Js.string "east";
                  flex = 1;
                  minWidth = 80;
                  html = Js.string "South Eastern";
                  split = Js._true;
                  collapsible = Js._true
                |};
                Js.Unsafe.inject {|
                  title = Js.string "South Western - not resizable";
                  region = Js.string "west";
                  flex = 1;
                  minWidth = 80;
                  html = Js.string "South Western<br>I collapse to nothing";
                  split = Js._true;
                  collapsible = Js._true;
                  splitterResize = Js._false;
                  collapseMode = Js.string "mini"
                |};
              |];
            |};
           |];
        |}));
    ),
    ExtUtils.undef,
    ExtUtils.undef)

