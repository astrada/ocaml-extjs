class type t = object
  inherit Ext_Class.t
  inherit Ext_app_Controller.t

  method editUser : ('a Js.t -> 'b Js.t -> unit) Js.callback Js.prop
  method updateUser : ('a Js.t, 'b Js.t -> unit) Js.meth_callback Js.prop
end

let () =
  let listeners_constr : Ext_AbstractComponent.events Js.t Js.constr =
    Js.Unsafe.variable "Object" in
  let userlist_listeners = jsnew listeners_constr () in
  userlist_listeners##itemdblclick <- Js.wrap_meth_callback
                                        (fun this grid record
                                               item index e eOpts ->
                                           this##editUser(grid, record));
  let useredit_listeners = jsnew listeners_constr () in
  useredit_listeners##click <- Js.wrap_meth_callback
                                        (fun this button e eOpts ->
                                           this##updateUser(button));

  let controller_constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let controller_conf = jsnew controller_constr () in
  controller_conf##extend <- Js.string "Ext.app.Controller";
  controller_conf##stores <- Js.array [|Js.string "Users"|];
  controller_conf##models <- Js.array [|Js.string "User"|];
  controller_conf##views <- Js.array [|Js.string "user.List";
                                       Js.string "user.Edit"|];
  controller_conf##init <- Js.wrap_meth_callback
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
  controller_conf##editUser <- Js.wrap_callback
                                 (fun grid record ->
                                    let view = Ext.widget ~name:"useredit" in
                                    view##down(Js.string "form")##loadRecord(record));
  controller_conf##updateUser <- Js.wrap_meth_callback
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
    ~data:controller_conf
    ()

