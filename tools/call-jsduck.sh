#!/bin/bash

set -e

EXTJS=/usr/local/src/extjs-4.1.1/src

jsduck $EXTJS \
  --verbose \
  --export=full \
  --output jsduck/ \
  --pretty-json

