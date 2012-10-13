let text_field xtype name fieldLabel : Ext_form_field_Text.configs Js.t =
  {| xtype = Js.string xtype;
     name = Js.string name;
     fieldLabel = Js.string fieldLabel;
  |}

let _ =
  let view : Ext_window_Window.configs Js.t = 
    {| title = Js.string "Edit User";
       autoShow = Js.bool true;
    |}
  in
  view##layout <- Js.string "fit";
  let view_class = ExtUtils.to_class_configs view in
  view_class##extend <- Js.string "Ext.window.Window";
  view_class##alias <- Js.array [|Js.string "widget.useredit"|];

  let init_component (this : Ext_window_Window.configs Js.t) () =
    let panel_items =
      [| text_field "textfield" "name" "Name";
         text_field "textfield" "email" "Email";
      |]
    in
    let panel : Ext_panel_Panel.configs Js.t =
      {| xtype = Js.string "form" |}
    in
    panel##items <- Js.array panel_items;

    this##items <- Js.array [|panel|];

    let button1 : Ext_button_Button.configs Js.t =
      {| text = Js.string "Save" |}
    in
    (Js.Unsafe.coerce button1)##action <- Js.string "save";

    let button2 : Ext_button_Button.configs Js.t =
      {| text = Js.string "Cancel" |}
    in
    button2##handler <-
      Js.wrap_callback
        (fun button e ->
           (Ext_window_Window.of_configs this)##close());

    this##buttons <- Js.array [|button1; button2|];

    (* Cannot call "this##callParent ()", because ExtJs uses the call stack to
     * figure out which method of the superclass to call *)
    ExtUtils.call_parent this "initComponent";
  in

  view##initComponent <- Js.wrap_meth_callback init_component;

  Ext.instance##define(
    Js.string "AM.view.user.Edit",
    view,
    ExtUtils.undef)

