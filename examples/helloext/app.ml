let () =
  let panel : Ext_panel_Panel.t Js.t =
    {| title = Js.string "Hello Ext";
       html = Js.string "Hello! Welcome to Ext JS.";
     |}
  in

  let viewport : Ext_container_Viewport.t Js.t =
    {| layout = Js.string "fit";
       items = Js.array [|Js.Unsafe.inject panel|];
     |}
  in

  let application : Ext_app_Application.t Js.t =
    {| name = Js.string "HelloExt";
       launch = Js.wrap_callback
                  (fun () ->
                     Ext.create ~name:"Ext.container.Viewport" ~args:viewport);
    |}
  in

  Ext.require ~expressions:[|"Ext.container.Viewport"|] ();
  Ext.application ~config:application

