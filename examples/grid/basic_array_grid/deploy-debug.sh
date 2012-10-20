#!/bin/bash

. ../../setup-deploy.sh

SITENAME=grid/basic_array_grid
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/array_grid.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html array_grid.js $SITEROOT

# clean up
rm array_grid.js

