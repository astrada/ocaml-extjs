#!/bin/bash

SENCHA=sencha
WWWROOT=/var/www
SITENAME=account_manager
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/app.js" "examples/$SITENAME"
cd -

# minify
$SENCHA create jsb -a index.html -p app.jsb3
$SENCHA build -p app.jsb3 -d .

cp index-prod.html $SITEROOT/index.html
cp app-all.js $SITEROOT

# clean up
rm app.js
rm app.jsb3
rm all-classes.js
rm app-all.js

