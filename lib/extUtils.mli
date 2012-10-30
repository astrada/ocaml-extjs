(** Collection of utility functions. *)

external call_parent : 'a -> string -> unit = "caml_js_call_parent"
(** [call_parent o n] calls method [n] of the superclass of object [o]. *)

val log : string -> unit
(** [log m] logs message [m] to Javascript console. *)

val undef : 'a
(** Generic [undefined] to use as optional parameter. *)

val to_class_configs : < .. > Js.t -> Ext_Class.configs Js.t
(** [to_class_configs o] converts instance [o] to an Ext.class config object *)

val alert : Js.js_string Js.t -> unit
(** [alert m] displays an alert dialog with content [m] and an OK button. *)

val setTimeout : (unit -> unit) -> int -> unit
(** [setTimeout f d] calls function [f] after delay [d]. *)

val get_global : string -> 'a
(* [get_global n] gets the value of global variable [n]. A global variable
 * is a property of the [window] DOM object. *)

val set_global : string -> 'a -> unit
(* [set_global n v] sets global variable [n] using value [v]. A global variable
 * is a property of the [window] DOM object. *)

val test_global : string -> bool
(* [test_global n] tests global variable [n] checking if it is defined. A global
 * variable is a property of the [window] DOM object. *)

