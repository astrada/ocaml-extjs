#!/bin/bash

. ../../setup-deploy.sh

SITENAME=misc/templates
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/templates.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html templates.js $SITEROOT

# clean up
rm templates.js

