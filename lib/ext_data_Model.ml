class type t =
object('self)
  inherit Ext_Base.t
  inherit Ext_util_Observable.t
  
  method dirty : bool Js.t Js.readonly_prop
  method editing : bool Js.t Js.readonly_prop
  method fields : Ext_util_MixedCollection.t Js.t Js.prop
  method isModel : bool Js.t Js.prop
  method modified : _ Js.t Js.prop
  method phantom : bool Js.t Js.prop
  method raw : _ Js.t Js.prop
  method store : _ Js.t Js.prop
  method stores : _ Js.js_array Js.t Js.prop
  method beginEdit : unit Js.meth
  method cancelEdit : unit Js.meth
  method commit : bool Js.t Js.optdef ->
    Js.js_string Js.t Js.js_array Js.t Js.optdef -> unit Js.meth
  method copy : Js.js_string Js.t Js.optdef -> 'self Js.t Js.meth
  method destroy : _ Js.t -> 'self Js.t Js.meth
  method endEdit : bool Js.t Js.optdef ->
    Js.js_string Js.t Js.js_array Js.t Js.optdef -> unit Js.meth
  method get : Js.js_string Js.t -> _ Js.t Js.meth
  method getAssociatedData : _ Js.t Js.meth
  method getChanges : _ Js.t Js.meth
  method getData : bool Js.t -> _ Js.t Js.meth
  method getId : _ Js.t Js.meth
  method getProxy : _ Js.t Js.meth
  method isModified : Js.js_string Js.t -> bool Js.t Js.meth
  method isValid : bool Js.t Js.meth
  method join : _ Js.t -> unit Js.meth
  method reject : bool Js.t Js.optdef -> unit Js.meth
  method save : _ Js.t Js.optdef -> 'self Js.t Js.meth
  method set : _ Js.t -> _ Js.t -> Js.js_string Js.t Js.js_array Js.t Js.meth
  method setDirty : unit Js.meth
  method setId : _ Js.t -> unit Js.meth
  method setProxy : _ Js.t -> _ Js.t Js.meth
  method unjoin : _ Js.t -> unit Js.meth
  method validate : Ext_data_Errors.t Js.t Js.meth
  
end

class type configs =
object('self)
  inherit Ext_Base.configs
  inherit Ext_util_Observable.configs
  
  method associations : _ Js.t Js.js_array Js.t Js.prop
  method belongsTo : _ Js.t Js.prop
  method clientIdProperty : Js.js_string Js.t Js.prop
  method defaultProxyType : Js.js_string Js.t Js.prop
  method fields : _ Js.t Js.prop
  method hasMany : _ Js.t Js.prop
  method idProperty : _ Js.t Js.prop
  method idgen : _ Js.t Js.prop
  method proxy : _ Js.t Js.prop
  method validations : _ Js.t Js.js_array Js.t Js.prop
  
end

class type events =
object
  inherit Ext_Base.events
  inherit Ext_util_Observable.events
  
  method idchanged : (t Js.t -> _ Js.t -> _ Js.t -> _ Js.t -> unit)
    Js.callback Js.writeonly_prop
  
end

class type statics =
object
  inherit Ext_Base.statics
  inherit Ext_util_Observable.statics
  
  method _COMMIT : Js.js_string Js.t Js.prop
  method _EDIT : Js.js_string Js.t Js.prop
  method _REJECT : Js.js_string Js.t Js.prop
  method getFields : Ext_data_Field.t Js.js_array Js.t Js.meth
  method getProxy : _ Js.t Js.meth
  method id : 'self Js.t -> Js.js_string Js.t Js.meth
  method load : _ Js.t -> _ Js.t Js.optdef -> unit Js.meth
  method setFields : _ Js.t -> _ Js.t -> _ Js.t -> unit Js.meth
  method setProxy : _ Js.t -> _ Js.t Js.meth
  
end

let get_static () = Js.Unsafe.variable "Ext.data.Model"

let static = get_static ()

let getFields () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getFields") [||]

let getProxy () =
  Js.Unsafe.meth_call static (Js.Unsafe.variable "getProxy") [||]

let id _rec =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "id")
    [|Js.Unsafe.inject _rec; |]

let load id config =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "load")
    [|Js.Unsafe.inject id; Js.Unsafe.inject config; |]

let setFields fields idProperty clientIdProperty =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "setFields")
    [|Js.Unsafe.inject
      fields;
      Js.Unsafe.inject
      idProperty;
      Js.Unsafe.inject
      clientIdProperty;
      |]

let setProxy proxy =
  Js.Unsafe.meth_call
    static
    (Js.Unsafe.variable "setProxy")
    [|Js.Unsafe.inject proxy; |]

let of_configs c = Js.Unsafe.coerce c

let to_configs o = Js.Unsafe.coerce o

