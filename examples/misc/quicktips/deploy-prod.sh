#!/bin/bash

. ../../setup-deploy.sh

SITENAME=misc/quicktips
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/qtips.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.tip.*//@require Ext.button.Button//@require Ext.window.MessageBox" >> js/qtips.js

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
cp ajax-tip.html house.jpg qtips.css all-classes.js $SITEROOT

# clean up
rm extjs js/qtips.js all-classes.js index-out.html
rmdir js

