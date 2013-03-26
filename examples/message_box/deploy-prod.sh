#!/bin/bash

. ../setup-deploy.sh

SITENAME=message_box
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/msg_box.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.window.MessageBox//@require Ext.tip.*" >> js/msg_box.js

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
create_dir "$SITEROOT/images"
cp images/* "$SITEROOT/images"
cp all-classes.js $SITEROOT

# clean up
rm extjs js/msg_box.js all-classes.js index-out.html
rmdir js

