#!/bin/bash

SITENAME=account_manager
WWWROOT=/var/www
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build

# deploy
cp examples/$SITENAME/index.html $SITEROOT
cp _build/examples/$SITENAME/app.js $SITEROOT
cp _build/examples/$SITENAME/app/controller/*.js "$SITEROOT/app/controller"
cp _build/examples/$SITENAME/app/view/user/*.js "$SITEROOT/app/view/user"
cp _build/examples/$SITENAME/app/store/*.js "$SITEROOT/app/store"

cd -

