OCaml Ext JS 4.x bindings
=========================

**ocaml-extjs** provides Ext JS 4.x bindings for js_of_ocaml.

### Requirements

You will need the following libraries:

* [OCaml][] >= 3.12.1
* [Findlib][] >= 1.2.7
* [js_of_ocaml][] latest development version, patched with a custom syntax
  extension
* [extjs][] >= 4.1.1a (GPL version)
* [extjs-sdk-tools][] >= 2.0.0beta3 (to minify and deploy examples, optional)
* [Batteries][] >= 2.0beta2 (to build the library generator, optional)
* [Yojson][] >= 1.0.2 (to build the library generator, optional)

This library was developed and tested on Ubuntu 12.04 LTS (64-bit).

[OCaml]: http://caml.inria.fr/ocaml/release.en.html
[Findlib]: http://projects.camlcity.org/projects/findlib.html/
[js_of_ocaml]: https://github.com/astrada/js_of_ocaml
[extjs]: http://www.sencha.com/products/extjs/
[extjs-sdk-tools]: http://www.sencha.com/products/sdk-tools/
[Batteries]: http://batteries.forge.ocamlcore.org/
[Yojson]: http://mjambon.com/yojson.html

### Configuration and installation

To build the library and the examples, run

    $ ocaml setup.ml -configure
    $ ocaml setup.ml -build

See `examples/README.md` for further details regarding the examples.

To install the library, run (as root, if your user doesn't have enough
privileges)

    $ ocaml setup.ml -install

To generate the documentation, run

    $ ocaml setup.ml -configure --enable-docs
    $ ocaml setup.ml -build
    $ ocaml setup.ml -doc

Then you can browse the HTML documentation starting from
`ocaml-extjs.docdir/index.html`, but is not installed by default.

To uninstall the library, execute

    $ ocaml setup.ml -uninstall

### Online examples

The examples are online [here](http://astrada.github.com/ocaml-extjs/).

