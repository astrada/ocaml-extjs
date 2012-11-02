let () =
  Ext.instance##require(
    Js.string "widget.panel",
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      let data = {|
        name = Js.string "Abe Elias";
        company = Js.string "Sencha Inc";
        address = Js.string "525 University Ave";
        city = Js.string "Palo Alto";
        state = Js.string "California";
        zip = Js.string "44102";
        kids = Js.array [|
          Js.Unsafe.inject {|
            name = Js.string "Solomon";
            age = 3;
          |};
          Js.Unsafe.inject {|
            name = Js.string "Rebecca";
            age = 2;
          |};
          Js.Unsafe.inject {|
            name = Js.string "Rebecca 1";
            age = 0;
          |};
        |];
      |} in

      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.Panel"), Js.def {|
          width = 300;
          renderTo = Js.string "template-example";
          style = Js.string "margin:15px";
          bodyStyle = Js.string "padding:5px;font-size:11px;";
          title = Js.string "Basic Template";
          tbar = Js.array [|
            Js.Unsafe.inject {|
              text = Js.string "Apply Template";
              listeners = {|
                click = Js.wrap_callback (fun this _ _ ->
                  let panel = this##up(Js.string "panel") in
                  let tpl =
                    Ext.instance##create(
                      Js.def (Js.string "Ext.Template"), 
                      Js.def (Js.array [|
                        Js.string "<p>Name = {name}</p>";
                        Js.string "<p>Company = {company}</p>";
                        Js.string "<p>Location = {city}, {state}</p>";
                      |])) in

                  tpl##overwrite(panel##body, data);
                  panel##doComponentLayout();
                );
              |};
            |};
          |];
          html = Js.string "<p><i>Apply the template to see results here</i></p>";
        |}) in

      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.Panel"), Js.def {|
          width = 300;
          renderTo = Js.string "xtemplate-example";
          style = Js.string "margin:15px";
          bodyStyle = Js.string "padding:5px;font-size:11px;";
          title = Js.string "XTemplate";
          tbar = Js.array [|
            Js.Unsafe.inject {|
              text = Js.string "Apply Template";
              listeners = {|
                click = Js.wrap_callback (fun this _ _ ->
                  let panel = this##up(Js.string "panel") in
                  let tpl =
                    Ext.instance##create(
                      Js.def (Js.string "Ext.XTemplate"),
                      Js.def (Js.array [|
                        Js.string "<p>Name: {name}</p>";
                        Js.string "<p>Company: {company}</p>";
                        Js.string "<p>Location: {city}, {state}</p>";
                        Js.string "<p>Kids: ";
                        Js.string "<tpl for=\"kids\" if=\"age &eq;%eq; 'Abe Elias'>";
                        Js.string "<tpl if=\"age &gt; 1\"><p>{#}. {parent.name}'s kid - {name}</p></tpl>";
                        Js.string "</tpl></p>";
                      |])
                    ) in
                  tpl##overwrite(panel##body, data);
                  panel##doComponentLayout();
                );
              |};
            |};
          |];
          html = Js.string "<p><i>Apply the template to see results here</i></p>";
        |}) in ()
    ),
    ExtUtils.undef,
    ExtUtils.undef)

