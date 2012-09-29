class my_doc_gen () =
object
  inherit Odoc_html.html

  method html_of_Latex b s =
    Buffer.add_string b s

end

let my_generator = ((new my_doc_gen ()) :> Odoc_args.doc_generator)

let _ = Odoc_args.set_doc_generator (Some my_generator)

