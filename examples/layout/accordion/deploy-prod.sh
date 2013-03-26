#!/bin/bash

. ../../setup-deploy.sh

SITENAME=layout/accordion
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/accordion.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.data.*//@require Ext.grid.*//@require Ext.container.Viewport//@require Ext.layout.*" >> js/accordion.js

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
rm extjs js/accordion.js all-classes.js index-out.html
rmdir js

