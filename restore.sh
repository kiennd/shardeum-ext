
#!/bin/bash
#!/bin/bash
for index in $( eval echo {$1..$2} )
do
  echo "$(pwd)/backup/shardeum-node-$index.json"
  docker cp "$(pwd)/backup/shardeum-node-$index.json" "shardeum-node-$index":/node/cli/build/secrets.json

done
echo "Done"
