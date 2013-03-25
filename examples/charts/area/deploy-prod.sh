#!/bin/bash

. ../../setup-deploy.sh

SITENAME=charts/area
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/area.js" "examples/$SITENAME/js/"
cd -

# append dependencies
echo "//@require Ext.container.Viewport//@require Ext.app.Application//@require Ext.chart.*//@require Ext.Window//@require Ext.fx.target.Sprite//@require Ext.layout.container.Fit//@require Ext.window.MessageBox//@require Ext.data.JsonStore" >> js/area.js

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
rm extjs js/area.js all-classes.js index-out.html
rmdir js

