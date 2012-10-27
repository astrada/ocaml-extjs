#!/bin/bash

. ../../setup-deploy.sh

SITENAME=window/window
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/window.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html window.js $SITEROOT

# clean up
rm window.js

