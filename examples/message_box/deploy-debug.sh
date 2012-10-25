#!/bin/bash

. ../setup-deploy.sh

SITENAME=message_box
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/msg_box.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html msg_box.js $SITEROOT

# clean up
rm msg_box.js

