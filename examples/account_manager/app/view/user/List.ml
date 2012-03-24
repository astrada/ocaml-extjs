class type data = object
  method name : Js.js_string Js.t Js.prop
  method email : Js.js_string Js.t Js.prop
end
let data_row name email =
  let constr : data Js.t Js.constr = Js.Unsafe.variable "Object" in
  let instance = jsnew constr () in
  instance##name <- Js.string name;
  instance##email <- Js.string email;
  instance

class type t = object
  inherit Ext_Class.t
  inherit Ext_grid_Panel.t
end

let () =
  let view_constr : t Js.t Js.constr = Js.Unsafe.variable "Object" in
  let view_conf = jsnew view_constr () in
  view_conf##extend <- Js.string "Ext.grid.Panel";
  view_conf##alias <- Js.array [|Js.string "widget.userlist"|];
  view_conf##title <- Js.string "All Users";
  let init_component this (*this : Ext_grid_Panel.t*) () =
    let data = [|
      data_row "Ed" "ed@sencha.com";
      data_row "Tommy" "tommy@sencha.com";
    |] in
    let store =
      Ext_data_Store.config
        ~fields:[|"name"; "email"|]
        ~data () in
    this##store <- store;

    let columns = [|
      Ext_grid_column_Column.config
        ~text:"Name" ~dataIndex:"name" ~flex:1 ();
      Ext_grid_column_Column.config
        ~text:"Email" ~dataIndex:"email" ~flex:1 ();
    |] in
    this##columns <- Js.array columns;

    (* Cannot call "this##callParent ()" because ExtJs uses call stack to figure
     * out which method to call in which superclass *)
    this##superclass##initComponent##apply (this)
  in
  view_conf##initComponent <- Js.wrap_meth_callback init_component;
  Ext.define
    ~className:"AM.view.user.List"
    ~data:view_conf
    ()

