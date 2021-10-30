#!/bin/bash -e

name="solr"

if systemctl is-active --quiet "docker.service"
then
	if [[ $(docker ps --filter "name=^/$name$" --format '{{.Names}}') == "$name" ]]
	then
		echo "stopping [$name] container..."
		docker stop solr > /dev/null
		docker rm solr > /dev/null
	fi
	echo "stoping docker..."
	sudo systemctl stop docker.socket
	sudo systemctl stop docker.service
	sudo systemctl stop containerd.service
else
	echo "docker is not running..."
fi
