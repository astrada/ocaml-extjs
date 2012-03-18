let () =
  let panel_conf = Ext_panel_Panel.config
                     ~title:"Hello Ext"
                     ~html:"Hello! Welcome to Ext JS."
                     () in

  let view_conf = Ext_container_Viewport.config
                    ~layout:"fit"
                    ~items:[|panel_conf|]
                    () in

  let launch () =
    Ext.create ~name:"Ext.container.Viewport" ~args:view_conf in
  let app_conf = Ext_app_Application.config
                   ~name:"HelloExt"
                   ~launch
                   () in

  let callback () =
    Firebug.console##log(Js.string "require callback") in
  let () =
    Ext.require
      ~expressions:[|"Ext.container.Viewport"|]
      ~fn:callback () in
  Ext.application ~config:app_conf

