#!/bin/bash -e

name="solr"

if ! systemctl is-active --quiet "docker.service"
then
	echo "starting docker..."
	sudo systemctl start docker.socket
	sudo systemctl start docker.service
	sudo systemctl start containerd.service
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
