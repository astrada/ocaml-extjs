#!/bin/bash

. ../setup-deploy.sh

SITENAME=account_manager
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp _build/examples/$SITENAME/app.js examples/$SITENAME
cp _build/examples/$SITENAME/app/controller/*.js examples/$SITENAME/app/controller
cp _build/examples/$SITENAME/app/view/user/*.js examples/$SITENAME/app/view/user
cp _build/examples/$SITENAME/app/store/*.js examples/$SITENAME/app/store
cp _build/examples/$SITENAME/app/model/*.js examples/$SITENAME/app/model
cd -

# minify
link_extjs extjs
$SENCHA create jsb -a index.html -p app.jsb3
$SENCHA build -p app.jsb3 -d .

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index-prod.html "$SITEROOT/index.html"
create_dir "$SITEROOT/data"
cp data/* "$SITEROOT/data"
cp app-all.js "$SITEROOT"

# clean up
rm extjs
rm app.js
rm app.jsb3
rm all-classes.js
rm app-all.js
rm app/controller/*.js
rm app/view/user/*.js
rm app/store/*.js
rm app/model/*.js

