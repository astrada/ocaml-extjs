//Provides: caml_js_assoc_get const
function caml_js_assoc_get(o, k) { return o[k]; }
//Provides: caml_js_assoc_set
function caml_js_assoc_set(o, k, v) { o[k] = v; }
//Provides: caml_js_call_parent
function caml_js_call_parent(o, n) { o.superclass[n].apply(o, arguments); }
