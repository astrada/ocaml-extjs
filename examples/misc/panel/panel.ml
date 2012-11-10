let () =
  Ext.instance##require(
    Js.array [| Js.string "*"; |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      let html = Js.string "<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed metus nibh, sodales a, \
      porta at, vulputate eget, dui. Pellentesque ut nisl. Maecenas tortor turpis, interdum non, sodales non, iaculis ac, \
      lacus. Vestibulum auctor, tortor quis iaculis malesuada, libero lectus bibendum purus, sit amet tincidunt quam turpis \
      vel lacus. In pellentesque nisl non sem. Suspendisse nunc sem, pretium eget, cursus a, fringilla vel, urna.<br/><br/>\
      Aliquam commodo ullamcorper erat. Nullam vel justo in neque porttitor laoreet. Aenean lacus dui, consequat eu, adipiscing \
      eget, nonummy non, nisi. Morbi nunc est, dignissim non, ornare sed, luctus eu, massa. Vivamus eget quam. Vivamus tincidunt \
      diam nec urna. Curabitur velit. Lorem ipsum dolor sit amet.</p>" in
    
      let configs = Js.array [|
        Js.Unsafe.inject {|
          title = Js.string "Basic Panel";
          collapsible = Js._true;
          width = 400;
          html = html;
        |};
        Js.Unsafe.inject {|
          width = 320;
          height = 320;
          title = Js.string "Masked Panel with a really long title";
          bodyStyle = Js.string "padding: 5px;";
          html = Js.string "Some content";
          collapsible = Js._true;
          collapseDirection = Js.string "left";
          listeners = {|
            render = Js.wrap_callback (fun p _ ->
              p##body##mask(Js.string "Loading...");
            );
            delay = 50;
          |};
        |};
        Js.Unsafe.inject {|
          width = 150;
          height = 150;
          unstyled = Js._true;
          title = Js.string "Panel with unstyled:true";
          bodyPadding = 0;
          html = Js.string "Some content";
        |};
        Js.Unsafe.inject {|
          width = 150;
          height = 150;
          border = Js._false;
          frame = Js._true;
          title = Js.string "Panel with border:false";
          html = Js.string "Some content";
        |};
        Js.Unsafe.inject {|
          title = Js.string "Framed panel: Width 280/Height 180";
          html = html;
          collapsible = Js._true;
          frame = Js._true;
          autoScroll = Js._true;
          width = 280;
          height = 180;
        |};
        Js.Unsafe.inject {|
          title = Js.string "Panel as child";
          width = 500;
          height = 400;
          layout = Js.string "fit";
          bodyStyle = Js.string "padding:5px";
          items = Js.array [|
            Js.Unsafe.inject {|
              xtype = Js.string "panel";
              border = Js._false;
              layout = {|
                _type = Js.string "vbox";
                align = Js.string "stretch";
              |};
              items = Js.array [|
                Js.Unsafe.inject {|
                  html = Js.string "top, with no title";
                  height = 100;
                  margin = Js.string "0 0 5 0";
                |};
                Js.Unsafe.inject {|
                  xtype = Js.string "panel";
                  title = Js.string "test";
                  html = Js.string "bottom";
                  flex = 1;
                |};
              |];
            |};
          |];
        |};
        Js.Unsafe.inject {|
          title = Js.string "Framed panel as child";
          width = 300;
          height = 100;
          html = Js.null;
          layout = Js.string "fit";
          items = Js.array [|
            Js.Unsafe.inject {|
              xtype = Js.string "panel";
              title = Js.string "Framed panel";
              html = Js.string "123";
              frame = Js._true;
            |};
          |];
        |};
        Js.Unsafe.inject {|
          title = Js.string "Framed panel with normal child";
          width = 300;
          height = 100;
          html = Js.null;
          frame = Js._true;
          layout = Js.string "fit";
          items = Js.array [|
            Js.Unsafe.inject {|
              xtype = Js.string "panel";
              title = Js.string "Non-framed child";
              html = Js.string "Hello";
            |};
          |];
        |};
        Js.Unsafe.inject {|
          title = Js.string "Width 180/No Height";
          animCollapse = Js._true;
          collapsible = Js._true;
          width = 180;
          html = html;
        |};
      |] in
      
      Ext.instance##each(
        configs,
        Js.wrap_callback (fun config ->
          let element =
            Ext.instance##getBody()##createChild({|
              cls = Js.string "panel-container";
            |}, Js.undefined, Js.undefined) in
          
          let _ =
            Ext.instance##widget(
              Js.def (Js.string "panel"),
              Js.def (Ext.instance##applyIf(config, {|
                renderTo = element;
                bodyPadding = 7;
              |}))
            ) in ()
        ),
        Js.undefined,
        Js.undefined);
    ),
    ExtUtils.undef,
    ExtUtils.undef)

