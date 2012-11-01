#!/bin/bash

. ../../setup-deploy.sh

SITENAME=misc/quicktips
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/qtips.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html ajax-tip.html house.jpg qtips.css qtips.js $SITEROOT

# clean up
rm qtips.js

