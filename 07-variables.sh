#!/bin/bash

#DATE=$(date)
start_time=$(date +%s)

sleep 10 &
end_time=$(date +%s)
total_time=$($end_time-$start_time)
echo " script executed in $total _time in seconds"