class type t =
object('self)
  
  method _DAY : Js.js_string Js.t Js.prop
  method _HOUR : Js.js_string Js.t Js.prop
  method _MILLI : Js.js_string Js.t Js.prop
  method _MINUTE : Js.js_string Js.t Js.prop
  method _MONTH : Js.js_string Js.t Js.prop
  method _SECOND : Js.js_string Js.t Js.prop
  method _YEAR : Js.js_string Js.t Js.prop
  method dayNames : Js.js_string Js.t Js.js_array Js.t Js.prop
  method defaultFormat : Js.js_string Js.t Js.prop
  method defaults : _ Js.t Js.prop
  method formatCodes : _ Js.t Js.prop
  method formatFunctions : _ Js.t Js.prop
  method monthNames : Js.js_string Js.t Js.js_array Js.t Js.prop
  method monthNumbers : _ Js.t Js.prop
  method parseFunctions : _ Js.t Js.prop
  method useStrict : bool Js.t Js.prop
  method add : Js.date Js.t -> Js.js_string Js.t -> Js.number Js.t ->
    Js.date Js.t Js.meth
  method between : Js.date Js.t -> Js.date Js.t -> Js.date Js.t -> bool Js.t
    Js.meth
  method clearTime : Js.date Js.t -> bool Js.t -> Js.date Js.t Js.meth
  method clone : Js.date Js.t -> Js.date Js.t Js.meth
  method format : Js.date Js.t -> Js.js_string Js.t -> Js.js_string Js.t
    Js.meth
  method formatContainsDateInfo : Js.js_string Js.t -> bool Js.t Js.meth
  method formatContainsHourInfo : Js.js_string Js.t -> bool Js.t Js.meth
  method getDayOfYear : Js.date Js.t -> Js.number Js.t Js.meth
  method getDaysInMonth : Js.date Js.t -> Js.number Js.t Js.meth
  method getElapsed : Js.date Js.t -> Js.date Js.t Js.optdef ->
    Js.number Js.t Js.meth
  method getFirstDateOfMonth : Js.date Js.t -> Js.date Js.t Js.meth
  method getFirstDayOfMonth : Js.date Js.t -> Js.number Js.t Js.meth
  method getGMTOffset : Js.date Js.t -> bool Js.t Js.optdef ->
    Js.js_string Js.t Js.meth
  method getLastDateOfMonth : Js.date Js.t -> Js.date Js.t Js.meth
  method getLastDayOfMonth : Js.date Js.t -> Js.number Js.t Js.meth
  method getMonthNumber : Js.js_string Js.t -> Js.number Js.t Js.meth
  method getShortDayName : Js.number Js.t -> Js.js_string Js.t Js.meth
  method getShortMonthName : Js.number Js.t -> Js.js_string Js.t Js.meth
  method getSuffix : Js.date Js.t -> Js.js_string Js.t Js.meth
  method getTimezone : Js.date Js.t -> Js.js_string Js.t Js.meth
  method getWeekOfYear : Js.date Js.t -> Js.number Js.t Js.meth
  method isDST : Js.date Js.t -> bool Js.t Js.meth
  method isEqual : Js.date Js.t -> Js.date Js.t -> bool Js.t Js.meth
  method isLeapYear : Js.date Js.t -> bool Js.t Js.meth
  method isValid : Js.number Js.t -> Js.number Js.t -> Js.number Js.t ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef ->
    Js.number Js.t Js.optdef -> Js.number Js.t Js.optdef -> bool Js.t Js.meth
  method now : Js.number Js.t Js.meth
  method parse : Js.js_string Js.t -> Js.js_string Js.t ->
    bool Js.t Js.optdef -> Js.date Js.t Js.meth
  method unescapeFormat : Js.js_string Js.t -> Js.js_string Js.t Js.meth
  
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

let get_static () = Js.Unsafe.variable "Ext.Date"

let static = get_static ()

let get_instance () = Js.Unsafe.variable "Ext.Date"

let instance = get_instance ()

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

