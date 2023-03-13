#!/bin/bash

SUB='Cannot GET'
STR=$(curl -s localhost:$((9001+$1)))
#echo $STR
#echo localhost:$((9001+$1))
if [[ "$STR" != *"$SUB"* ]]; then
  node="shardeum-node-"$1
  echo "reload "$node
  docker restart $node >> log-reload &
  sleep 3
fi
