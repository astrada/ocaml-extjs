let () =
  Ext.instance##require(
    Js.array [|Js.string "Ext.data.*"|],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let math_floor number =
  (Js.Unsafe.coerce Js.math)##floor(number)

let math_max n1 n2 =
  (Js.Unsafe.coerce Js.math)##max(n1, n2)

let generateData ?(n = 12) ?(floor = 20.0) () =
  let get_value floor =
    math_floor (math_max (Js.to_float Js.math##random() *. 100.0) floor)
  in

  let data = jsnew Js.array_empty () in

  for i = 0 to n do
    ignore (data##push({|
      name = Js.array_get (Ext_Date.instance##monthNames) (i mod 12);
      data1 = get_value floor;
      data2 = get_value floor;
      data3 = get_value floor;
      data4 = get_value floor;
      data5 = get_value floor;
      data6 = get_value floor;
      data7 = get_value floor;
      data8 = get_value floor;
      data9 = get_value floor;
    |}));
  done;
  data

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      let store1 = Ext.instance##create(
        Js.def (Js.string "Ext.data.JsonStore"),
        Js.def {|
          fields = Js.array [|
            Js.string "name";
            Js.string "data1";
            Js.string "data2";
            Js.string "data3";
            Js.string "data4";
            Js.string "data5";
            Js.string "data6";
            Js.string "data7";
            Js.string "data8";
            Js.string "data9"
          |];
        data = generateData ()
      |}) in
      ExtUtils.set_global "store1" store1;

      let store3 = Ext.instance##create(
        Js.def (Js.string "Ext.data.JsonStore"),
        Js.def {|
          fields = Js.array [|
            Js.string "name";
            Js.string "data1";
            Js.string "data2";
            Js.string "data3";
            Js.string "data4";
            Js.string "data5";
            Js.string "data6";
            Js.string "data7";
            Js.string "data8";
            Js.string "data9"
          |];
          data = generateData ()
      |}) in
      ExtUtils.set_global "store3" store3;

      let store4 = Ext.instance##create(
        Js.def (Js.string "Ext.data.JsonStore"),
        Js.def {|
          fields = Js.array [|
            Js.string "name";
            Js.string "data1";
            Js.string "data2";
            Js.string "data3";
            Js.string "data4";
            Js.string "data5";
            Js.string "data6";
            Js.string "data7";
            Js.string "data8";
            Js.string "data9"
          |];
          data = generateData ()
      |}) in
      ExtUtils.set_global "store4" store4;
    ),
    ExtUtils.undef,
    ExtUtils.undef)

