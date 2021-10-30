#!/bin/bash -e

# lets check that docker is running
if ! systemctl is-active --quiet "docker.service"
then
	echo "starting docker..."
	sudo systemctl start docker.service
fi

# enable only when you want to run from clean state.
docker\
	run\
	--detach=true\
	--name=solr\
	--network host\
	solr:latest

echo "Solar is running"
echo "see it at [http://localhost:8983]"
