let application ~(config : 'a Js.t) =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.application")
    [|Js.Unsafe.inject config|]

let require ~expressions ?(fn:(unit -> unit) option) () =
  let _expressions = Js.array (Array.map Js.string expressions) in
  let _fn = Js.Optdef.map
              (Js.Optdef.option fn)
              (fun f -> Js.wrap_callback f)
  in
    Js.Unsafe.fun_call
      (Js.Unsafe.variable "Ext.require")
      [|Js.Unsafe.inject _expressions; Js.Unsafe.inject _fn|]

let create ~name ~(args : 'a Js.t) =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.create")
    [|Js.Unsafe.inject (Js.string name);
      Js.Unsafe.inject args|]

      (*
let require = Js.Unsafe.variable "Ext.require"
let create = Js.Unsafe.variable "Ext.create"

module Base =
struct
  class type t = object
  end
  let constructor : t Js.t Js.constr = Js.Unsafe.variable "Ext.Base"
end

module App =
struct
  module Controller =
  struct
    class type t = object
      inherit Base.t
    end
    let constructor : t Js.t Js.constr = Js.Unsafe.variable "Ext.app.Controller"
  end

  module Application =
  struct
    class type t = object
      inherit Controller.t

      method name : Js.js_string Js.t Js.prop
      method launch : (unit -> unit) Js.callback Js.prop
    end
    let constructor : t Js.t Js.constr =
      Js.Unsafe.variable "Ext.app.Application"
  end

end
       *)

