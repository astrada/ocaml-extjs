#!/bin/bash

. ../../setup-deploy.sh

SITENAME=drawing/sencha
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/Sencha.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html Sencha.js $SITEROOT

# clean up
rm Sencha.js

