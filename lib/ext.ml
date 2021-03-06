class type t =
object('self)
  
  method _BLANK_IMAGE_URL : Js.js_string Js.t Js.prop
  method _SSL_SECURE_URL : Js.js_string Js.t Js.prop
  method _USE_NATIVE_JSON : bool Js.t Js.prop
  method chromeVersion : Js.number Js.t Js.prop
  method emptyFn : _ Js.callback Js.prop
  method emptyString : _ Js.t Js.prop
  method enableFx : bool Js.t Js.prop
  method enableGarbageCollector : bool Js.t Js.prop
  method enableListenerCollection : bool Js.t Js.prop
  method enableNestedListenerRemoval : bool Js.t Js.prop
  method enumerables : Js.js_string Js.t Js.js_array Js.t Js.prop
  method firefoxVersion : Js.number Js.t Js.prop
  method globalEvents : Ext_util_Observable.t Js.t Js.prop
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
  method isIE10 : bool Js.t Js.prop
  method isIE10m : bool Js.t Js.prop
  method isIE10p : bool Js.t Js.prop
  method isIE6 : bool Js.t Js.prop
  method isIE7 : bool Js.t Js.prop
  method isIE7m : bool Js.t Js.prop
  method isIE7p : bool Js.t Js.prop
  method isIE8 : bool Js.t Js.prop
  method isIE8m : bool Js.t Js.prop
  method isIE8p : bool Js.t Js.prop
  method isIE9 : bool Js.t Js.prop
  method isIE9m : bool Js.t Js.prop
  method isIE9p : bool Js.t Js.prop
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
  method safariVersion : Js.number Js.t Js.prop
  method useShims : bool Js.t Js.prop
  method webKitVersion : Js.number Js.t Js.prop
  method addBehaviors : _ Js.t -> unit Js.meth
  method addNamespaces : _ Js.t -> unit Js.meth
  method application : _ Js.t -> unit Js.meth
  method apply : _ Js.t -> _ Js.t -> _ Js.t Js.optdef -> _ Js.t Js.meth
  method applyIf : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  method batchLayouts : _ Js.callback -> _ Js.t Js.optdef -> unit Js.meth
  method bind : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.callback Js.meth
  method callback : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> Js.number Js.t Js.optdef -> _ Js.t
    Js.meth
  method clone : _ Js.t -> _ Js.t Js.meth
  method coerce : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  method copyTo : _ Js.t -> _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method create : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t
    Js.meth
  method createByAlias : Js.js_string Js.t -> _ Js.t -> _ Js.t Js.meth
  method decode : Js.js_string Js.t -> bool Js.t Js.optdef -> _ Js.t Js.meth
  method defer : _ Js.callback -> Js.number Js.t -> _ Js.t Js.optdef ->
    _ Js.js_array Js.t Js.optdef -> _ Js.t Js.optdef -> Js.number Js.t
    Js.meth
  method define : Js.js_string Js.t -> _ Js.t -> _ Js.callback ->
    #Ext_Base.t Js.t Js.meth
  method deprecate : Js.js_string Js.t -> Js.js_string Js.t -> _ Js.callback
    -> _ Js.t -> unit Js.meth
  method destroy : _ Js.t -> unit Js.meth
  method destroyMembers : _ Js.t -> Js.js_string Js.t -> unit Js.meth
  method each : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef ->
    bool Js.t Js.optdef -> bool Js.t Js.meth
  method encode : _ Js.t -> Js.js_string Js.t Js.meth
  method exclude : _ Js.js_array Js.t -> _ Js.t Js.meth
  method fly : _ Js.t -> Js.js_string Js.t Js.optdef ->
    Ext_dom_Element_Fly.t Js.t Js.meth
  method get : _ Js.t -> Ext_dom_Element.t Js.t Js.meth
  method getBody : Ext_dom_Element.t Js.t Js.meth
  method getClass : _ Js.t -> Ext_Class.t Js.t Js.meth
  method getClassName : _ Js.t -> Js.js_string Js.t Js.meth
  method getCmp : Js.js_string Js.t -> _ Js.t Js.meth
  method getDoc : Ext_dom_Element.t Js.t Js.meth
  method getDom : _ Js.t -> _ Js.t Js.meth
  method getHead : Ext_dom_Element.t Js.t Js.meth
  method getNamespace : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  method getOrientation : Js.js_string Js.t Js.meth
  method getScrollbarSize : bool Js.t Js.optdef -> _ Js.t Js.meth
  method getStore : _ Js.t -> Ext_data_Store.t Js.t Js.meth
  method getVersion : Js.js_string Js.t Js.optdef -> Ext_Version.t Js.t
    Js.meth
  method id : _ Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  method identityFn : _ Js.t -> unit Js.meth
  method isArray : _ Js.t -> bool Js.t Js.meth
  method isBoolean : _ Js.t -> bool Js.t Js.meth
  method isDate : _ Js.t -> bool Js.t Js.meth
  method isDefined : _ Js.t -> bool Js.t Js.meth
  method isElement : _ Js.t -> bool Js.t Js.meth
  method isEmpty : _ Js.t -> bool Js.t Js.optdef -> bool Js.t Js.meth
  method isFunction : _ Js.t -> bool Js.t Js.meth
  method isIterable : _ Js.t -> bool Js.t Js.meth
  method isNumber : _ Js.t -> bool Js.t Js.meth
  method isNumeric : _ Js.t -> bool Js.t Js.meth
  method isObject : _ Js.t -> bool Js.t Js.meth
  method isPrimitive : _ Js.t -> bool Js.t Js.meth
  method isString : _ Js.t -> bool Js.t Js.meth
  method isTextNode : _ Js.t -> bool Js.t Js.meth
  method iterate : _ Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  method log : _ Js.t Js.optdef -> Js.js_string Js.t Js.optdef -> unit
    Js.meth
  method merge : _ Js.t -> _ Js.t -> _ Js.t Js.meth
  method namespace : Js.js_string Js.t -> _ Js.t Js.meth
  method ns : Js.js_string Js.t -> _ Js.t Js.meth
  method on : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> _ Js.t Js.meth
  method onDocumentReady : _ Js.callback -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method onReady : _ Js.callback -> _ Js.t -> _ Js.t -> unit Js.meth
  method override : _ Js.t -> _ Js.t -> unit Js.meth
  method pass : _ Js.callback -> _ Js.js_array Js.t -> _ Js.t Js.optdef ->
    _ Js.callback Js.meth
  method preg : Js.js_string Js.t -> _ Js.callback -> unit Js.meth
  method query : Js.js_string Js.t -> Dom_html.element Js.t Js.optdef ->
    Js.js_string Js.t Js.optdef -> bool Js.t Js.optdef ->
    Dom_html.element Js.t Js.js_array Js.t Js.meth
  method regStore : Js.js_string Js.t -> _ Js.t -> unit Js.meth
  method removeNode : Dom_html.element Js.t -> unit Js.meth
  method require : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef ->
    _ Js.t Js.optdef -> unit Js.meth
  method resumeLayouts : _ Js.t -> unit Js.meth
  method select : Js.js_string Js.t -> bool Js.t Js.optdef ->
    Ext_dom_CompositeElement.t Js.t Js.meth
  method setGlyphFontFamily : Js.js_string Js.t -> unit Js.meth
  method setVersion : Js.js_string Js.t -> _ Js.t -> _ Js.t Js.meth
  method suspendLayouts : unit Js.meth
  method syncRequire : _ Js.t -> _ Js.callback Js.optdef -> _ Js.t Js.optdef
    -> _ Js.t Js.optdef -> unit Js.meth
  method toArray : _ Js.t -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> _ Js.js_array Js.t Js.meth
  method typeOf : _ Js.t -> Js.js_string Js.t Js.meth
  method un : Js.js_string Js.t -> _ Js.callback -> _ Js.t Js.optdef -> unit
    Js.meth
  method valueFrom : _ Js.t -> _ Js.t -> bool Js.t Js.optdef -> _ Js.t
    Js.meth
  method widget : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef -> _ Js.t
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

let get_static () = Js.Unsafe.variable "Ext"

let static = get_static ()

let get_instance () = Js.Unsafe.variable "Ext"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

