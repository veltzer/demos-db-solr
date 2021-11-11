#!/bin/bash -ex
SOLR_HOME=$HOME/install/solr
$SOLR_HOME/bin/solr create -c films
# $SOLR_HOME/bin/solr config -c films -action set-user-property -property update.autoCreateFields -value false
curl http://localhost:8983/solr/films/schema -X POST -H 'Content-type:application/json' --data-binary '{
    "add-field" : {
        "name":"name",
        "type":"text_general",
        "multiValued":false,
        "stored":true
    },
    "add-field" : {
        "name":"initial_release_date",
        "type":"pdate",
        "stored":true
    }
}'
$SOLR_HOME/bin/post -c films films.xml
