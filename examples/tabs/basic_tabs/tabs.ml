let () =
  Ext.instance##require(
    Js.string "Ext.tab.*",
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      (* basic tabs 1, built from existing content *)
      let _ =
        Ext.instance##widget(Js.def (Js.string "tabpanel"), Js.def ({|
          renderTo = Js.string "tabs1";
          width = 450;
          activeTab = 0;
          defaults = {|
              bodyPadding = 10
          |};
          items = Js.array [|
            Js.Unsafe.inject {|
              contentEl = Js.string "script"; 
              title = Js.string "Short Text";
              closable = Js._true;
            |};
            Js.Unsafe.inject {|
              contentEl = Js.string "markup";
              title = Js.string "Long Text";
            |};
          |]
        |})) in
    
      (* second tabs built from JS *)
      let _ =
        Ext.instance##widget(Js.def (Js.string "tabpanel"), Js.def ({|
          renderTo = Dom_html.document##body;
          activeTab = 0;
          width = 600;
          height = 250;
          plain = Js._true;
          defaults = {|
            autoScroll = Js._true;
            bodyPadding = 10;
          |};
          items = Js.array [|
            Js.Unsafe.inject {|
              title = Js.string "Normal Tab";
              html = Js.string "My content was added during construction.";
            |};
            Js.Unsafe.inject {|
              title = Js.string "Ajax Tab 1";
              loader = {|
                url = Js.string "ajax1.htm";
                contentType = Js.string "html";
                loadMask = Js._true;
              |};
              listeners = {|
                activate = Js.wrap_callback (fun tab _ _ ->
                  tab##loader##load()
                );
              |};
            |};
            Js.Unsafe.inject {|
              title = Js.string "Ajax Tab 2";
              loader = {|
                url = Js.string "ajax2.htm";
                contentType = Js.string "html";
                autoLoad = Js._true;
                params = Js.string "foo=123&bar=abc";
              |};
            |};
            Js.Unsafe.inject {|
              title = Js.string "Event Tab";
              listeners = {|
                activate = Js.wrap_callback (fun tab _ _ ->
                  ExtUtils.setTimeout (fun () ->
                    ExtUtils.alert
                      (tab##title##concat(Js.string " was activated.")))
                    1);
              |};
              html = Js.string "I am tab 4's content. I also have an event listener attached.";
            |};
            Js.Unsafe.inject {|
              title = Js.string "Disabled Tab";
              disabled = Js._true;
              html = Js.string "Can't see me cause I'm disabled";
            |};
          |]
        |})) in ()
    ),
    ExtUtils.undef,
    ExtUtils.undef)

