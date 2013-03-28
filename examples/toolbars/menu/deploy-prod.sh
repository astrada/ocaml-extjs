#!/bin/bash

. ../../setup-deploy.sh

SITENAME=toolbars/menu
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/menus.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.tip.QuickTipManager//@require Ext.menu.*//@require Ext.form.field.ComboBox//@require Ext.layout.container.Table//@require Ext.container.ButtonGroup" >> js/menus.js

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
cp menus.css list-items.gif menu-show.gif preview.png all-classes.js $SITEROOT

# clean up
rm extjs js/menus.js all-classes.js index-out.html
rmdir js

