#!/bin/bash

. ../../setup-deploy.sh

SITENAME=misc/panel
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/panel.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.panel.*" >> js/panel.js

# minify
link_extjs extjs
$SENCHA compile \
  -classpath=extjs/src,js \
  page \
  -compress \
  -in index-prod.html \
  -out index-out.html

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index-out.html "$SITEROOT/index.html"
cp all-classes.js $SITEROOT

# clean up
rm extjs js/panel.js all-classes.js index-out.html
rmdir js

