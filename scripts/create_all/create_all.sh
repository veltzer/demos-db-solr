#!/bin/bash

CORE_NAME="my_core"
#SOLR_HOME="/home/mark/git/demos-solr/exercises/00_install_solr/solr-8.10.1"
SOLR_HOME="$HOME/install/solr"
# remove the corrent core
$SOLR_HOME/bin/solr delete -c "$CORE_NAME"
# create the core
$SOLR_HOME/bin/solr create -c "$CORE_NAME"
# lets add the fields
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field":{"name":"name","type":"text_en","stored":true,"indexed":true }}' "http://localhost:8983/solr/$CORE_NAME/schema"
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field":{"name":"year","type":"pint","stored":true,"indexed":true }}' "http://localhost:8983/solr/$CORE_NAME/schema"
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field":{"name":"description","type":"text_en","stored":true,"indexed":true }}' "http://localhost:8983/solr/$CORE_NAME/schema"
curl "http://localhost:8983/solr/$CORE_NAME/update?commit=true" --data-binary @films.csv -H "Content-Type: application/csv"
