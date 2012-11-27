let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.grid.*";
      Js.string "Ext.data.*";
      Js.string "Ext.dd.*"
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let ext_example_msg args =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.example.msg")
    args

let _ =
  Ext.instance##define(Js.string "DataObject", {|
    extend = Js.string "Ext.data.Model";
    fields =
      Js.array [|Js.string "name"; Js.string "column1"; Js.string "column2"|]
  |},
  ExtUtils.undef)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->

      let myData = Js.array [|
        {| name = Js.string "Rec 0"; column1 = Js.string "0"; column2 = Js.string "0" |};
        {| name = Js.string "Rec 1"; column1 = Js.string "1"; column2 = Js.string "1" |};
        {| name = Js.string "Rec 2"; column1 = Js.string "2"; column2 = Js.string "2" |};
        {| name = Js.string "Rec 3"; column1 = Js.string "3"; column2 = Js.string "3" |};
        {| name = Js.string "Rec 4"; column1 = Js.string "4"; column2 = Js.string "4" |};
        {| name = Js.string "Rec 5"; column1 = Js.string "5"; column2 = Js.string "5" |};
        {| name = Js.string "Rec 6"; column1 = Js.string "6"; column2 = Js.string "6" |};
        {| name = Js.string "Rec 7"; column1 = Js.string "7"; column2 = Js.string "7" |};
        {| name = Js.string "Rec 8"; column1 = Js.string "8"; column2 = Js.string "8" |};
        {| name = Js.string "Rec 9"; column1 = Js.string "9"; column2 = Js.string "9" |}
      |] in

      (* create the data store *)
      let firstGridStore =
        Ext.instance##create(Js.def (Js.string "Ext.data.Store"), Js.def {|
          model = Js.string "DataObject";
          data = myData
        |}) in

      (* Column Model shortcut array *)
      let columns = Js.array [|
        {| text = Js.string "Record Name"; flex = 1; sortable = true; dataIndex = Js.string "name" |};
        {| text = Js.string "column1"; width = 70; sortable = true; dataIndex = Js.string "column1" |};
        {| text = Js.string "column2"; width = 70; sortable = true; dataIndex = Js.string "column2" |}
      |] in

      (* declare the source Grid *)
      let firstGrid =
        Ext.instance##create(Js.def (Js.string "Ext.grid.Panel"), Js.def {|
          multiSelect = Js._true;
          viewConfig = {|
            plugins = {|
              ptype = Js.string "gridviewdragdrop";
              dragGroup = Js.string "firstGridDDGroup";
              dropGroup = Js.string "secondGridDDGroup"
            |};
            listeners = {|
              drop = Js.wrap_callback (fun node data dropRec dropPosition _ ->
                let dropOn =
                  if Js.Optdef.test (Js.Optdef.return dropRec) then
                    (Js.string " ")##concat_3(dropPosition, Js.string " ", dropRec##get(Js.string "name"))
                  else Js.string " on empty view" in
                let opt_record = Js.array_get (data##records) 0 in
                let record =
                  Js.Optdef.get opt_record (fun () -> ExtUtils.undef) in
                ext_example_msg [|
                  Js.Unsafe.inject (Js.string "Drag from right to left");
                  Js.Unsafe.inject (Js.string "Dropped ")##concat_2(record##get(Js.string "name"), dropOn);
                |]
              )
            |}
          |};
          store = firstGridStore;
          columns = columns;
          stripeRows = Js._true;
          title = Js.string "First Grid";
          margins = Js.string "0 2 0 0"
        |}) in

      let secondGridStore =
        Ext.instance##create(Js.def (Js.string "Ext.data.Store"), Js.def {|
          model = Js.string "DataObject"
        |}) in

      (* create the destination Grid *)
      let secondGrid =
        Ext.instance##create(Js.def (Js.string "Ext.grid.Panel"), Js.def {|
          viewConfig = {|
            plugins = {|
              ptype = Js.string "gridviewdragdrop";
              dragGroup = Js.string "secondGridDDGroup";
              dropGroup = Js.string "firstGridDDGroup"
            |};
            listeners = {|
              drop = Js.wrap_callback (fun node data dropRec dropPosition _ ->
                let dropOn =
                  if Js.Optdef.test (Js.Optdef.return dropRec) then
                    (Js.string " ")##concat_3(dropPosition, Js.string " ", dropRec##get(Js.string "name"))
                  else Js.string " on empty view" in
                let opt_record = Js.array_get (data##records) 0 in
                let record =
                  Js.Optdef.get opt_record (fun () -> ExtUtils.undef) in
                ext_example_msg [|
                  Js.Unsafe.inject (Js.string "Drag from left to right");
                  Js.Unsafe.inject (Js.string "Dropped ")##concat_2(record##get(Js.string "name"), dropOn);
                |]
              )
            |}
          |};
          store = secondGridStore;
          columns = columns;
          stripeRows = Js._true;
          title = Js.string "Second Grid";
          margins = Js.string "0 0 0 3"
        |}) in

      (* Simple 'border layout' panel to house both grids *)
      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.Panel"), Js.def {|
          width = 650;
          height = 300;
          layout = {|
            _type = Js.string "hbox";
            align = Js.string "stretch";
            padding = 5
          |};
          renderTo = Js.string "panel";
          defaults = {| flex = 1 |}; (* auto stretch *)
          items = Js.array [|
            firstGrid;
            secondGrid
          |];
          dockedItems = {|
            xtype = Js.string "toolbar";
            dock = Js.string "bottom";
            items = Js.array [|
              Js.Unsafe.inject (Js.string "->"); (* Fill *)
              Js.Unsafe.inject {|
                text = Js.string "Reset both grids";
                handler = Js.wrap_callback (fun () ->
                  (* refresh source grid *)
                  firstGridStore##loadData(myData);

                  (* purge destination grid *)
                  secondGridStore##removeAll();
                )
              |}
            |]
          |}
        |}) in ()
    ),
    ExtUtils.undef,
    ExtUtils.undef)

