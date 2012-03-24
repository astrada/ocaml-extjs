let () =
  let view_conf = Ext_container_Viewport.config
                    ~layout:"fit"
                    ~items:[|
                      Ext_panel_Panel.config
                        ~xtype:"userlist"
                        ()
                    |] () in

  let app_conf = Ext_app_Application.config
                   ~name:"AM"

                   ~appFolder:"app"

                   ~controllers: [|"Users"|]

                   ~launch: (
                     fun () ->
                       Ext.create ~name:"Ext.container.Viewport"
                         ~args:view_conf

                   ) () in

  Ext.application ~config:app_conf

