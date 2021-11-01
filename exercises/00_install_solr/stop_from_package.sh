#!/bin/bash -e

# wget https://www.apache.org/dyn/closer.lua/lucene/solr/8.10.1/solr-8.10.1.tgz -o solr.tgz
name="solr-8.10.1"
"$name/bin/solr" stop
