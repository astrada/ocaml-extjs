#!/bin/bash

. ../setup-deploy.sh

SITENAME=helloext
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/app.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html $SITEROOT
cp app.js $SITEROOT

# clean up
rm app.js

