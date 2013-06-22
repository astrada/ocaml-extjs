class type configs =
object('self)
  inherit Ext_app_Controller.configs

  method editUser :
    (Ext_grid_Panel.t Js.t -> Ext_data_Model.t Js.t -> unit)
      Js.callback Js.writeonly_prop
  method updateUser :
    ('self Js.t, Ext_button_Button.t Js.t -> unit)
      Js.meth_callback Js.writeonly_prop

end

class type t =
object
  inherit Ext_app_Controller.t

  method editUser :
    Ext_grid_Panel.t Js.t -> Ext_data_Model.t Js.t -> unit Js.meth
  method updateUser :
    Ext_button_Button.t Js.t -> unit Js.meth

end

class type events =
object
  method itemdblclick :
    (t Js.t, Ext_grid_Panel.t Js.t -> Ext_data_Model.t Js.t ->
       Dom_html.element Js.t -> Js.number Js.t -> Ext_EventObject.t Js.t ->
       unit)
      Js.meth_callback Js.writeonly_prop
  method click :
    (t Js.t, Ext_button_Button.t Js.t -> Dom_html.event Js.t -> unit)
      Js.meth_callback Js.writeonly_prop

end

let of_configs (c : configs Js.t) : t Js.t = Js.Unsafe.coerce c

let _ =
  let userlist_listeners : events Js.t = {| |} in
  userlist_listeners##itemdblclick <-
    Js.wrap_meth_callback
      (fun (this : t Js.t) grid record item index e ->
         this##editUser(grid, record));

  let useredit_listeners : events Js.t = {| |} in
  useredit_listeners##click <-
    Js.wrap_meth_callback
      (fun (this : t Js.t) button e ->
         this##updateUser(button));

  let controller : configs Js.t = {| |} in
  controller##models <- Js.array [|Js.string "User"|];
  controller##stores <- Js.array [|Js.string "Users"|];
  controller##views <- Js.array [|Js.string "user.List";
                                  Js.string "user.Edit"|];

  (ExtUtils.to_class_configs controller)##extend <-
    Js.string "Ext.app.Controller";

  controller##init <-
    Js.wrap_meth_callback
      (fun (this : configs Js.t) _ ->
         let selectors_listeners =
           Js.Unsafe.obj
             [| ("viewport userlist",
                 Js.Unsafe.inject userlist_listeners);
                ("useredit button[action=save]",
                 Js.Unsafe.inject useredit_listeners);
             |]
         in
         (of_configs this)##control(selectors_listeners, ExtUtils.undef));
  
  controller##editUser <-
    Js.wrap_callback
      (fun grid record ->
         let view =
           Ext.instance##widget(
             Js.def (Js.string "useredit"),
             Js.undefined) in
         view##down(Js.string "form")##loadRecord(record));

  controller##updateUser <-
    Js.wrap_meth_callback
      (fun this button ->
         let button_element : Ext_dom_Element.t Js.t =
           Js.Unsafe.coerce button in
         let win_element =
           button_element##up(Js.string "window", Js.undefined, Js.undefined) in
         let form_element =
           win_element##down(Js.string "form", Js.undefined) in

         let form : Ext_form_Panel.t Js.t =
           Js.Unsafe.coerce form_element in
         let record = form##getRecord() in
         let values = form##getValues(
           Js.undefined,
           Js.undefined,
           Js.undefined,
           Js.undefined) in

         ignore (record##set(values, ExtUtils.undef));

         let win : Ext_window_Window.t Js.t =
           Js.Unsafe.coerce win_element in
         win##close();

         (* getUsersStore is dynamically generated *)
         (Js.Unsafe.coerce this)##getUsersStore()##sync());

  Ext.instance##define(
    Js.string "AM.controller.Users",
    controller,
    ExtUtils.undef)

