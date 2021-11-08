#!/bin/bash -e
SOLR_HOME=$HOME/install/solr
$SOLR_HOME/bin/solr delete -c films
