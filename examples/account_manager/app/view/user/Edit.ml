class type textfield = object
  method xtype : Js.js_string Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method fieldLabel : Js.js_string Js.t Js.prop
end
let text_field xtype name fieldLabel =
  let constr : textfield Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  instance##xtype <- Js.string xtype;
  instance##name <- Js.string name;
  instance##fieldLabel <- Js.string fieldLabel;
  instance

class type button = object
  method text : Js.js_string Js.t Js.prop
  method action : Js.js_string Js.t Js.prop
  method scope : 'a Js.t Js.prop
  method handler : ('a Js.t -> 'b Js.t -> unit) Js.callback Js.prop
end

class type t = object
  inherit Ext_Class.t
  inherit Ext_window_Window.t
end

let () =
  let view_constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let view_conf = jsnew view_constr () in
  view_conf##extend <- Js.string "Ext.window.Window";
  view_conf##alias <- Js.array [|Js.string "widget.useredit"|];

  view_conf##title <- Js.string "Edit User";
  view_conf##layout <- Js.string "fit";
  view_conf##autoShow <- Js.bool true;

  let init_component this (*this : t*) () =
    let panel_items = [|
      text_field "textfield" "name" "Name";
      text_field "textfield" "email" "Email";
    |] in
    let panel_constr : Ext_panel_Panel.t Js.t Js.constr = Js.Unsafe.variable "Object" in
    let panel_conf = jsnew panel_constr () in
    panel_conf##xtype <- Js.string "form";
    panel_conf##items <- Js.array panel_items;
    this##items <- panel_conf;

    let button_constr : button Js.t Js.constr = Js.Unsafe.variable "Object" in
    let button_conf1 = jsnew button_constr () in
    button_conf1##text <- Js.string "Save";
    button_conf1##action <- Js.string "save";
    let button_conf2 = jsnew button_constr () in
    button_conf2##text <- Js.string "Cancel";
    button_conf2##handler <- Js.wrap_callback (fun _ _ -> this##close ());
    this##buttons <- Js.array [|button_conf1; button_conf2|];

    (* Cannot call "this##callParent ()" because ExtJs uses call stack to figure
     * out which method to call in which superclass *)
    let t1 = Js.Unsafe.coerce this in
    t1##superclass##initComponent##apply (t1, Js.Unsafe.variable "arguments")
  in
  view_conf##initComponent <- Js.wrap_meth_callback init_component;
  Ext.define
    ~className:"AM.view.user.Edit"
    ~data:view_conf
    ()

