#!/bin/bash

. ../../setup-deploy.sh

SITENAME=toolbars/menu
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/menus.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html menus.css list-items.gif menu-show.gif preview.png \
  menus.js $SITEROOT

# clean up
rm menus.js

