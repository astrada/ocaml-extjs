#!/bin/bash

SITENAME=helloext
WWWROOT=/var/www
SITEROOT="$WWWROOT/$SITENAME"

set -e

# build
cd ../..
ocaml setup.ml -build
cp "_build/examples/$SITENAME/app.js" "examples/$SITENAME"
cd -

# deploy
cp index.html $SITEROOT
cp app.js $SITEROOT

# clean up
rm app.js

