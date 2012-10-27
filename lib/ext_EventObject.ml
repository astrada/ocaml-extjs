class type t =
object('self)
  inherit Ext_Base.t
  
  method _A : Js.number Js.t Js.prop
  method _ALT : Js.number Js.t Js.prop
  method _B : Js.number Js.t Js.prop
  method _BACKSPACE : Js.number Js.t Js.prop
  method _C : Js.number Js.t Js.prop
  method _CAPS_LOCK : Js.number Js.t Js.prop
  method _CONTEXT_MENU : Js.number Js.t Js.prop
  method _CTRL : Js.number Js.t Js.prop
  method _D : Js.number Js.t Js.prop
  method _DELETE : Js.number Js.t Js.prop
  method _DOWN : Js.number Js.t Js.prop
  method _E : Js.number Js.t Js.prop
  method _EIGHT : Js.number Js.t Js.prop
  method _END : Js.number Js.t Js.prop
  method _ENTER : Js.number Js.t Js.prop
  method _ESC : Js.number Js.t Js.prop
  method _F : Js.number Js.t Js.prop
  method _F1 : Js.number Js.t Js.prop
  method _F10 : Js.number Js.t Js.prop
  method _F11 : Js.number Js.t Js.prop
  method _F12 : Js.number Js.t Js.prop
  method _F2 : Js.number Js.t Js.prop
  method _F3 : Js.number Js.t Js.prop
  method _F4 : Js.number Js.t Js.prop
  method _F5 : Js.number Js.t Js.prop
  method _F6 : Js.number Js.t Js.prop
  method _F7 : Js.number Js.t Js.prop
  method _F8 : Js.number Js.t Js.prop
  method _F9 : Js.number Js.t Js.prop
  method _FIVE : Js.number Js.t Js.prop
  method _FOUR : Js.number Js.t Js.prop
  method _G : Js.number Js.t Js.prop
  method _H : Js.number Js.t Js.prop
  method _HOME : Js.number Js.t Js.prop
  method _I : Js.number Js.t Js.prop
  method _INSERT : Js.number Js.t Js.prop
  method _J : Js.number Js.t Js.prop
  method _K : Js.number Js.t Js.prop
  method _L : Js.number Js.t Js.prop
  method _LEFT : Js.number Js.t Js.prop
  method _M : Js.number Js.t Js.prop
  method _N : Js.number Js.t Js.prop
  method _NINE : Js.number Js.t Js.prop
  method _NUM_CENTER : Js.number Js.t Js.prop
  method _NUM_DIVISION : Js.number Js.t Js.prop
  method _NUM_EIGHT : Js.number Js.t Js.prop
  method _NUM_FIVE : Js.number Js.t Js.prop
  method _NUM_FOUR : Js.number Js.t Js.prop
  method _NUM_MINUS : Js.number Js.t Js.prop
  method _NUM_MULTIPLY : Js.number Js.t Js.prop
  method _NUM_NINE : Js.number Js.t Js.prop
  method _NUM_ONE : Js.number Js.t Js.prop
  method _NUM_PERIOD : Js.number Js.t Js.prop
  method _NUM_PLUS : Js.number Js.t Js.prop
  method _NUM_SEVEN : Js.number Js.t Js.prop
  method _NUM_SIX : Js.number Js.t Js.prop
  method _NUM_THREE : Js.number Js.t Js.prop
  method _NUM_TWO : Js.number Js.t Js.prop
  method _NUM_ZERO : Js.number Js.t Js.prop
  method _O : Js.number Js.t Js.prop
  method _ONE : Js.number Js.t Js.prop
  method _P : Js.number Js.t Js.prop
  method _PAGE_DOWN : Js.number Js.t Js.prop
  method _PAGE_UP : Js.number Js.t Js.prop
  method _PAUSE : Js.number Js.t Js.prop
  method _PRINT_SCREEN : Js.number Js.t Js.prop
  method _Q : Js.number Js.t Js.prop
  method _R : Js.number Js.t Js.prop
  method _RETURN : Js.number Js.t Js.prop
  method _RIGHT : Js.number Js.t Js.prop
  method _S : Js.number Js.t Js.prop
  method _SEVEN : Js.number Js.t Js.prop
  method _SHIFT : Js.number Js.t Js.prop
  method _SIX : Js.number Js.t Js.prop
  method _SPACE : Js.number Js.t Js.prop
  method _T : Js.number Js.t Js.prop
  method _TAB : Js.number Js.t Js.prop
  method _THREE : Js.number Js.t Js.prop
  method _TWO : Js.number Js.t Js.prop
  method _U : Js.number Js.t Js.prop
  method _UP : Js.number Js.t Js.prop
  method _V : Js.number Js.t Js.prop
  method _W : Js.number Js.t Js.prop
  method _WHEEL_SCALE : Js.number Js.t Js.prop
  method _X : Js.number Js.t Js.prop
  method _Y : Js.number Js.t Js.prop
  method _Z : Js.number Js.t Js.prop
  method _ZERO : Js.number Js.t Js.prop
  method altKey : bool Js.t Js.prop
  method ctrlKey : bool Js.t Js.prop
  method shiftKey : bool Js.t Js.prop
  method correctWheelDelta : Js.number Js.t -> unit Js.meth
  method getCharCode : Js.number Js.t Js.meth
  method getKey : Js.number Js.t Js.meth
  method getPoint : Ext_util_Point.t Js.t Js.meth
  method getRelatedTarget : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef
    -> bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method getTarget : Js.js_string Js.t Js.optdef -> _ Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method getWheelDelta : Js.number Js.t Js.meth
  method getWheelDeltas : _ Js.t Js.meth
  method getX : Js.number Js.t Js.meth
  method getXY : Js.number Js.t Js.js_array Js.t Js.meth
  method getY : Js.number Js.t Js.meth
  method hasModifier : bool Js.t Js.meth
  method injectEvent : _ Js.t Js.optdef -> unit Js.meth
  method isNavKeyPress : bool Js.t Js.meth
  method isSpecialKey : bool Js.t Js.meth
  method preventDefault : unit Js.meth
  method stopEvent : unit Js.meth
  method stopPropagation : unit Js.meth
  method within : _ Js.t -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
    bool Js.t Js.meth
  
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
  
  
end

let get_static () = Js.Unsafe.variable "Ext.EventObject"

let static = get_static ()

let get_instance () = Js.Unsafe.variable "Ext.EventObject"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

