let () =
  let panel : Ext_panel_Panel.configs Js.t =
    {| xtype = Js.string "userlist" |}
  in

  let viewport : Ext_container_Viewport.configs Js.t = {| |} in
  viewport##layout <- Js.string "fit";
  viewport##items <- Js.array [|panel|];

  let application : Ext_app_Application.configs Js.t =
    {| name = Js.string "AM";

       appFolder = Js.string "app";

       launch = Js.wrap_meth_callback
                  (fun this profile ->
                     Ext.instance##create(
                       Js.def (Js.string "Ext.container.Viewport"),
                       Js.def viewport));
    |}
  in
  application##controllers <- Js.array [|Js.string "Users"|];


  Ext.instance##application(application)

