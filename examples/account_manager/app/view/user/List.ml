let _ =
  let grid : Ext_grid_Panel.configs Js.t =
    {| title = Js.string "All Users" |}
  in

  let view_class = ExtUtils.to_class_configs grid in
  view_class##extend <- Js.string "Ext.grid.Panel";
  view_class##alias <- Js.array [|Js.string "widget.userlist"|];

  let init_component (this : Ext_grid_Panel.configs Js.t) () =
    (* store config has type Ext.data.Store, but here we are using its name *)
    (Js.Unsafe.coerce this)##store <- Js.string "Users";

    let column1 : Ext_grid_column_Column.configs Js.t =
      {| text = Js.string "Name";
         dataIndex = Js.string "name";
      |}
    in
    (* flex config is defined in Ext.layout.container.Box and is implicitly
     * inherited by columns *)
    (Js.Unsafe.coerce column1)##flex <- 1;

    let column2 : Ext_grid_column_Column.configs Js.t =
      {| text = Js.string "Email";
         dataIndex = Js.string "email";
      |}
    in
    (Js.Unsafe.coerce column2)##flex <- 1;

    this##columns <- Js.array [|column1; column2|];

    (* Cannot call "this##callParent ()", because ExtJs uses the call stack to
     * figure out which method of the superclass to call *)
    ExtUtils.call_parent this "initComponent";
  in

  grid##initComponent <- Js.wrap_meth_callback init_component;

  Ext.instance##define(
    Js.string "AM.view.user.List",
    grid,
    ExtUtils.undef)

