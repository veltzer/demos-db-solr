#!/bin/bash -e
SOLR_HOME="$HOME/install/solr"
if curl -s -X DELETE "http://localhost:8983/api/cluster/configs/myConfigSet?omitHeader=true" > /dev/null
then
	echo "deleted myConfigSet"
else
	echo "did not delete myConfigSet"
fi
if ! curl -s -X DELETE "http://localhost:8983/api/cluster/configs/myConfigSetCopy?omitHeader=true" > /dev/null
then
	echo "deleted myConfigSetCopy"
else
	echo "did not delete myConfigSetCopy"
fi
# list all configsets
curl -s "http://localhost:8983/api/cluster/configs?omitHeader=true"

(cd $SOLR_HOME/server/solr/configsets/sample_techproducts_configs/conf && zip -qr - *) > myconfigset.zip

curl -s -X POST --header "Content-Type:application/octet-stream" --data-binary @myconfigset.zip "http://localhost:8983/solr/admin/configs?action=UPLOAD&name=myConfigSet"
curl -s -X POST -H 'Content-type: application/json' -d '{
	"create": {
		"name": "myConfigSetCopy",
		"baseConfigSet": "myConfigSet"
	}
}' 'http://localhost:8983/api/cluster/configs?omitHeader=true'

# list all configsets
curl -s "http://localhost:8983/api/cluster/configs?omitHeader=true"

curl -s -X DELETE "http://localhost:8983/api/cluster/configs/myConfigSetCopy?omitHeader=true" > /dev/null

# list all configsets
curl -s "http://localhost:8983/api/cluster/configs?omitHeader=true"

# create a collection based on our configset
$SOLR_HOME/bin/solr create_collection -c bar -d myconfigset
