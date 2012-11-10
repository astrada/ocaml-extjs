#!/bin/bash

. ../../setup-deploy.sh

SITENAME=misc/panel
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/panel.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html panel.css panel.js $SITEROOT

# clean up
rm panel.js

