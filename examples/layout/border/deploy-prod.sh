#!/bin/bash

. ../../setup-deploy.sh

SITENAME=layout/border
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/border.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.window.Window//@require Ext.container.Viewport//@require Ext.layout.*//@require Ext.toolbar.*" >> js/border.js

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
rm extjs js/border.js all-classes.js index-out.html
rmdir js

