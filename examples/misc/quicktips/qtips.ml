let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.tip.*";
      Js.string "Ext.Button";
      Js.string "Ext.window.MessageBox";
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      (* Generate the buttons *)
      let style = {| |} in
      Js.Unsafe.set style (Js.string "margin-right") (Js.string "10px");
      let defaultButtonConfig = {|
        scale = Js.string "medium";
        style = style;
      |} in
      
      let buttons = Js.array [|
        Js.Unsafe.inject {|
          id = Js.string "tip1";
          text = Js.string "Basic ToolTip";
          renderTo = Js.string "easiest";
        |};
        Js.Unsafe.inject {|
          id = Js.string "tip2";
          text = Js.string "autoHide disabled";
          renderTo = Js.string "easiest";
        |};
        Js.Unsafe.inject {|
          id = Js.string "ajax-tip";
          text = Js.string "Ajax ToolTip";
          renderTo = Js.string "easiest";
        |};
        Js.Unsafe.inject {|
          id = Js.string "track-tip";
          text = Js.string "Mouse Track";
          renderTo = Js.string "easiest";
        |};
        Js.Unsafe.inject {|
          id = Js.string "leftCallout";
          text = Js.string "Anchor right, rich content";
          renderTo = Js.string "anchor";
        |};
        Js.Unsafe.inject {|
          id = Js.string "bottomCallout";
          text = Js.string "Anchor below";
          width = 200;
          renderTo = Js.string "anchor";
        |};
        Js.Unsafe.inject {|
          id = Js.string "trackCallout";
          text = Js.string "Anchor with tracking";
          renderTo = Js.string "anchor";
        |};
      |] in
    
      let _ =
        Ext.instance##each(
          buttons,
          Js.wrap_callback (fun config ->
             let btn =
               Ext.instance##create(
                 Js.def (Js.string "Ext.Button"),
                 Js.def (Ext.instance##apply(
                   {| |},
                   config,
                   Js.def defaultButtonConfig))) in
               btn##show()),
          Js.undefined,
          Js.undefined) in
    
      let tooltips = Js.array [|
        Js.Unsafe.inject {|
          target = Js.string "tip1";
          html = Js.string "A very simple tooltip";
        |};
        Js.Unsafe.inject {|
          target = Js.string "ajax-tip";
          width = 200;
          autoLoad = {| url = Js.string "ajax-tip.html" |};
          dismissDelay = 15000; (* auto hide after 15 seconds *)
        |};
        Js.Unsafe.inject {|
          target = Js.string "tip2";
          title = Js.string "My Tip Title";
          html = Js.string "Click the X to close me";
          autoHide = Js._false;
          closable = Js._true;
          draggable = Js._true;
        |};
        Js.Unsafe.inject {|
          target = Js.string "track-tip";
          title = Js.string "Mouse Track";
          width = 200;
          html = Js.string "This tip will follow the mouse while it is over the element";
          trackMouse = Js._true;
        |};
        Js.Unsafe.inject {|
          title = Js.string "<a href=\"#\">Rich Content Tooltip</a>";
          id = Js.string "content-anchor-tip";
          target = Js.string "leftCallout";
          anchor = Js.string "left";
          html = Js.null;
          width = 415;
          autoHide = Js._false;
          closable = Js._true;
          contentEl = Js.string "content-tip"; (* load content from the page *)
          listeners = {|
            render = Js.wrap_callback (fun this _ ->
              this##header##on(
                Js.string "click",
                Js.wrap_callback (fun header e _ ->
                   e##stopEvent();
                   let _ =
                     (Ext_MessageBox.get_instance ())##alert(
                       Js.string "Link",
                       Js.string "Link to something interesting.",
                       Js.undefined,
                       Js.undefined) in
                   Ext.instance##getCmp(Js.string "content-anchor-tip")##hide();
                ),
                this,
                {| delegate = Js.string "a" |});
            )
          |};
        |};
        Js.Unsafe.inject {|
          target = Js.string "bottomCallout";
          anchor = Js.string "top";
          anchorOffset = 85; (* center the anchor on the tooltip *)
          html = Js.string "This tip\"s anchor is centered";
        |};
        Js.Unsafe.inject {|
          target = Js.string "trackCallout";
          anchor = Js.string "right";
          trackMouse = Js._true;
          html = Js.string "Tracking while you move the mouse";
        |};
      |] in

      let _ =
        Ext.instance##each(
          tooltips,
          Js.wrap_callback (fun config ->
            Ext.instance##create(
              Js.def (Js.string "Ext.tip.ToolTip"),
              Js.def config);
          ),
          Js.undefined,
          Js.undefined) in

      (Ext_tip_QuickTipManager.get_instance ())##init(
        Js.undefined,
        Js.undefined);
    ),
    ExtUtils.undef,
    ExtUtils.undef)

