#!/bin/bash -e
SOLR_HOME="$HOME/install/solr"
(cd $SOLR_HOME/server/solr/configsets/sample_techproducts_configs/conf && zip -qr - *) > myconfigset.zip
if ! curl -s -X DELETE "http://localhost:8983/api/cluster/configs/myConfigSet?omitHeader=true" > /dev/null
then
	echo "did not delete previous copy"
fi
curl -s -X POST --header "Content-Type:application/octet-stream" --data-binary @myconfigset.zip "http://localhost:8983/solr/admin/configs?action=UPLOAD&name=myConfigSet"
curl -s -X POST -H 'Content-type: application/json' -d '{
	"create": {
		"name": "myConfigSetCopy",
		"baseConfigSet": "myConfigSet"
	}
}' 'http://localhost:8983/api/cluster/configs?omitHeader=true'
