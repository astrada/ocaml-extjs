class type t = object
  inherit Ext_Class.t
  inherit Ext_app_Controller.t

  method editUser : ('a Js.t -> 'b Js.t -> unit) Js.callback Js.prop
  method updateUser : ('a Js.t, 'b Js.t -> unit) Js.meth_callback Js.prop
end

let () =
  let userlist_listeners =
    ExtUtils.new_config
      (fun (obj : Ext_AbstractComponent.events Js.t) ->
         obj##itemdblclick <- Js.wrap_meth_callback
                                (fun this grid record
                                       item index e eOpts ->
                                   this##editUser(grid, record))
      ) in
  let useredit_listeners =
    ExtUtils.new_config
      (fun (obj : Ext_AbstractComponent.events Js.t) ->
         obj##click <- Js.wrap_meth_callback
                         (fun this button e eOpts ->
                            this##updateUser(button))
      ) in
  let controller_conf =
    ExtUtils.new_config
      (fun (obj : t Js.t) ->
         obj##extend <- Js.string "Ext.app.Controller";
         obj##stores <- Js.array [|Js.string "Users"|];
         obj##models <- Js.array [|Js.string "User"|];
         obj##views <- Js.array [|Js.string "user.List";
                                  Js.string "user.Edit"|];
         obj##init <- Js.wrap_meth_callback
                        (fun this _ ->
                           let selectors_listeners =
                             jsnew (Js.Unsafe.variable "Object") () in
                             ExtUtils.assoc_set
                               selectors_listeners
                               (Js.string "viewport > userlist")
                               userlist_listeners;
                             ExtUtils.assoc_set
                               selectors_listeners
                               (Js.string "useredit button[action=save]")
                               useredit_listeners;
                             this##control(selectors_listeners));
         obj##editUser <- Js.wrap_callback
                            (fun grid record ->
                               let view = Ext.widget ~name:"useredit" in
                                 view##down(Js.string "form")##loadRecord(record));
         obj##updateUser <- Js.wrap_meth_callback
                              (fun this button ->
                                 let win = button##up(Js.string "window") in
                                 let form = win##down(Js.string "form") in
                                 let record = form##getRecord () in
                                 let values = form##getValues () in

                                   record##set (values);
                                   win##close ();
                                   this##getUsersStore()##sync());
      ) in
  Ext.define
    ~className:"AM.controller.Users"
    ~data:controller_conf
    ()

