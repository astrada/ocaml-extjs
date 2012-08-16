let () =
  let panel : Ext_panel_Panel.t Js.t =
    {| xtype = Js.string "userlist" |}
  in

  let viewport : Ext_container_Viewport.t Js.t =
    {| layout = Js.string "fit"; |}
  in
  viewport##items <- Js.array [|panel|];

  let application : Ext_app_Application.t Js.t =
    {| name = Js.string "AM";

       appFolder = Js.string "app";

       controllers = Js.array [|Js.string "Users"|];

       launch = Js.wrap_callback
                  (fun () ->
                     Ext.create ~name:"Ext.container.Viewport" ~args:viewport);
    |}
  in

  Ext.application ~config:application

