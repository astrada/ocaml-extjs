//Provides: caml_js_call_parent
function caml_js_call_parent(o, n) { o.superclass[n].apply(o, arguments); }
