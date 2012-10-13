class type t =
object('self)
  inherit Ext_Base.t
  
  method a : Js.number Js.t Js.prop
  method aLT : Js.number Js.t Js.prop
  method b : Js.number Js.t Js.prop
  method bACKSPACE : Js.number Js.t Js.prop
  method c : Js.number Js.t Js.prop
  method cAPS_LOCK : Js.number Js.t Js.prop
  method cONTEXT_MENU : Js.number Js.t Js.prop
  method cTRL : Js.number Js.t Js.prop
  method d : Js.number Js.t Js.prop
  method dELETE : Js.number Js.t Js.prop
  method dOWN : Js.number Js.t Js.prop
  method e : Js.number Js.t Js.prop
  method eIGHT : Js.number Js.t Js.prop
  method eND : Js.number Js.t Js.prop
  method eNTER : Js.number Js.t Js.prop
  method eSC : Js.number Js.t Js.prop
  method f : Js.number Js.t Js.prop
  method f1 : Js.number Js.t Js.prop
  method f10 : Js.number Js.t Js.prop
  method f11 : Js.number Js.t Js.prop
  method f12 : Js.number Js.t Js.prop
  method f2 : Js.number Js.t Js.prop
  method f3 : Js.number Js.t Js.prop
  method f4 : Js.number Js.t Js.prop
  method f5 : Js.number Js.t Js.prop
  method f6 : Js.number Js.t Js.prop
  method f7 : Js.number Js.t Js.prop
  method f8 : Js.number Js.t Js.prop
  method f9 : Js.number Js.t Js.prop
  method fIVE : Js.number Js.t Js.prop
  method fOUR : Js.number Js.t Js.prop
  method g : Js.number Js.t Js.prop
  method h : Js.number Js.t Js.prop
  method hOME : Js.number Js.t Js.prop
  method i : Js.number Js.t Js.prop
  method iNSERT : Js.number Js.t Js.prop
  method j : Js.number Js.t Js.prop
  method k : Js.number Js.t Js.prop
  method l : Js.number Js.t Js.prop
  method lEFT : Js.number Js.t Js.prop
  method m : Js.number Js.t Js.prop
  method n : Js.number Js.t Js.prop
  method nINE : Js.number Js.t Js.prop
  method nUM_CENTER : Js.number Js.t Js.prop
  method nUM_DIVISION : Js.number Js.t Js.prop
  method nUM_EIGHT : Js.number Js.t Js.prop
  method nUM_FIVE : Js.number Js.t Js.prop
  method nUM_FOUR : Js.number Js.t Js.prop
  method nUM_MINUS : Js.number Js.t Js.prop
  method nUM_MULTIPLY : Js.number Js.t Js.prop
  method nUM_NINE : Js.number Js.t Js.prop
  method nUM_ONE : Js.number Js.t Js.prop
  method nUM_PERIOD : Js.number Js.t Js.prop
  method nUM_PLUS : Js.number Js.t Js.prop
  method nUM_SEVEN : Js.number Js.t Js.prop
  method nUM_SIX : Js.number Js.t Js.prop
  method nUM_THREE : Js.number Js.t Js.prop
  method nUM_TWO : Js.number Js.t Js.prop
  method nUM_ZERO : Js.number Js.t Js.prop
  method o : Js.number Js.t Js.prop
  method oNE : Js.number Js.t Js.prop
  method p : Js.number Js.t Js.prop
  method pAGE_DOWN : Js.number Js.t Js.prop
  method pAGE_UP : Js.number Js.t Js.prop
  method pAUSE : Js.number Js.t Js.prop
  method pRINT_SCREEN : Js.number Js.t Js.prop
  method q : Js.number Js.t Js.prop
  method r : Js.number Js.t Js.prop
  method rETURN : Js.number Js.t Js.prop
  method rIGHT : Js.number Js.t Js.prop
  method s : Js.number Js.t Js.prop
  method sEVEN : Js.number Js.t Js.prop
  method sHIFT : Js.number Js.t Js.prop
  method sIX : Js.number Js.t Js.prop
  method sPACE : Js.number Js.t Js.prop
  method t : Js.number Js.t Js.prop
  method tAB : Js.number Js.t Js.prop
  method tHREE : Js.number Js.t Js.prop
  method tWO : Js.number Js.t Js.prop
  method u : Js.number Js.t Js.prop
  method uP : Js.number Js.t Js.prop
  method v : Js.number Js.t Js.prop
  method w : Js.number Js.t Js.prop
  method wHEEL_SCALE : Js.number Js.t Js.prop
  method x : Js.number Js.t Js.prop
  method y : Js.number Js.t Js.prop
  method z : Js.number Js.t Js.prop
  method zERO : Js.number Js.t Js.prop
  method altKey : bool Js.t Js.prop
  method ctrlKey : bool Js.t Js.prop
  method shiftKey : bool Js.t Js.prop
  method correctWheelDelta : Js.number Js.t -> unit Js.meth
  method getCharCode : Js.number Js.t Js.meth
  method getKey : Js.number Js.t Js.meth
  method getPoint : Ext_util_Point.t Js.t Js.meth
  method getRelatedTarget : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef
    -> bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method getTarget : Js.js_string Js.t Js.optdef -> 'a Js.t Js.optdef ->
    bool Js.t Js.optdef -> Dom_html.element Js.t Js.meth
  method getWheelDelta : Js.number Js.t Js.meth
  method getWheelDeltas : 'a Js.t Js.meth
  method getX : Js.number Js.t Js.meth
  method getXY : Js.number Js.t Js.js_array Js.t Js.meth
  method getY : Js.number Js.t Js.meth
  method hasModifier : bool Js.t Js.meth
  method injectEvent : 'a Js.t Js.optdef -> unit Js.meth
  method isNavKeyPress : bool Js.t Js.meth
  method isSpecialKey : bool Js.t Js.meth
  method preventDefault : unit Js.meth
  method stopEvent : unit Js.meth
  method stopPropagation : unit Js.meth
  method within : 'a Js.t -> bool Js.t Js.optdef -> bool Js.t Js.optdef ->
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

let static = Js.Unsafe.variable "Ext.EventObject"

let instance = Js.Unsafe.variable "Ext.EventObject"

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

