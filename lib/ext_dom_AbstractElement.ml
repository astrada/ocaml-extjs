class type t =
object('self)
  inherit Ext_Base.t
  
  method defaultUnit : Js.js_string Js.t Js.prop
  method dom : Dom_html.element Js.t Js.prop
  method id : Js.js_string Js.t Js.prop
  method addCls : 'a Js.t -> 'self Js.t Js.meth
  method appendChild : 'a Js.t -> 'self Js.t Js.meth
  method appendTo : 'a Js.t -> 'self Js.t Js.meth
  method applyStyles : 'a Js.t -> 'self Js.t Js.meth
  method child : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  method contains : 'a Js.t -> bool Js.t Js.meth
  method createChild : 'a Js.t -> Dom_html.element Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  method destroy : unit Js.meth
  method down : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  method findParent : Js.js_string Js.t -> 'a Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method findParentNode : Js.js_string Js.t -> 'a Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method first : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'a Js.t Js.meth
  method getActiveElement : Dom_html.element Js.t Js.meth
  method getAlignToXY : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    'b Js.js_array Js.t Js.optdef -> 'c Js.js_array Js.t Js.meth
  method getAnchorXY : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'a Js.t Js.optdef -> 'b Js.js_array Js.t Js.meth
  method getAttribute : Js.js_string Js.t -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  method getBorderWidth : Js.js_string Js.t -> Js.number Js.t Js.meth
  method getBottom : bool Js.t -> Js.number Js.t Js.meth
  method getBox : bool Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  method getById : Js.js_string Js.t -> bool Js.t Js.optdef -> unit Js.meth
  method getHTML : unit Js.meth
  method getHeight : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  method getLeft : bool Js.t -> Js.number Js.t Js.meth
  method getMargin : Js.js_string Js.t Js.optdef -> 'a Js.t Js.meth
  method getOffsetsTo : 'a Js.t -> 'b Js.js_array Js.t Js.meth
  method getPadding : Js.js_string Js.t -> Js.number Js.t Js.meth
  method getPageBox : bool Js.t Js.optdef -> 'a Js.t Js.meth
  method getRight : bool Js.t -> Js.number Js.t Js.meth
  method getSize : bool Js.t Js.optdef -> 'a Js.t Js.meth
  method getStyle : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.t Js.meth
  method getTop : bool Js.t -> Js.number Js.t Js.meth
  method getValue : bool Js.t -> 'a Js.t Js.meth
  method getViewSize : 'a Js.t Js.meth
  method getWidth : bool Js.t Js.optdef -> Js.number Js.t Js.meth
  method getX : 'a Js.t -> Js.number Js.t Js.meth
  method getXY : 'a Js.js_array Js.t Js.meth
  method getY : 'a Js.t -> Js.number Js.t Js.meth
  method hasCls : Js.js_string Js.t -> bool Js.t Js.meth
  method hide : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method insertAfter : 'a Js.t -> 'self Js.t Js.meth
  method insertBefore : 'a Js.t -> 'self Js.t Js.meth
  method insertFirst : 'a Js.t -> 'self Js.t Js.meth
  method insertHtml : Js.js_string Js.t -> Js.js_string Js.t ->
    bool Js.t Js.optdef -> 'a Js.t Js.meth
  method insertSibling : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    bool Js.t Js.optdef -> 'self Js.t Js.meth
  method is : Js.js_string Js.t -> bool Js.t Js.meth
  method isStyle : Js.js_string Js.t -> Js.js_string Js.t -> bool Js.t
    Js.meth
  method isTransparent : Js.js_string Js.t -> bool Js.t Js.meth
  method last : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  method mask : Js.js_string Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    unit Js.meth
  method next : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  method parent : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    'a Js.t Js.meth
  method populateStyleMap : 'a Js.t -> 'b Js.t -> unit Js.meth
  method prev : Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef -> 'a Js.t
    Js.meth
  method query : Js.js_string Js.t -> Dom_html.element Js.t Js.js_array Js.t
    Js.meth
  method radioCls : 'a Js.t -> 'self Js.t Js.meth
  method remove : unit Js.meth
  method removeCls : 'a Js.t -> 'self Js.t Js.meth
  method repaint : 'self Js.t Js.meth
  method replace : 'a Js.t -> 'self Js.t Js.meth
  method replaceCls : Js.js_string Js.t -> Js.js_string Js.t -> 'self Js.t
    Js.meth
  method replaceWith : 'a Js.t -> 'self Js.t Js.meth
  method select : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  method serializeForm : 'a Js.t -> Js.js_string Js.t Js.meth
  method set : 'a Js.t -> bool Js.t Js.optdef -> 'self Js.t Js.meth
  method setBottom : Js.js_string Js.t -> 'self Js.t Js.meth
  method setBox : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.t Js.optdef ->
    'self Js.t Js.meth
  method setHTML : Js.js_string Js.t -> 'self Js.t Js.meth
  method setHeight : 'a Js.t -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  method setLeft : Js.js_string Js.t -> 'self Js.t Js.meth
  method setRight : Js.js_string Js.t -> 'self Js.t Js.meth
  method setSize : 'a Js.t -> 'b Js.t -> 'c Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setStyle : 'a Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setTop : Js.js_string Js.t -> 'self Js.t Js.meth
  method setVisibilityMode : 'a Js.t -> 'self Js.t Js.meth
  method setVisible : bool Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method setWidth : 'a Js.t -> 'b Js.t Js.optdef -> 'self Js.t Js.meth
  method setX : Js.number Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method setXY : 'a Js.js_array Js.t -> 'b Js.t Js.optdef -> 'self Js.t
    Js.meth
  method setY : Js.number Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method show : 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method toggleCls : Js.js_string Js.t -> 'self Js.t Js.meth
  method translatePoints : 'a Js.t -> Js.number Js.t Js.optdef -> 'b Js.t
    Js.meth
  method unmask : unit Js.meth
  method up : Js.js_string Js.t -> 'a Js.t Js.optdef -> 'self Js.t Js.meth
  method update : Js.js_string Js.t -> 'self Js.t Js.meth
  method wrap : 'a Js.t Js.optdef -> bool Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> 'b Js.t Js.meth
  
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
  
  method aSCLASS : Js.number Js.t Js.prop
  method dISPLAY : Js.number Js.t Js.prop
  method oFFSETS : Js.number Js.t Js.prop
  method vISIBILITY : Js.number Js.t Js.prop
  method fly : 'a Js.t -> Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method fromPoint : Js.number Js.t -> Js.number Js.t -> Js.js_string Js.t
    Js.meth
  method get : 'a Js.t -> 'self Js.t Js.meth
  method getDocumentHeight : Js.number Js.t Js.meth
  method getDocumentWidth : Js.number Js.t Js.meth
  method getOrientation : Js.js_string Js.t Js.meth
  method getViewSize : 'a Js.t Js.meth
  method getViewportHeight : Js.number Js.t Js.meth
  method getViewportWidth : Js.number Js.t Js.meth
  method mergeClsList : 'a Js.t -> 'b Js.t -> 'c Js.js_array Js.t Js.meth
  method normalize : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method parseBox : 'a Js.t -> 'b Js.t Js.meth
  method parseStyles : Js.js_string Js.t -> 'a Js.t Js.meth
  method removeCls : 'a Js.t -> 'b Js.t -> 'c Js.js_array Js.t Js.meth
  method unitizeBox : 'a Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    Js.meth
  
end

let static = Js.Unsafe.variable "Ext.dom.AbstractElement"

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

