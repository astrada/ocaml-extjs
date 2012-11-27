#!/bin/bash

. ../../setup-deploy.sh

SITENAME=dd/grid_to_grid
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/dnd_grid_to_grid.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html dnd_grid_to_grid.js $SITEROOT

# clean up
rm dnd_grid_to_grid.js

