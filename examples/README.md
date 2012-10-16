Ext JS 4.x examples
===================

In this directory you can find some of the examples, ported from [Sencha
website](http://docs.sencha.com/ext-js/4-1/#!/example).

You can deploy them to you local web server root directory, following these
steps:

 * edit file `setup-deploy.sh` specifying the paths on your host
 * verify that the current user has write privileges on the path specified by
   `WWWROOT` variable
 * select an example to deploy (e.g. `helloext`)
 * run the script `deploy-debug.sh` in the selected example directory
 * use a web browser to open the URL of the deployed page (e.g.
   `http://localhost/helloext/`)
 * if you want to try the minified version run `deploy-prod.sh` (you will need
   Ext JS SDK tools)

Or you can try them online [here](http://astrada.github.com/ocaml-extjs/).

