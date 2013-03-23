#!/bin/bash

. ../setup-deploy.sh

SITENAME=account_manager
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp _build/examples/$SITENAME/app.js examples/$SITENAME/app
cp _build/examples/$SITENAME/app/controller/*.js examples/$SITENAME/app/controller
cp _build/examples/$SITENAME/app/view/user/*.js examples/$SITENAME/app/view/user
cp _build/examples/$SITENAME/app/store/*.js examples/$SITENAME/app/store
cp _build/examples/$SITENAME/app/model/*.js examples/$SITENAME/app/model
cd -

# append dependencies
echo "//@require AM.controller.Users" >> app/app.js
echo "//@define AM.controller.Users//@require AM.view.user.List//@require AM.view.user.Edit" >> app/controller/Users.js
echo "//@define AM.view.user.Edit" >> app/view/user/Edit.js
echo "//@define AM.view.user.List//@require AM.store.Users" >> app/view/user/List.js
echo "//@define AM.store.Users//@require AM.model.User" >> app/store/Users.js
echo "//@define AM.model.User" >> app/model/User.js

# minify
link_extjs extjs
$SENCHA compile \
  -classpath=app \
  page \
  -compress \
  -in index-prod.html \
  -out index-out.html

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index-out.html "$SITEROOT/index.html"
create_dir "$SITEROOT/data"
cp data/* "$SITEROOT/data"
cp all-classes.js "$SITEROOT"

# clean up
rm extjs app/app.js all-classes.js index-out.html \
  app/controller/*.js app/view/user/*.js app/store/*.js app/model/*.js

