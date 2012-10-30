let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.window.Window";
      Js.string "Ext.tab.*";
      Js.string "Ext.toolbar.Spacer";
      Js.string "Ext.layout.container.Card";
      Js.string "Ext.layout.container.Border";
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
    
      (Js.Unsafe.coerce (Ext_util_Region.get_static ()))##override({|
        colors = Js.array [|
          Js.string "red";
          Js.string "orange";
          Js.string "yellow";
          Js.string "green";
          Js.string "blue";
          Js.string "indigo";
          Js.string "violet"
        |];
        nextColor = 0;
        show = Js.wrap_meth_callback (fun this () ->
          let style = {|
            display = Js.string "block";
            position = Js.string "absolute";
            top = this##top##toString()##concat(Js.string "px");
            left = this##left##toString()##concat(Js.string "px");
            height = (Js.number_of_float (
              (Js.float_of_number this##bottom) -.
              (Js.float_of_number this##top) +.
              1.0))##toString()##concat(Js.string "px");
            width = (Js.number_of_float (
              (Js.float_of_number this##right) -.
              (Js.float_of_number this##left) +.
              1.0))##toString()##concat(Js.string "px");
            opacity = Js.number_of_float 0.3;
          |} in
          Js.Unsafe.set style (Js.string "pointer-events") (Js.string "none");
          Js.Unsafe.set style (Js.string "z-index") 9999999;

          if not (Js.Optdef.test (Js.Unsafe.coerce this)##highlightEl) then begin
            Js.Unsafe.set style (Js.string "background-color")
              (Js.Unsafe.get this##colors this##nextColor);
            (Js.Unsafe.coerce Ext_util_Region.static)##prototype##nextColor <-
              (Js.Unsafe.coerce Ext_util_Region.static)##prototype##nextColor + 1;
            this##highlightEl <- Ext.instance##getBody()##createChild({|
                  style = style
              |},
              Js.undefined,
              Js.undefined);
            if this##nextColor >= this##colors##length then begin
              this##nextColor <- 0;
            end;
          end else begin
            ignore (this##highlightEl##setStyle(style));
          end);
        hide = Js.wrap_meth_callback (fun this () ->
          if Js.Optdef.test (Js.Unsafe.coerce this)##highlightEl then begin
            this##highlightEl##setStyle({|
                display = Js.string "none";
            |});
          end);
      |},
      ExtUtils.undef);

      let constrainedWin =
        Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
          title = Js.string "Constrained Window";
          width = 200;
          height = 100;

          (* Constraining will pull the Window leftwards so that it's within the
           * parent Window *)
          x = 1000;
          y = 20;
          constrain = Js._true;
          layout = Js.string "fit";
          items = {|
            border = Js._false;
          |};
        |}) in
      let constrainedWin2 =
        Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
          title = Js.string "Header-Constrained Win";
          width = 200;
          height = 100;
          x = 120;
          y = 120;
          constrainHeader = Js._true;
          layout = Js.string "fit";
          items = {|
            border = Js._false;
          |};
        |}) in
      let win2 =
        Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
          height = 200;
          width = 400;
          x = 450;
          y = 450;
          title = Js.string "Constraining Window, plain: true";
          closable = Js._false;
          plain = Js._true;
          layout = Js.string "fit";
          items = Js.array [|
            Js.Unsafe.inject constrainedWin;
            Js.Unsafe.inject constrainedWin2;
            Js.Unsafe.inject {|
              border = Js._false;
            |};
          |];
        |}) in
      win2##show();
      constrainedWin##show();
      constrainedWin2##show();

      Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
        title = Js.string "Left Header, plain: true";
        width = 400;
        height = 200;
        x = 10;
        y = 200;
        plain = Js._true;
        headerPosition = Js.string "left";
        layout = Js.string "fit";
        items = {|
          border = Js._false;
        |};
      |})##show();

      Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
        title = Js.string "Right Header, plain: true";
        width = 400;
        height = 200;
        x = 450;
        y = 200;
        headerPosition = Js.string "right";
        layout = Js.string "fit";
        items = {|
          border = Js._false;
        |};
      |})##show();

      Ext.instance##create(Js.def (Js.string "Ext.Window"), Js.def {|
        title = Js.string "Bottom Header, plain: true";
        width = 400;
        height = 200;
        x = 10;
        y = 450;
        plain = true;
        headerPosition = Js.string "bottom";
        layout = Js.string "fit";
        items = {|
          border = Js._false;
        |};
      |})##show();
    ),
    ExtUtils.undef,
    ExtUtils.undef)

