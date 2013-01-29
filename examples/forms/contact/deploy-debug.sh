#!/bin/bash

. ../../setup-deploy.sh

SITENAME=forms/contact
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/contact_form.js" "examples/$SITENAME"
cd -

# deploy
create_dir "$SITEROOT"
link_extjs "$SITEROOT/extjs"
cp index.html contact_form.js $SITEROOT

# clean up
rm contact_form.js

