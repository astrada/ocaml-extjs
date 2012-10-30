#!/bin/bash

. ../../setup-deploy.sh

SITENAME=layout/accordion
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/accordion.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html accordion.js $SITEROOT

# clean up
rm accordion.js

