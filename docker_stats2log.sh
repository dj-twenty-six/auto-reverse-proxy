#!/bin/bash

CONTAINER_NAME=$1

while true; do
	# https://docs.docker.com/engine/reference/commandline/stats/#format
	stats=$(sudo docker stats --no-stream --format "{{.Name}},{{.CPUPerc}},{{.MemUsage}},{{.MemPerc}},{{.NetIO}},{{.BlockIO}}" $CONTAINER_NAME)
	dt=$(date '+%Y-%m-%d %H:%M:%S')
	r="${dt},${stats}"
	echo $r
	sleep 1
done
