#!/bin/bash

#database="tpcds_1000_orc"
database=${1}
exec_env=${2}
cdw_endpoint=${3}
user=${4}
password=${5}


#Run a random query
query_num=$((1 + $RANDOM % 100))

if [ $exec_env == "datahub" ]
then
    echo "Running Query" $query_num
    beeline --hivevar DB=${database} -f sample-queries-tpcds/query$query_num.sql
else
    echo "Running Query" $query_num
    #CDW
    beeline --hivevar DB=${database} -f sample-queries-tpcds/query$query_num.sql -u $cdw_endpoint -n $user -p $password
fi



#Wait a random amount of time
sleep_time=$((1 + $RANDOM % 60))
echo "Sleeping for " $sleep_time " seconds"
sleep $sleep_time