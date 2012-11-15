let () =
  Ext.instance##require(
    Js.string "Ext.chart.*",
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.Window";
      Js.string "Ext.fx.target.Sprite";
      Js.string "Ext.layout.container.Fit";
      Js.string "Ext.window.MessageBox";
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      let odd = {|
        opacity = 1;
        fill = Js.string "#ddd";
        stroke = Js.string "#bbb";
      |} in
      Js.Unsafe.set odd (Js.string "stroke-width") 1;

      let chart =
        Ext.instance##create(Js.def (Js.string "Ext.chart.Chart"), Js.def {|
          id = Js.string "chartCmp";
          xtype = Js.string "chart";
          style = Js.string "background:#fff";
          animate = Js._true;
          store = ExtUtils.get_global "store1";
          legend = {|
            position = Js.string "bottom"
          |};
          axes = Js.array [|
            Js.Unsafe.inject {|
              _type = Js.string "Numeric";
              position = Js.string "left";
              fields = Js.array [|
                Js.string "data1";
                Js.string "data2";
                Js.string "data3";
                Js.string "data4";
                Js.string "data5";
                Js.string "data6";
                Js.string "data7"
              |];
              title = Js.string "Number of Hits";
              grid = {|
                odd = odd
              |};
              minimum = 0;
              adjustMinimumByMajorUnit = 0
            |};
            Js.Unsafe.inject {|
              _type = Js.string "Category";
              position = Js.string "bottom";
              fields = Js.array [| Js.string "name" |];
              title = Js.string "Month of the Year";
              grid = Js._true;
              label = {|
                rotate = {|
                  degrees = 315
                |}
              |}
            |}
          |];
          series = Js.array [|
            {| _type = Js.string "area";
               highlight = Js._false;
               axis = Js.string "left";
               xField = Js.string "name";
               yField = Js.array [|
                 Js.string "data1";
                 Js.string "data2";
                 Js.string "data3";
                 Js.string "data4";
                 Js.string "data5";
                 Js.string "data6";
                 Js.string "data7"
               |];
               style = {|
                 opacity = 0.93
               |}
            |}
          |]
        |}) in
    
      let _ = Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
        width = 800;
        height = 600;
        minHeight = 400;
        minWidth = 550;
        hidden = Js._false;
        shadow = Js._false;
        maximizable = Js._true;
        title = Js.string "Area Chart";
        renderTo = Ext.instance##getBody();
        layout = Js.string "fit";
        tbar = Js.array [|
          Js.Unsafe.inject {|
            text = Js.string "Save Chart";
            handler = Js.wrap_callback (fun () ->
              (Ext_MessageBox.get_instance ())##confirm(
                Js.string "Confirm Download",
                Js.string "Would you like to download the chart as an image?",
                Js.def (Js.wrap_callback (fun choice ->
                  if choice = Js.string "yes" then
                    chart##save({|
                      _type = Js.string "image/png"
                    |})
                )),
                Js.undefined
              );
            )
          |};
          Js.Unsafe.inject {|
            text = Js.string "Reload Data";
            handler = Js.wrap_callback (fun () ->
              let store1 = ExtUtils.get_global "store1" in
              store1##loadData(Example_data.generateData ());
            )
          |};
          Js.Unsafe.inject {|
            enableToggle = Js._true;
            pressed = Js._true;
            text = Js.string "Animate";
            toggleHandler = Js.wrap_callback (fun btn pressed ->
              let chart = Ext.instance##getCmp(Js.string "chartCmp") in
              chart##animate <-
                if pressed then
                  Js.Unsafe.inject
                    {| easing = Js.string "ease"; duration = 500 |}
                else Js.Unsafe.inject Js._false;
            )
          |}
        |];
        items = chart
      |}) in ()
    ),
    ExtUtils.undef,
    ExtUtils.undef)

