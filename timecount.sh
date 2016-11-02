#!/bin/bash
start=$(date "+%s")
#do something
sleep 10
now=$(date "+%s")
time=$((now-start))
echo "time used:$time seconds"