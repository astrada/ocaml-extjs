#!/bin/bash

. ../setup-deploy.sh

SITENAME=helloext
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/app.js" "examples/$SITENAME"
cd -

# minify
link_extjs extjs
$SENCHA create jsb -a index.html -p app.jsb3
$SENCHA build -p app.jsb3 -d .

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index-prod.html "$SITEROOT/index.html"
cp app-all.js $SITEROOT

# clean up
rm extjs app.js app.jsb3 all-classes.js app-all.js

