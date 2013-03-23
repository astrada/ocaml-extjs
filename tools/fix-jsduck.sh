#!/bin/bash

set -e

sed -e "s/\"#f55'/\"#f55\\\\\"/" jsduck/Ext.chart.Highlight.json > jsduck/Ext.chart.Highlight.json.tmp
mv jsduck/Ext.chart.Highlight.json.tmp jsduck/Ext.chart.Highlight.json
sed -e "s/', and \\\\\"/', and \&quot;/" jsduck/Ext.util.Format.json > jsduck/Ext.util.Format.json.tmp
mv jsduck/Ext.util.Format.json.tmp jsduck/Ext.util.Format.json

