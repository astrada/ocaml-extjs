let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.grid.*";
      Js.string "Ext.data.*";
      Js.string "Ext.util.*";
      Js.string "Ext.state.*"
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

(* Define Company entity
 * Null out built in convert functions for performance *because the raw data is known to be valid*
 * Specifying defaultValue as undefined will also save code. *As long as there will always be values in the data, or the app tolerates undefined field values*
 *)
let _ =
  Ext.instance##define(
    Js.string "Company",
    {| extend = Js.string "Ext.data.Model";
       fields = Js.array [|
         Js.Unsafe.inject {|
            name = Js.string "company";
         |};
         Js.Unsafe.inject {|
            name = Js.string "price";
            _type = Js.string "float";
            convert = Js.null;
            defaultValue = Js.undefined;
         |};
         Js.Unsafe.inject {|
            name = Js.string "change";
            _type = Js.string "float";
            convert = Js.null;
            defaultValue = Js.undefined;
         |};
         Js.Unsafe.inject {|
            name = Js.string "pctChange";
            _type = Js.string "float";
            convert = Js.null;
            defaultValue = Js.undefined;
         |};
         Js.Unsafe.inject {|
            name = Js.string "lastChange";
            _type = Js.string "date";
            dateFormat = Js.some (Js.string "n/j h:ia");
            defaultValue = Js.undefined;
         |};
       |];
       idProperty = Js.string "company";
    |},
    ExtUtils.undef)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      (* Using get_instance to access singleton, because Ext.tip.QuickTipManager
       * is lazy-loaded. *)
      (Ext_tip_QuickTipManager.get_instance ())##init(
        Js.undefined,
        Js.undefined);
      
      (* setup the state provider, all state information will be saved to a
       * cookie *)
      (* Using get_instance to access singleton, because Ext.state.Manager is
       * lazy-loaded. *)
      (Ext_state_Manager.get_instance ())##setProvider(
        Ext.instance##create(
          Js.def (Js.string "Ext.state.CookieProvider"),
          Js.undefined));

      (* sample static data for the store *)
      let myData = Js.array [|
        Js.array [|
          Js.Unsafe.inject (Js.string "3m Co");
          Js.Unsafe.inject 71.72;
          Js.Unsafe.inject 0.02;
          Js.Unsafe.inject 0.03;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Alcoa Inc");
          Js.Unsafe.inject 29.01;
          Js.Unsafe.inject 0.42;
          Js.Unsafe.inject 1.47;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Altria Group Inc");
          Js.Unsafe.inject 83.81;
          Js.Unsafe.inject 0.28;
          Js.Unsafe.inject 0.34;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "American Express Company");
          Js.Unsafe.inject 52.55;
          Js.Unsafe.inject 0.01;
          Js.Unsafe.inject 0.02;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "American International Group; Inc.");
          Js.Unsafe.inject 64.13;
          Js.Unsafe.inject 0.31;
          Js.Unsafe.inject 0.49;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "AT&T Inc.");
          Js.Unsafe.inject 31.61;
          Js.Unsafe.inject (-0.48);
          Js.Unsafe.inject (-1.54);
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Boeing Co.");
          Js.Unsafe.inject 75.43;
          Js.Unsafe.inject 0.53;
          Js.Unsafe.inject 0.71;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Caterpillar Inc.");
          Js.Unsafe.inject 67.27;
          Js.Unsafe.inject 0.92;
          Js.Unsafe.inject 1.39;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Citigroup; Inc.");
          Js.Unsafe.inject 49.37;
          Js.Unsafe.inject 0.02;
          Js.Unsafe.inject 0.04;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "E.I. du Pont de Nemours and Company");
          Js.Unsafe.inject 40.48;
          Js.Unsafe.inject 0.51;
          Js.Unsafe.inject 1.28;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Exxon Mobil Corp");
          Js.Unsafe.inject 68.1;
          Js.Unsafe.inject (-0.43);
          Js.Unsafe.inject (-0.64);
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "General Electric Company");
          Js.Unsafe.inject 34.14;
          Js.Unsafe.inject (-0.08);
          Js.Unsafe.inject (-0.23);
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "General Motors Corporation");
          Js.Unsafe.inject 30.27;
          Js.Unsafe.inject 1.09;
          Js.Unsafe.inject 3.74;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Hewlett-Packard Co.");
          Js.Unsafe.inject 36.53;
          Js.Unsafe.inject (-0.03);
          Js.Unsafe.inject (-0.08);
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Honeywell Intl Inc");
          Js.Unsafe.inject 38.77;
          Js.Unsafe.inject 0.05;
          Js.Unsafe.inject 0.13;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Intel Corporation");
          Js.Unsafe.inject 19.88;
          Js.Unsafe.inject 0.31;
          Js.Unsafe.inject 1.58;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "International Business Machines");
          Js.Unsafe.inject 81.41;
          Js.Unsafe.inject 0.44;
          Js.Unsafe.inject 0.54;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Johnson & Johnson");
          Js.Unsafe.inject 64.72;
          Js.Unsafe.inject 0.06;
          Js.Unsafe.inject 0.09;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "JP Morgan & Chase & Co");
          Js.Unsafe.inject 45.73;
          Js.Unsafe.inject 0.07;
          Js.Unsafe.inject 0.15;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "McDonald's Corporation");
          Js.Unsafe.inject 36.76;
          Js.Unsafe.inject 0.86;
          Js.Unsafe.inject 2.40;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Merck & Co.; Inc.");
          Js.Unsafe.inject 40.96;
          Js.Unsafe.inject 0.41;
          Js.Unsafe.inject 1.01;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Microsoft Corporation");
          Js.Unsafe.inject 25.84;
          Js.Unsafe.inject 0.14;
          Js.Unsafe.inject 0.54;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Pfizer Inc");
          Js.Unsafe.inject 27.96;
          Js.Unsafe.inject 0.4;
          Js.Unsafe.inject 1.45;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "The Coca-Cola Company");
          Js.Unsafe.inject 45.07;
          Js.Unsafe.inject 0.26;
          Js.Unsafe.inject 0.58;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "The Home Depot; Inc.");
          Js.Unsafe.inject 34.64;
          Js.Unsafe.inject 0.35;
          Js.Unsafe.inject 1.02;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "The Procter & Gamble Company");
          Js.Unsafe.inject 61.91;
          Js.Unsafe.inject 0.01;
          Js.Unsafe.inject 0.02;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "United Technologies Corporation");
          Js.Unsafe.inject 63.26;
          Js.Unsafe.inject 0.55;
          Js.Unsafe.inject 0.88;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Verizon Communications");
          Js.Unsafe.inject 35.57;
          Js.Unsafe.inject 0.39;
          Js.Unsafe.inject 1.11;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
        Js.array [|
          Js.Unsafe.inject (Js.string "Wal-Mart Stores; Inc.");
          Js.Unsafe.inject 45.45;
          Js.Unsafe.inject 0.73;
          Js.Unsafe.inject 1.63;
          Js.Unsafe.inject (Js.string "9/1 12:00am")
        |];
      |] in

      (**
       * Custom function used for column renderer
       * @param {Object} value
       *)
      let change value  =
        if Js.float_of_number value > 0.0 then
          (Js.string "<span style=\"color:green;\">")##concat_2(
            value##toString(),
            Js.string "</span>")
        else if Js.float_of_number value < 0.0 then
          (Js.string "<span style=\"color:red;\">")##concat_2(
            value##toString(),
            Js.string "</span>")
        else value##toString()
      in

      (**
       * Custom function used for column renderer
       * @param {Object} value
       *)
      let pctChange value =
        if Js.float_of_number value > 0.0 then
          (Js.string "<span style=\"color:green;\">")##concat_2(
            value##toString(),
            Js.string "%</span>")
        else if Js.float_of_number value < 0.0 then
          (Js.string "<span style=\"color:red;\">")##concat_2(
            value##toString(),
            Js.string "%</span>")
        else value##toString()
      in

      (* create the data store *)
      let store = Ext.instance##create(
        Js.def (Js.string "Ext.data.ArrayStore"),
        Js.def ({| model = Js.string "Company";
           data = myData;
        |}))
      in

      (* create the Grid *)
      Ext.instance##create(
        Js.def (Js.string "Ext.grid.Panel"),
        Js.def (
        {| store = store;
           stateful = Js._true;
           collapsible = Js._true;
           multiSelect = Js._true;
           stateId = Js.string "stateGrid";
           columns = Js.array [|
             Js.Unsafe.inject {|
                text = Js.string "Company";
                flex = 1;
                sortable = Js._false;
                dataIndex = Js.string "company";
             |};
             Js.Unsafe.inject {|
                text = Js.string "Price";
                width = 75;
                sortable = Js._true;
                renderer = Js.string "usMoney";
                dataIndex = Js.string "price";
             |};
             Js.Unsafe.inject {|
                text = Js.string "Change";
                width = 75;
                sortable = Js._true;
                renderer = change;
                dataIndex = Js.string "change";
             |};
             Js.Unsafe.inject {|
                text = Js.string "% Change";
                width = 75;
                sortable = Js._true;
                renderer = pctChange;
                dataIndex = Js.string "pctChange";
             |};
             Js.Unsafe.inject {|
                text = Js.string "Last Updated";
                width = 85;
                sortable = Js._true;
                renderer = Ext_util_Format.instance##dateRenderer(Js.string "m/d/Y");
                dataIndex = Js.string "lastChange";
             |};
             Js.Unsafe.inject {|
                menuDisabled = Js._true;
                sortable = Js._false;
                xtype = Js.string "actioncolumn";
                width = 50;
                items = Js.array [|
                  Js.Unsafe.inject {|
                     icon = Js.string "extjs/examples/shared/icons/fam/delete.gif"; (* Use a URL in the icon config *)
                     tooltip = Js.string "Sell stock";
                     handler =
                       (fun grid rowIndex colIndex ->
                          let record = store##getAt(rowIndex) in
                          ExtUtils.alert ((Js.string "Sell ")##concat(record##get(Js.string "company")))
                       );
                  |};
                  Js.Unsafe.inject {|
                     getClass = Js.wrap_meth_callback
                       (fun this v meta record _ _ _ _ -> (* Or return a class from a function *)
                          let opt_items = Js.array_get (this##items) 1 in
                          let items =
                            Js.Optdef.get opt_items (fun () -> ExtUtils.undef) in
                          if record##get(Js.string "change") < 0 then begin
                            items##tooltip <- Js.string "Hold stock";
                            Js.string "alert-col"
                          end else begin
                            items##tooltip <- Js.string "Buy stock";
                            Js.string "buy-col"
                          end
                       );
                     handler = Js.wrap_callback
                       (fun grid rowIndex colIndex ->
                          let record = store##getAt(rowIndex) in
                          let message = if (Js.float_of_number (Js.Unsafe.coerce record##get(Js.string "change"))) < 0.0 then Js.string "Hold " else Js.string "Buy " in
                          ExtUtils.alert (message##concat(record##get(Js.string "company")))
                       );
                  |};
                |];
             |};
           |];
           height = 350;
           width = 600;
           title = Js.string "Array Grid";
           renderTo = Js.string "grid-example";
           viewConfig = {|
              stripeRows = Js._true;
              enableTextSelection = Js._true;
           |};
        |}))
    ),
    ExtUtils.undef,
    ExtUtils.undef)

