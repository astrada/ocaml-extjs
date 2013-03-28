#!/bin/bash

. ../../setup-deploy.sh

SITENAME=tabs/basic_tabs
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
create_dir js
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/tabs.js" "examples/$SITENAME/js"
cd -

# append dependencies
echo "//@require Ext.tab.*" >> js/tabs.js

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
cp ajax1.htm ajax2.htm tabs.css all-classes.js $SITEROOT

# clean up
rm extjs js/tabs.js all-classes.js index-out.html
rmdir js

