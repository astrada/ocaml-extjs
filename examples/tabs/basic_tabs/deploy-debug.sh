#!/bin/bash

. ../../setup-deploy.sh

SITENAME=tabs/basic_tabs
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/tabs.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html ajax1.htm ajax2.htm tabs.css tabs.js $SITEROOT

# clean up
rm tabs.js

