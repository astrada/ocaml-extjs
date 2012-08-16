class type textfield = object
  method xtype : Js.js_string Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method fieldLabel : Js.js_string Js.t Js.prop
end

let text_field xtype name fieldLabel =
  ({| xtype = Js.string xtype;
      name = Js.string name;
      fieldLabel = Js.string fieldLabel;
   |} : textfield Js.t)

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
  let view : t Js.t =
    {| extend = Js.string "Ext.window.Window";
       alias = Js.array [|Js.string "widget.useredit"|];

       title = Js.string "Edit User";
       layout = Js.string "fit";
       autoShow = Js.bool true;
    |}
  in

  let init_component (this : t Js.t) () =
    let panel_items =
      [| text_field "textfield" "name" "Name";
         text_field "textfield" "email" "Email";
      |]
    in
    let panel : Ext_panel_Panel.t Js.t =
      {| xtype = Js.string "form"; |}
    in
    panel##items <- Js.array panel_items;
    this##items <- Js.array [|panel|];

    let button1 : button Js.t =
      {| text = Js.string "Save";
         action = Js.string "save";
      |}
    in
    let button2 : button Js.t =
      {| text = Js.string "Cancel"; |}
    in
    button2##handler <- Js.wrap_callback (fun _ _ -> this##close ());
    this##buttons <- Js.array [|button1; button2|];

    (* Cannot call "this##callParent ()" because ExtJs uses call stack to figure
     * out which method to call in which superclass *)
    let t1 = Js.Unsafe.coerce this in
    t1##superclass##initComponent##apply (t1, Js.Unsafe.variable "arguments")
  in
  view##initComponent <- Js.wrap_meth_callback init_component;
  Ext.define
    ~className:"AM.view.user.Edit"
    ~data:view
    ()

