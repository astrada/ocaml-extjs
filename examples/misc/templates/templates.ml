let () =
  Ext.instance##require(
    Js.string "Ext.panel.Panel",
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
          margin = 15;
          bodyPadding = 5;
          title = Js.string "Basic Template";
          tpl = Js.array [|
            Js.string "<p>Name = {name}</p>";
            Js.string "<p>Company = {company}</p>";
            Js.string "<p>Location = {city}, {state}</p>";
          |];
          tbar = Js.array [|
            Js.Unsafe.inject {|
              text = Js.string "Apply Template";
              handler = Js.wrap_callback (fun this () ->
                let panel = this##up(Js.string "panel") in
                panel##update(data);
              );
            |};
          |];
          html = Js.string "<p><i>Apply the template to see results here</i></p>";
        |}) in

      let _ =
        Ext.instance##create(Js.def (Js.string "Ext.Panel"), Js.def {|
          width = 300;
          renderTo = Js.string "xtemplate-example";
          margin = 15;
          bodyPadding = 5;
          title = Js.string "XTemplate";
          tpl = Js.array [|
            Js.string "<p>Name: {name}</p>";
            Js.string "<p>Company: {company}</p>";
            Js.string "<p>Location: {city}, {state}</p>";
            Js.string "<p>Kids: ";
            Js.string "<tpl for=\"kids\" if=\"age &eq;%eq; 'Abe Elias'>";
            Js.string "<tpl if=\"age &gt; 1\"><p>{#}. {parent.name}'s kid - {name}</p></tpl>";
            Js.string "</tpl></p>";
          |];
          tbar = Js.array [|
            Js.Unsafe.inject {|
              text = Js.string "Apply Template";
              handler = Js.wrap_callback (fun this () ->
                let panel = this##up(Js.string "panel") in
                panel##update(data);
              );
            |};
          |];
          html = Js.string "<p><i>Apply the template to see results here</i></p>";
        |}) in ()
    ),
    ExtUtils.undef,
    ExtUtils.undef)

