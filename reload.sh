#!/bin/bash
#!/bin/bash
for index in $( eval echo {$1..$2} )
do
  bash -c "./_reload_error.sh $index"
  sleep 0.5
done
echo "Done"
