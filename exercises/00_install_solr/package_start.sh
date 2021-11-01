#!/bin/bash -e

# wget https://www.apache.org/dyn/closer.lua/lucene/solr/8.10.1/solr-8.10.1.tgz -o solr.tgz
ver="8.10.1"
name="solr-$ver"
filename="$name.tgz"
# rm -rf "$name" "$filename"
if [ ! -f "$filename" ]
then
	wget "https://dlcdn.apache.org/lucene/solr/$ver/$filename"
	tar xvf "$name.tgz"
fi
export SOLR_ULIMIT_CHECKS=false
"$name/bin/solr" start
