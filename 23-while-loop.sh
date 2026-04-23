#!/bin/bash
count =5
Echo “starting countdown…”
while [ $count -gt 0 ]
do
	echo “TIME LEFT : $count”
sleep 1 #pause for 1 second
count =$((count -1))
done
echo “time up!”
