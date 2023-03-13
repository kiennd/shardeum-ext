#!/bin/bash
if ! command -v screen &> /dev/null
then
    echo "screen is not installed. Installing..."
    sudo apt-get install screen
fi
current_time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${current_time}" > log
trap out SIGINT
function out(){
echo -e "\nActive Node: $(cat log | grep -c 'active')"
echo -e "Standby Node: $(cat log | grep -c 'standby')"
exit 1
}
docker ps --format '{{.Names}}' | grep '^shardeum-node' | while read docker_name; do
    screen -dmS "${docker_name}" bash -c " ./_status.sh ${docker_name} >> log"
    sleep 0.3
done
#sleep 5
#tail -f log
