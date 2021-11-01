#!/bin/bash -e

name="solr"

if ! systemctl is-active --quiet "docker.service"
then
	echo "starting docker..."
	sudo systemctl start docker.socket
	sudo systemctl start docker.service
	sudo systemctl start containerd.service
fi

# stop a previous container, if it exists
if [[ $(docker ps --filter "name=^/$name$" --format '{{.Names}}') == "$name" ]]
then
	echo "stopping [$name] container..."
	docker stop solr > /dev/null
	docker rm solr > /dev/null
fi
echo "starting [$name] container..."
SOLR_CONTAINER_ID=$(
	docker\
	run\
	--detach=true\
	--name=$name\
	--network host\
	solr:latest\
)

echo "solr is running as container [$SOLR_CONTAINER_ID]"
echo "see it at [http://localhost:8983]"
