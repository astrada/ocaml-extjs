#include <stdlib.h>
#include <stdio.h>
#define D(f) void f () { fprintf(stderr, "Unimplemented Javascript primitive %s!\n", #f); exit(1); }
D(caml_js_assoc_get)
D(caml_js_assoc_set)
D(caml_js_call_parent)

