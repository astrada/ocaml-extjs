(** Collection of utility functions. *)

external assoc_get : 'a -> 'b -> 'c = "caml_js_assoc_get"
(** [assoc_get o k] returns member [k] of object [o] ([o[k]])  *)

external assoc_set : 'a -> 'b -> 'c -> unit = "caml_js_assoc_set"
(** [assoc_set o k v] set member [k] of object [o] to value [v] ([o[k] = v])  *)

external call_parent : 'a -> string -> unit = "caml_js_call_parent"
(** [call_parent o n] calls method [n] of the superclass of object [o] *)

val log : string -> unit
(** [log m] logs message [m] to Javascript console *)

val undef : 'a
(** Generic [undefined] to use as optional parameter *)

val to_class_configs : < .. > Js.t -> Ext_Class.configs Js.t
(** [to_class_configs o] converts instance [o] to an Ext.class config object *)

val alert : Js.js_string Js.t -> unit
(** [alert m] displays an alert dialog with content [m] and an OK button. *)

val setTimeout : (unit -> unit) -> int -> unit
(** [setTimeout f d] calls function [f] after delay [d]. *)

