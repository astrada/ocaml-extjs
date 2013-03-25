#!/bin/bash

. ../../setup-deploy.sh

SITENAME=grid/basic_array_grid
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/array_grid.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.grid.*//@require Ext.data.*//@require Ext.util.*//@require Ext.state.*" >> js/array_grid.js

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
rm extjs js/array_grid.js all-classes.js index-out.html
rmdir js

