let () =
  Ext.instance##require(
    Js.array [|
      Js.string "Ext.window.MessageBox";
      Js.string "Ext.tip.*"
    |],
    Js.undefined,
    Js.undefined,
    Js.undefined)

let ext_example_msg args =
  Js.Unsafe.fun_call
    (Js.Unsafe.variable "Ext.example.msg")
    args

let showResult = (fun btn _ _ ->
  ext_example_msg
    [|Js.Unsafe.inject (Js.string "Button Click");
      Js.Unsafe.inject (Js.string "You clicked the {0} button");
      Js.Unsafe.inject btn;
    |]
)

let showResultText = (fun btn text _ ->
  ext_example_msg
    [|Js.Unsafe.inject (Js.string "Button Click");
      Js.Unsafe.inject (Js.string "You clicked the {0} button and entered the text \"{1}\".");
      Js.Unsafe.inject btn;
      Js.Unsafe.inject text;
    |]
)

let () =
  Ext.instance##onReady(
    Js.wrap_callback (fun () ->
      let _ =
        Ext.instance##get(Js.string "mb1")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            (Ext_MessageBox.get_instance ())##confirm(
              Js.string "Confirm",
              Js.string "Are you sure you want to do that?",
              Js.def (Js.wrap_callback showResult),
              Js.undefined)),
          Js.undefined,
          Js.undefined)
      in

      let _ =
        Ext.instance##get(Js.string "mb2")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            (Ext_MessageBox.get_instance ())##prompt(
              Js.string "Name",
              Js.string "Please enter your name:",
              Js.def (Js.wrap_callback showResultText),
              Js.undefined,
              Js.undefined,
              Js.undefined)),
          Js.undefined,
          Js.undefined)
      in

      let _ =
        Ext.instance##get(Js.string "mb3")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            (Ext_MessageBox.get_instance ())##show(Js.def {|
              title = Js.string "Address";
              msg = Js.string "Please enter your address:";
              width = 300;
              buttons = (Ext_MessageBox.get_instance ())##_OKCANCEL;
              multiline = true;
              fn = Js.wrap_callback showResultText;
              animateTarget = Js.string "mb3";
            |},
            Js.undefined,
            Js.undefined)),
          Js.undefined,
          Js.undefined)
      in

      let _ =
        Ext.instance##get(Js.string "mb4")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            (Ext_MessageBox.get_instance ())##show(Js.def {|
              title = Js.string "Save Changes?";
              msg = Js.string "You are closing a tab that has unsaved changes. <br />Would you like to save your changes?";
              buttons = (Ext_MessageBox.get_instance ())##_YESNOCANCEL;
              fn = Js.wrap_callback showResult;
              animateTarget = Js.string "mb4";
              icon = (Ext_MessageBox.get_instance ())##_QUESTION;
            |},
            Js.undefined,
            Js.undefined)),
          Js.undefined,
          Js.undefined)
      in

      let _ =
        Ext.instance##get(Js.string "mb6")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            let _ =
              (Ext_MessageBox.get_instance ())##show(Js.def {|
                title = Js.string "Please wait";
                msg = Js.string "Loading items...";
                progressText = Js.string "Initializing...";
                width = 300;
                progress = Js._true;
                closable = Js._false;
                animateTarget = Js.string "mb6";
              |},
              Js.undefined,
              Js.undefined) in

            (* this hideous block creates the bogus progress *)
            let f = (fun v () ->
              if v = 12 then begin
                let _ =
                  (Ext_MessageBox.get_instance ())##hide(
                    Js.undefined, Js.undefined, Js.undefined) in
                ext_example_msg
                  [|Js.Unsafe.inject (Js.string "Done");
                    Js.Unsafe.inject (Js.string "Your fake items were loaded!");
                  |];
              end else begin
                let i = (float_of_int v) /. 11.0 in
                let perc =
                  Js.Unsafe.fun_call (Js.Unsafe.variable "Math.round")
                    [|Js.Unsafe.inject (Js.number_of_float (100.0 *. i))|] in
                let _ =
                  (Ext_MessageBox.get_instance ())##updateProgress(
                    Js.def (Js.number_of_float i),
                    Js.def perc##toString()##concat(Js.string "% completed"),
                    Js.undefined)
                in ()
              end)
            in

            for i = 1 to 12 do
              ExtUtils.setTimeout (f i) (i * 500);
            done;
          ),
          Js.undefined,
          Js.undefined)
      in

      let _ =
        Ext.instance##get(Js.string "mb7")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            let _ =
              (Ext_MessageBox.get_instance ())##show(Js.def {|
                msg = Js.string "Saving your data, please wait...";
                progressText = Js.string "Saving...";
                width = 300;
                wait = Js._true;
                waitConfig = {| interval = 200 |};
                icon = Js.string "ext-mb-download"; (* custom class in msg-box.html *)
                animateTarget = Js.string "mb7"
              |},
              Js.undefined,
              Js.undefined) in

            ExtUtils.setTimeout (fun () ->
              (* This simulates a long-running operation like a database save or
               * XHR call. *)
              (* In real code, this would be in a callback function. *)
              let _ =
                (Ext_MessageBox.get_instance ())##hide(
                  Js.undefined, Js.undefined, Js.undefined) in
              ext_example_msg
                [|Js.Unsafe.inject (Js.string "Done");
                  Js.Unsafe.inject (Js.string "Your fake data was saved!");
                |];
            ) 8000;
          ),
          Js.undefined,
          Js.undefined)
      in

      let _ =
        Ext.instance##get(Js.string "mb8")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            (Ext_MessageBox.get_instance ())##alert(
              Js.string "Status",
              Js.string "Changes saved successfully.",
              Js.def (Js.wrap_callback showResult),
              Js.undefined)),
          Js.undefined,
          Js.undefined)
      in

      (* Add these values dynamically so they aren't hard-coded in the html *)
      (Js.Unsafe.coerce Ext.instance##fly(Js.string "info", Js.undefined)##dom)##value <- (Ext_MessageBox.get_instance ())##_INFO;
      (Js.Unsafe.coerce Ext.instance##fly(Js.string "question", Js.undefined)##dom)##value <- (Ext_MessageBox.get_instance ())##_QUESTION;
      (Js.Unsafe.coerce Ext.instance##fly(Js.string "warning", Js.undefined)##dom)##value <- (Ext_MessageBox.get_instance ())##_WARNING;
      (Js.Unsafe.coerce Ext.instance##fly(Js.string "error", Js.undefined)##dom)##value <- (Ext_MessageBox.get_instance ())##_ERROR;

      let _ =
        Ext.instance##get(Js.string "mb9")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            (Ext_MessageBox.get_instance ())##show(Js.def {|
              title = Js.string "Icon Support";
              msg = Js.string "Here is a message with an icon!";
              buttons = (Ext_MessageBox.get_instance ())##_OK;
              animateTarget = Js.string "mb9";
              fn = Js.wrap_callback showResult;
              icon = (Js.Unsafe.coerce Ext.instance##get(Js.string "icons")##dom)##value;
            |},
            Js.undefined,
            Js.undefined)),
          Js.undefined,
          Js.undefined)
      in

      let _ =
        Ext.instance##get(Js.string "mb10")##on(Js.string "click",
          Js.wrap_callback (fun e ->
            (Ext_MessageBox.get_instance ())##show(Js.def {|
              title = Js.string "What, really?";
              msg = Js.string "Are you sure?";
              buttons = (Ext_MessageBox.get_instance ())##_YESNO;
              buttonText = {|
                  yes = Js.string "Definitely!";
                  no = Js.string "No chance!";
              |};
              fn = Js.wrap_callback showResult;
            |},
            Js.undefined,
            Js.undefined)),
          Js.undefined,
          Js.undefined)
      in ()
    ),
    ExtUtils.undef,
    ExtUtils.undef)

