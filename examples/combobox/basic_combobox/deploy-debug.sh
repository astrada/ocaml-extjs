#!/bin/bash

. ../../setup-deploy.sh

SITENAME=combobox/basic_combobox
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/combos.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html combos.js $SITEROOT

# clean up
rm combos.js

