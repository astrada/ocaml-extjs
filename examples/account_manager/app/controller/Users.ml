class type t = object
  inherit Ext_Class.t
  inherit Ext_app_Controller.t

  method editUser : ('a Js.t -> 'b Js.t -> unit) Js.callback Js.prop
end

let () =
  let listeners_constr : Ext_AbstractComponent.events Js.t Js.constr =
    Js.Unsafe.variable "Object" in
  let listeners  = jsnew listeners_constr () in
  listeners##itemdblclick <- Js.wrap_meth_callback
                               (fun this grid record item index e eOpts ->
                                  this##editUser(grid, record));

  let controller_constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let controller_conf = jsnew controller_constr () in
  controller_conf##extend <- Js.string "Ext.app.Controller";
  controller_conf##stores <- Js.array [|Js.string "Users"|];
  controller_conf##views <- Js.array [|Js.string "user.List";
                                       Js.string "user.Edit"|];
  controller_conf##init <- Js.wrap_meth_callback
                             (fun this _ ->
                                this##control(
                                  Js.string "userlist",
                                  listeners));
  controller_conf##editUser <- Js.wrap_callback
                                 (fun grid record ->
                                    let view = Ext.widget ~name:"useredit" in
                                    view##down(Js.string "form")##loadRecord(record));
  Ext.define
    ~className:"AM.controller.Users"
    ~data:controller_conf
    ()

