class type t =
object('self)
  inherit Ext_Base.t
  
  method isSortable : bool Js.t Js.prop
  method sorters : _ Js.t Js.prop
  method generateComparator : unit Js.meth
  method getFirstSorter : Ext_util_Sorter.t Js.t Js.meth
  method initSortable : unit Js.meth
  method sort : _ Js.t Js.optdef -> Js.js_string Js.t Js.optdef ->
    Ext_util_Sorter.t Js.js_array Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  
  method defaultSortDirection : Js.js_string Js.t Js.prop
  method sortRoot : Js.js_string Js.t Js.prop
  method sorters : _ Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  
  
end

class type statics =
object
  inherit Ext_Base.statics
  
  method createComparator : Ext_util_Sorter.t Js.js_array Js.t ->
    _ Js.callback Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.util.Sortable"

let static = get_static ()

let createComparator sorters =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "createComparator")
    [|Js.Unsafe.inject sorters; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

