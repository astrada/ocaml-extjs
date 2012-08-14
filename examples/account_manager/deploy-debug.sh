#!/bin/bash

. ../setup-deploy.sh

SITENAME=account_manager
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp examples/$SITENAME/index.html $SITEROOT
create_dir "$SITEROOT/data"
cp examples/$SITENAME/data/* "$SITEROOT/data"
cp _build/examples/$SITENAME/app.js "$SITEROOT"
create_dir "$SITEROOT/app/controller"
cp _build/examples/$SITENAME/app/controller/*.js "$SITEROOT/app/controller"
create_dir "$SITEROOT/app/view/user"
cp _build/examples/$SITENAME/app/view/user/*.js "$SITEROOT/app/view/user"
create_dir "$SITEROOT/app/store"
cp _build/examples/$SITENAME/app/store/*.js "$SITEROOT/app/store"
create_dir "$SITEROOT/app/model"
cp _build/examples/$SITENAME/app/model/*.js "$SITEROOT/app/model"

cd -

