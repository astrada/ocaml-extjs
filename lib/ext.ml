let application ~(config : 'a Js.t) =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.application")
    [|Js.Unsafe.inject config|]

let require ~expressions ?(fn:(unit -> unit) option) () =
  let _expressions = Js.array (Array.map Js.string expressions) in
  let _fn = match fn with
      None -> Js.Unsafe.inject Js.undefined
    | Some v -> Js.Unsafe.inject (Js.wrap_callback v)
  in
    Js.Unsafe.fun_call
      (Js.Unsafe.variable "Ext.require")
      [|Js.Unsafe.inject _expressions; _fn|]

let create ~name ~(args : 'a Js.t) =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.create")
    [|Js.Unsafe.inject (Js.string name);
      Js.Unsafe.inject args|]

let define ~className ~(data : 'a Js.t) ?(createdFn:(unit -> unit) option) () =
  let _createdFn = match createdFn with
      None -> Js.Unsafe.inject Js.undefined
    | Some v -> Js.Unsafe.inject (Js.wrap_callback v)
  in
    Js.Unsafe.fun_call
      (Js.Unsafe.variable "Ext.define")
      [|Js.Unsafe.inject (Js.string className);
        Js.Unsafe.inject data;
        _createdFn|]

let widget ~name =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.widget")
    [|Js.Unsafe.inject (Js.string name)|]

