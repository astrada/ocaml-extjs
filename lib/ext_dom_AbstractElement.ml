class type t =
object('self)
  inherit Ext_Base.t
  
  method addCls : _ Js.t -> 'self Js.t Js.meth
  method appendChild : _ Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method appendTo : _ Js.t -> 'self Js.t Js.meth
  method applyStyles : _ Js.t -> 'self Js.t Js.meth
  method child : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method contains : _ Js.t -> bool Js.t Js.meth
  method createChild : _ Js.t -> Dom_html.element Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  method destroy : unit Js.meth
  method down : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method findParent : Js.js_string Js.t -> _ Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method findParentNode : Js.js_string Js.t -> _ Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method first : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method getActiveElement : Dom_html.element Js.t Js.meth
  method getAttribute : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  method getBorderWidth : Js.js_string Js.t -> Js.number Js.t Js.meth
  method getById : Js.js_string Js.t -> bool Js.t Js.optdef -> unit Js.meth
  method getHTML : unit Js.meth
  method getHeight : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  method getMargin : Js.js_string Js.t Js.optdef -> _ Js.t Js.meth
  method getPadding : Js.js_string Js.t -> Js.number Js.t Js.meth
  method getSize : bool Js.t Js.optdef -> _ Js.t Js.meth
  method getStyle : _ Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method getValue : bool Js.t -> _ Js.t Js.meth
  method getViewSize : _ Js.t Js.meth
  method getWidth : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  method hasCls : Js.js_string Js.t -> bool Js.t Js.meth
  method hide : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method insertAfter : _ Js.t -> 'self Js.t Js.meth
  method insertBefore : _ Js.t -> 'self Js.t Js.meth
  method insertFirst : _ Js.t -> 'self Js.t Js.meth
  method insertHtml : Js.js_string Js.t -> Js.js_string Js.t ->
    bool Js.t Js.optdef -> _ Js.t Js.meth
  method insertSibling : _ Js.t -> Js.js_string Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  method is : Js.js_string Js.t -> bool Js.t Js.meth
  method isStyle : Js.js_string Js.t -> Js.js_string Js.t -> bool Js.t
    Js.meth
  method isTransparent : Js.js_string Js.t -> bool Js.t Js.meth
  method last : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method mask : Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    unit Js.meth
  method next : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method parent : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    _ Js.t Js.meth
  method prev : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method query : Js.js_string Js.t -> Dom_html.element Js.t Js.js_array Js.t
    Js.meth
  method radioCls : _ Js.t -> 'self Js.t Js.meth
  method remove : unit Js.meth
  method removeCls : _ Js.t -> 'self Js.t Js.meth
  method repaint : 'self Js.t Js.meth
  method replace : _ Js.t -> 'self Js.t Js.meth
  method replaceCls : Js.js_string Js.t -> Js.js_string Js.t -> 'self Js.t
    Js.meth
  method replaceWith : _ Js.t -> 'self Js.t Js.meth
  method select : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method serializeForm : _ Js.t -> Js.js_string Js.t Js.meth
  method set : _ Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method setHTML : Js.js_string Js.t -> 'self Js.t Js.meth
  method setHeight : _ Js.t -> 'self Js.t Js.meth
  method setSize : _ Js.t -> _ Js.t -> 'self Js.t Js.meth
  method setStyle : _ Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setVisibilityMode : _ Js.t -> 'self Js.t Js.meth
  method setVisible : bool Js.t -> _ Js.t Js.optdef -> 'self Js.t Js.meth
  method setWidth : _ Js.t -> 'self Js.t Js.meth
  method show : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method toggleCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method unmask : unit Js.meth
  method up : Js.js_string Js.t -> _ Js.t Js.optdef -> bool Js.t Js.optdef ->
    'self Js.t Js.meth
  method update : Js.js_string Js.t -> 'self Js.t Js.meth
  method wrap : _ Js.t Js.optdef -> bool Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> _ Js.t Js.meth
  method defaultUnit : Js.js_string Js.t Js.prop
  method dom : Dom_html.element Js.t Js.prop
  method id : Js.js_string Js.t Js.prop
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method fly : _ Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method fromPoint : Js.number Js.t -> Js.number Js.t -> Js.js_string Js.t
    Js.meth
  method get : _ Js.t -> 'self Js.t Js.meth
  method getDocumentHeight : Js.number Js.t Js.meth
  method getDocumentWidth : Js.number Js.t Js.meth
  method getOrientation : Js.js_string Js.t Js.meth
  method getViewSize : _ Js.t Js.meth
  method getViewportHeight : Js.number Js.t Js.meth
  method getViewportWidth : Js.number Js.t Js.meth
  method mergeClsList : _ Js.t -> _ Js.t -> _ Js.js_array Js.t Js.meth
  method normalize : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method parseBox : _ Js.t -> _ Js.t Js.meth
  method parseStyles : Js.js_string Js.t -> _ Js.t Js.meth
  method removeCls : _ Js.t -> _ Js.t -> _ Js.js_array Js.t Js.meth
  method unitizeBox : _ Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    Js.meth
  method _ASCLASS : Js.number Js.t Js.prop
  method _DISPLAY : Js.number Js.t Js.prop
  method _OFFSETS : Js.number Js.t Js.prop
  method _VISIBILITY : Js.number Js.t Js.prop
  
end

let get_static () = Js.Unsafe.variable "Ext.dom.AbstractElement"

let static = get_static ()

let fly dom named =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "fly")
    [|Js.Unsafe.inject dom; Js.Unsafe.inject named; |]

let fromPoint x y =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "fromPoint")
    [|Js.Unsafe.inject x; Js.Unsafe.inject y; |]

let get el =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "get")
    [|Js.Unsafe.inject el; |]

let getDocumentHeight () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getDocumentHeight") [||]

let getDocumentWidth () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getDocumentWidth") [||]

let getOrientation () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getOrientation") [||]

let getViewSize () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getViewSize") [||]

let getViewportHeight () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getViewportHeight") [||]

let getViewportWidth () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getViewportWidth") [||]

let mergeClsList clsList1 clsList2 =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "mergeClsList")
    [|Js.Unsafe.inject clsList1; Js.Unsafe.inject clsList2; |]

let normalize prop =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "normalize")
    [|Js.Unsafe.inject prop; |]

let parseBox box =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "parseBox")
    [|Js.Unsafe.inject box; |]

let parseStyles styles =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "parseStyles")
    [|Js.Unsafe.inject styles; |]

let removeCls existingClsList removeClsList =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "removeCls")
    [|Js.Unsafe.inject existingClsList; Js.Unsafe.inject removeClsList; |]

let unitizeBox box units =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "unitizeBox")
    [|Js.Unsafe.inject box; Js.Unsafe.inject units; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

