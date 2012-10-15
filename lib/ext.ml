class type t =
object('self)
  
  method bLANK_IMAGE_URL : Js.js_string Js.t Js.prop
  method sSL_SECURE_URL : Js.js_string Js.t Js.prop
  method uSE_NATIVE_JSON : bool Js.t Js.prop
  method chromeVersion : Js.number Js.t Js.prop
  method emptyFn : 'a Js.t Js.prop
  method emptyString : 'a Js.t Js.prop
  method enableFx : bool Js.t Js.prop
  method enableGarbageCollector : bool Js.t Js.prop
  method enableListenerCollection : bool Js.t Js.prop
  method enableNestedListenerRemoval : bool Js.t Js.prop
  method enumerables : Js.js_string Js.t Js.js_array Js.t Js.prop
  method firefoxVersion : Js.number Js.t Js.prop
  method ieVersion : Js.number Js.t Js.prop
  method isChrome : bool Js.t Js.prop
  method isFF10 : bool Js.t Js.prop
  method isFF3_0 : bool Js.t Js.prop
  method isFF3_5 : bool Js.t Js.prop
  method isFF3_6 : bool Js.t Js.prop
  method isFF4 : bool Js.t Js.prop
  method isFF5 : bool Js.t Js.prop
  method isGecko : bool Js.t Js.prop
  method isGecko10 : bool Js.t Js.prop
  method isGecko3 : bool Js.t Js.prop
  method isGecko4 : bool Js.t Js.prop
  method isGecko5 : bool Js.t Js.prop
  method isIE : bool Js.t Js.prop
  method isIE6 : bool Js.t Js.prop
  method isIE7 : bool Js.t Js.prop
  method isIE8 : bool Js.t Js.prop
  method isIE9 : bool Js.t Js.prop
  method isLinux : bool Js.t Js.prop
  method isMac : bool Js.t Js.prop
  method isOpera : bool Js.t Js.prop
  method isOpera10_5 : bool Js.t Js.prop
  method isReady : bool Js.t Js.prop
  method isSafari : bool Js.t Js.prop
  method isSafari2 : bool Js.t Js.prop
  method isSafari3 : bool Js.t Js.prop
  method isSafari4 : bool Js.t Js.prop
  method isSafari5 : bool Js.t Js.prop
  method isSafari5_0 : bool Js.t Js.prop
  method isSecure : bool Js.t Js.prop
  method isWebKit : bool Js.t Js.prop
  method isWindows : bool Js.t Js.prop
  method name : Js.js_string Js.t Js.prop
  method operaVersion : Js.number Js.t Js.prop
  method resetCls : Js.js_string Js.t Js.prop
  method safariVersion : Js.number Js.t Js.prop
  method scopeResetCSS : bool Js.t Js.prop
  method useShims : bool Js.t Js.prop
  method webKitVersion : Js.number Js.t Js.prop
  method addBehaviors : 'a Js.t -> unit Js.meth
  method application : 'a Js.t -> unit Js.meth
  method apply : 'a Js.t -> 'b Js.t -> 'c Js.t Js.optdef -> 'd Js.t Js.meth
  method applyIf : 'a Js.t -> 'b Js.t -> 'c Js.t Js.meth
  method batchLayouts : 'a Js.callback -> 'b Js.t Js.optdef -> unit Js.meth
  method bind : 'a Js.callback -> 'b Js.t Js.optdef ->
    'c Js.js_array Js.t Js.optdef -> 'd Js.t Js.optdef -> 'e Js.callback
    Js.meth
  method callback : 'a Js.callback -> 'b Js.t Js.optdef ->
    'c Js.js_array Js.t Js.optdef -> Js.number Js.t Js.optdef -> unit Js.meth
  method clone : 'a Js.t -> 'b Js.t Js.meth
  method copyTo : 'a Js.t -> 'b Js.t -> 'c Js.t -> bool Js.t Js.optdef ->
    'd Js.t Js.meth
  method create : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef -> 'b Js.t
    Js.meth
  method createByAlias : unit Js.meth
  method decode : Js.js_string Js.t -> bool Js.t Js.optdef -> 'a Js.t Js.meth
  method defer : 'a Js.callback -> Js.number Js.t -> 'b Js.t Js.optdef ->
    'c Js.js_array Js.t Js.optdef -> 'd Js.t Js.optdef -> Js.number Js.t
    Js.meth
  method define : Js.js_string Js.t -> 'a Js.t -> 'b Js.callback ->
    #Ext_Base.t Js.t Js.meth
  method deprecate : Js.js_string Js.t -> Js.js_string Js.t -> 'a Js.callback
    -> 'b Js.t -> unit Js.meth
  method destroy : 'a Js.t -> unit Js.meth
  method destroyMembers : 'a Js.t -> Js.js_string Js.t -> unit Js.meth
  method each : 'a Js.t -> 'b Js.callback -> 'c Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.meth
  method encode : 'a Js.t -> Js.js_string Js.t Js.meth
  method exclude : unit Js.meth
  method fly : 'a Js.t -> Js.js_string Js.t Js.optdef ->
    Ext_dom_AbstractElement_Fly.t Js.t Js.meth
  method get : 'a Js.t -> Ext_dom_Element.t Js.t Js.meth
  method getBody : unit Js.meth
  method getClass : unit Js.meth
  method getClassName : unit Js.meth
  method getCmp : Js.js_string Js.t -> unit Js.meth
  method getDoc : unit Js.meth
  method getDom : 'a Js.t -> unit Js.meth
  method getHead : unit Js.meth
  method getOrientation : Js.js_string Js.t Js.meth
  method getScrollbarSize : bool Js.t Js.optdef -> 'a Js.t Js.meth
  method getStore : 'a Js.t -> Ext_data_Store.t Js.t Js.meth
  method getVersion : Js.js_string Js.t Js.optdef -> Ext_Version.t Js.t
    Js.meth
  method id : 'a Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  method isArray : 'a Js.t -> bool Js.t Js.meth
  method isBoolean : 'a Js.t -> bool Js.t Js.meth
  method isDate : 'a Js.t -> bool Js.t Js.meth
  method isDefined : 'a Js.t -> bool Js.t Js.meth
  method isElement : 'a Js.t -> bool Js.t Js.meth
  method isEmpty : 'a Js.t -> bool Js.t Js.optdef -> bool Js.t Js.meth
  method isFunction : 'a Js.t -> bool Js.t Js.meth
  method isIterable : 'a Js.t -> bool Js.t Js.meth
  method isNumber : 'a Js.t -> bool Js.t Js.meth
  method isNumeric : 'a Js.t -> bool Js.t Js.meth
  method isObject : 'a Js.t -> bool Js.t Js.meth
  method isPrimitive : 'a Js.t -> bool Js.t Js.meth
  method isString : 'a Js.t -> bool Js.t Js.meth
  method isTextNode : 'a Js.t -> bool Js.t Js.meth
  method iterate : 'a Js.t -> 'b Js.callback -> 'c Js.t Js.optdef -> unit
    Js.meth
  method log : 'a Js.t Js.optdef -> Js.js_string Js.t Js.optdef -> unit
    Js.meth
  method merge : 'a Js.t -> 'b Js.t -> 'c Js.t Js.meth
  method namespace : Js.js_string Js.t -> 'a Js.t Js.meth
  method ns : Js.js_string Js.t -> 'a Js.t Js.meth
  method onDocumentReady : unit Js.meth
  method onReady : unit Js.meth
  method override : 'a Js.t -> 'b Js.t -> unit Js.meth
  method pass : 'a Js.callback -> 'b Js.js_array Js.t -> 'c Js.t Js.optdef ->
    'd Js.callback Js.meth
  method preg : Js.js_string Js.t -> 'a Js.callback -> unit Js.meth
  method query : Js.js_string Js.t -> Dom_html.element Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> Dom_html.element Js.t Js.js_array Js.t
    Js.meth
  method regStore : Js.js_string Js.t -> 'a Js.t -> unit Js.meth
  method removeNode : Dom_html.element Js.t -> unit Js.meth
  method require : unit Js.meth
  method resumeLayouts : bool Js.t Js.optdef -> unit Js.meth
  method select : 'a Js.t -> bool Js.t Js.optdef -> 'b Js.t Js.optdef ->
    'c Js.t Js.meth
  method setVersion : Js.js_string Js.t -> 'a Js.t -> 'b Js.t Js.meth
  method suspendLayouts : unit Js.meth
  method syncRequire : unit Js.meth
  method toArray : 'a Js.t -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> 'b Js.js_array Js.t Js.meth
  method typeOf : 'a Js.t -> Js.js_string Js.t Js.meth
  method valueFrom : 'a Js.t -> 'b Js.t -> bool Js.t Js.optdef -> 'c Js.t
    Js.meth
  method widget : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef -> 'b Js.t
    Js.meth
  
end

class type configs =
object('self)
  
  
end

class type events =
object
  
  
end

class type statics =
object
  
  
end

let static = Js.Unsafe.variable "Ext"

let get_instance () = Js.Unsafe.variable "Ext"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

