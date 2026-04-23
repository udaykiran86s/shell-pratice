#!/bin/bash
Count =5
Echo “starting countdown…”
While [ $count -gt 0 ]
do
	echo “TIME LEFT : $count”
sleep 1 #pause for 1 second
count =$((count -1))
done
echo “time up!”
