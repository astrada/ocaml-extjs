let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.form.*";
      Js.string "Ext.tip.QuickTipManager";
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->

      let required = Js.string "<span style=\"color:red;font-weight:bold\" data-qtip=\"Required\">*</span>" in

      ExtUtils.set_global "win" Js.undefined;

      (Ext_tip_QuickTipManager.get_instance ())##init(
        Js.undefined,
        Js.undefined);

      let showContactForm () =
        if not (ExtUtils.test_global "win") then begin
          let form =
            Ext.instance##widget(
              Js.def (Js.string "form"),
              Js.def {|
                layout = {|
                  _type = Js.string "vbox";
                  align = Js.string "stretch"
                |};
                border = Js._false;
                bodyPadding = 10;

                fieldDefaults = {|
                  labelAlign = Js.string "top";
                  labelWidth = 100;
                  labelStyle = Js.string "font-weight:bold"
                |};
                items = Js.array [|
                  Js.Unsafe.inject {|
                    xtype = Js.string "fieldcontainer";
                    fieldLabel = Js.string "Your Name";
                    labelStyle = Js.string "font-weight:bold;padding:0";
                    layout = Js.string "hbox";
                    defaultType = Js.string "textfield";

                    fieldDefaults = {|
                      labelAlign = Js.string "top"
                    |};

                    items = Js.array [|
                      Js.Unsafe.inject {|
                        flex = 1;
                        name = Js.string "firstName";
                        afterLabelTextTpl = required;
                        fieldLabel = Js.string "First";
                        allowBlank = Js._false
                      |};
                      Js.Unsafe.inject {|
                        width = 30;
                        name = Js.string "middleInitial";
                        fieldLabel = Js.string "MI";
                        margins = Js.string "0 0 0 5"
                      |};
                      Js.Unsafe.inject {|
                        flex = 2;
                        name = Js.string "lastName";
                        afterLabelTextTpl = required;
                        fieldLabel = Js.string "Last";
                        allowBlank = Js._false;
                        margins = Js.string "0 0 0 5"
                      |};
                    |]
                  |};
                  Js.Unsafe.inject {|
                    xtype = Js.string "textfield";
                    fieldLabel = Js.string "Your Email Address";
                    afterLabelTextTpl = required;
                    vtype = Js.string "email";
                    allowBlank = Js._false
                  |};
                  Js.Unsafe.inject {|
                    xtype = Js.string "textfield";
                    fieldLabel = Js.string "Subject";
                    afterLabelTextTpl = required;
                    allowBlank = Js._false
                  |};
                  Js.Unsafe.inject {|
                    xtype = Js.string "textareafield";
                    fieldLabel = Js.string "Message";
                    labelAlign = Js.string "top";
                    flex = 1;
                    margins = Js.string "0";
                    afterLabelTextTpl = required;
                    allowBlank = Js._false
                  |};
                |];

                buttons = Js.array [|
                  Js.Unsafe.inject {|
                    text = Js.string "Cancel";
                    handler = Js.wrap_meth_callback (fun this () ->
                      this##up(Js.string "form")##getForm()##reset();
                      this##up(Js.string "window")##hide();
                    )
                  |};
                  Js.Unsafe.inject {|
                    text = Js.string "Send";
                    handler = Js.wrap_meth_callback (fun this () ->
                      if Js.to_bool (Js.Unsafe.coerce this##up(Js.string "form")##getForm())##isValid() then begin
                          (* In a real application, this would submit the form to the configured url
                          this##up(Js.string "form")##getForm()##submit(); *)
                          this##up(Js.string "form")##getForm()##reset();
                          this##up(Js.string "window")##hide();
                          ignore (Ext_MessageBox.get_instance())##alert(
                            Js.string "Thank you!",
                            Js.string "Your inquiry has been sent. We will respond as soon as possible.",
                            Js.undefined,
                            Js.undefined);
                      end
                    )
                  |};
                |]
              |}
            ) in

          ExtUtils.set_global "win" (
            Ext.instance##widget(
              Js.def (Js.string "window"),
              Js.def {|
                title = Js.string "Contact Us";
                closeAction = Js.string "hide";
                width = 400;
                height = 400;
                layout = Js.string "fit";
                resizable = Js._true;
                modal = Js._true;
                items = form
              |})
          );
        end;

        (ExtUtils.get_global "win")##show();
      in

      let _ =
        Ext.instance##widget(
          Js.def (Js.string "panel"),
          Js.def {|
            renderTo = Ext.instance##getBody();
            title = Js.string "Welcome!";
            width = 500;
            bodyPadding = 20;

            items = Js.array [|
              Js.Unsafe.inject {|
                xtype = Js.string "component";
                html = Js.string "Thank you for visiting our site! We welcome your feedback; please click the button below to send us a message. We will respond to your inquiry as quickly as possible.";
                style = Js.string "margin-bottom: 20px;"
              |};
              Js.Unsafe.inject {|
                xtype = Js.string "container";
                style = Js.string "text-align:center";
                items = Js.array [|
                  Js.Unsafe.inject {|
                    xtype = Js.string "button";
                    cls = Js.string "contactBtn";
                    scale = Js.string "large";
                    text = Js.string "Contact Us";
                    handler = Js.wrap_callback showContactForm
                  |}
                |]
              |}
            |]
          |})
      in ()

    ),
    ExtUtils.undef,
    ExtUtils.undef)

