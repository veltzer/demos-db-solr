#!/bin/sh
# this will start solr with no prompt and will automatically
# create the 'techproducts' collection
export SOLR_ULIMIT_CHECKS=false
cd ~/install/solr
bin/solr start -e techproducts
