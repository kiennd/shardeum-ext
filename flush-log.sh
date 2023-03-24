#!/bin/bash
truncate -s 0 /var/lib/docker/containers/**/*-json.log
current_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${current_time}" > log
trap out SIGINT

docker ps --format '{{.Names}}' | grep '^shardeum-node' | while read docker_name; do
    docker exec $docker_name /bin/bash -c "pm2 flush"
    sleep 0.3
done
