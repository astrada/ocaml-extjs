let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.tab.*";
      Js.string "Ext.window.*";
      Js.string "Ext.tip.*";
      Js.string "Ext.layout.container.Border"
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      ExtUtils.set_global "win" Js.undefined;

      let button = Ext.instance##get(Js.string "show-btn") in

      let _ =
        button##on(Js.string "click", Js.wrap_callback (fun e this _ ->

          if not (ExtUtils.test_global "win") then begin
            ExtUtils.set_global "win"
              (Ext.instance##create(Js.def (Js.string "widget.window"), Js.def {|
                title = Js.string "Layout Window";
                closable = Js._true;
                closeAction = Js.string "hide";
                width = 600;
                minWidth = 350;
                height = 350;
                layout = {|
                  _type = Js.string "border";
                  padding = 5;
                |};
                items = Js.array [|
                  Js.Unsafe.coerce {|
                    region = Js.string "west";
                    title = Js.string "Navigation";
                    width = 200;
                    split = Js._true;
                    collapsible = Js._true;
                    floatable = Js._false;
                  |};
                  Js.Unsafe.coerce {|
                    region = Js.string "center";
                    xtype = Js.string "tabpanel";
                    items = Js.array [|
                      Js.Unsafe.coerce {|
                        title = Js.string "Bogus Tab";
                        html = Js.string "Hello world 1";
                      |};
                      Js.Unsafe.coerce {|
                        title = Js.string "Another Tab";
                        html = Js.string "Hello world 2";
                      |};
                      Js.Unsafe.coerce {|
                        title = Js.string "Closable Tab";
                        html = Js.string "Hello world 3";
                        closable = Js._true;
                      |};
                    |];
                  |};
                |];
            |}));
          end;
          (Js.Unsafe.coerce button##dom)##disabled <- Js._true;
          let win = ExtUtils.get_global "win" in
          if win##isVisible() then begin
            win##hide(Js.def this, Js.def (Js.wrap_callback (fun () ->
              (Js.Unsafe.coerce button##dom)##disabled <- Js._false;
            )));
          end else begin
            win##show(Js.def this, Js.def (Js.wrap_callback (fun () ->
              (Js.Unsafe.coerce button##dom)##disabled <- Js._false;
            )));
          end
        ),
        Js.undefined,
        Js.undefined) in ()
    ),
    ExtUtils.undef,
    ExtUtils.undef)

