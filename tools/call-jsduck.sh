#!/bin/bash

. ../examples/setup-deploy.sh

jsduck $EXTJS \
  --verbose \
  --export=full \
  --output jsduck/ \
  --pretty-json

