#!/bin/bash

. ../setup-deploy.sh

SITENAME=helloext
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/app.js" "examples/$SITENAME"
cd -

# minify
link_extjs extjs
$SENCHA compile \
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
rm extjs app.js all-classes.js index-out.html

