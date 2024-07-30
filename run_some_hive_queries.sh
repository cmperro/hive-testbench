#!/bin/bash

database="tpcds_1000_orc"


#Run a random query
query_num=$((1 + $RANDOM % 100))
echo "Running Query" $query_num
beeline --hivevar DB=${database} -f sample-queries-tpcds/query$query_num.sql



#Wait a random amount of time
sleep_time=$((1 + $RANDOM % 60))
echo "Sleeping for " $sleep_time " seconds"
sleep $sleep_time       