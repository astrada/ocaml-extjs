class type t = object
  inherit Ext_Class.t
  inherit Ext_data_Model.t
end

let () =
  let model : t Js.t =
    {| extend = Js.string "Ext.data.Model";
       fields = Js.array [|Js.string "name";
                           Js.string "email"|];
    |}
  in

  Ext.define
    ~className:"AM.model.User"
    ~data:model
    ()

