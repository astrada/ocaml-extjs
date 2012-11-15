#!/bin/bash

. ../../setup-deploy.sh

SITENAME=charts/area
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/area.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html area.js $SITEROOT

# clean up
rm area.js

