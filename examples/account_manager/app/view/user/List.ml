class type t = object
  inherit Ext_Class.t
  inherit Ext_grid_Panel.t
end

let () =
  let view : t Js.t =
    {| extend = Js.string "Ext.grid.Panel";
       alias = Js.array [|Js.string "widget.userlist"|];
       title = Js.string "All Users";
    |}
  in
  let init_component (this : t Js.t) () =
    this##store_string <- Js.string "Users";

    let column1 : Ext_grid_column_Column.t Js.t =
      {| text = Js.string "Name";
         dataIndex = Js.string "name";
         flex = 1;
      |}
    in
    let column2 : Ext_grid_column_Column.t Js.t =
      {| text = Js.string "Email";
         dataIndex = Js.string "email";
         flex = 1;
      |}
    in
    this##columns <- Js.array [|column1; column2|];

    (* Cannot call "this##callParent ()" because ExtJs uses call stack to figure
     * out which method to call in which superclass *)
    let t1 = Js.Unsafe.coerce this in
    t1##superclass##initComponent##apply (t1, Js.Unsafe.variable "arguments")
  in
  view##initComponent <- Js.wrap_meth_callback init_component;
  Ext.define
    ~className:"AM.view.user.List"
    ~data:view
    ()

