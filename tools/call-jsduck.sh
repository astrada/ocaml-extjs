#!/bin/bash

. ../examples/setup-deploy.sh

jsduck $EXTJS/src \
  --verbose \
  --export=full \
  --output jsduck/ \
  --pretty-json

