#!/bin/bash

. ../../setup-deploy.sh

SITENAME=layout/border
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/border.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html border.js $SITEROOT

# clean up
rm border.js

