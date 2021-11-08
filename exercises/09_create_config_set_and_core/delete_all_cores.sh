#!/bin/bash -e
export SOLR_HOME="$HOME/install/solr"
curl -s 'http://localhost:8983/solr/admin/cores' | jq -r '.status[].name' | while read x
do
	echo "deleting core [$x]"
	$SOLR_HOME/bin/solr delete -c "$x"
done
