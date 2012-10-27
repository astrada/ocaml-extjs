let () =
  let panel : Ext_panel_Panel.configs Js.t =
    {| title = Js.string "Hello Ext" |}
  in
  panel##html <- Js.string "Hello! Welcome to Ext JS.";

  let viewport : Ext_container_Viewport.configs Js.t = {| |} in
  viewport##layout <- Js.string "fit";
  viewport##items <- Js.array [|panel|];

  let application : Ext_app_Application.configs Js.t =
    {| name = Js.string "HelloExt";

       launch = Js.wrap_meth_callback
         (fun this profile ->
            Ext.instance##create(
              Js.def (Js.string "Ext.container.Viewport"),
              Js.def viewport));
    |}
  in

  Ext.instance##require(
    Js.string "Ext.container.Viewport",
    Js.undefined,
    Js.undefined,
    Js.undefined);

  Ext.instance##application(application)

