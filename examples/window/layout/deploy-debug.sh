#!/bin/bash

. ../../setup-deploy.sh

SITENAME=window/layout
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/layout.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html layout.js $SITEROOT

# clean up
rm layout.js

