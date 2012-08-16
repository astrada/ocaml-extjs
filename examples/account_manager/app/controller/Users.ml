class type t = object
  inherit Ext_Class.t
  inherit Ext_app_Controller.t

  method editUser : ('a Js.t -> 'b Js.t -> unit) Js.callback Js.prop
  method updateUser : ('a Js.t, 'b Js.t -> unit) Js.meth_callback Js.prop
end

let () =
  let userlist_listeners : Ext_AbstractComponent.events Js.t = {| |} in
  userlist_listeners##itemdblclick <- Js.wrap_meth_callback
                                        (fun this grid record
                                               item index e eOpts ->
                                           this##editUser(grid, record));

  let useredit_listeners : Ext_AbstractComponent.events Js.t = {| |} in
  useredit_listeners##click <- Js.wrap_meth_callback
                                 (fun this button e eOpts ->
                                    this##updateUser(button));

  let controller : t Js.t =
    {| extend = Js.string "Ext.app.Controller";
       stores = Js.array [|Js.string "Users"|];
       models = Js.array [|Js.string "User"|];
       views = Js.array [|Js.string "user.List";
                          Js.string "user.Edit"|];
     |}
  in

  controller##init <- Js.wrap_meth_callback
                        (fun this _ ->
                           let selectors_listeners =
                             Js.Unsafe.obj
                               [| ("viewport > userlist",
                                   Js.Unsafe.inject userlist_listeners);
                                  ("useredit button[action=save]",
                                   Js.Unsafe.inject useredit_listeners);
                               |]
                           in
                           this##control(selectors_listeners));
  controller##editUser <- Js.wrap_callback
                            (fun grid record ->
                               let view = Ext.widget ~name:"useredit" in
                                 view##down(Js.string "form")##loadRecord(record));
  controller##updateUser <- Js.wrap_meth_callback
                              (fun this button ->
                                 let win = button##up(Js.string "window") in
                                 let form = win##down(Js.string "form") in
                                 let record = form##getRecord () in
                                 let values = form##getValues () in

                                 record##set (values);
                                 win##close ();
                                 this##getUsersStore()##sync());

  Ext.define
    ~className:"AM.controller.Users"
    ~data:controller
    ()

