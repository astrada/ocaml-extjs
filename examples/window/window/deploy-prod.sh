#!/bin/bash

. ../../setup-deploy.sh

SITENAME=window/window
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/window.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.window.Window//@require Ext.tab.*//@require Ext.toolbar.Spacer//@require Ext.layout.container.Card//@require Ext.layout.container.Border" >> js/window.js

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
rm extjs js/window.js all-classes.js index-out.html
rmdir js

