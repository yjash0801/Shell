#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE "tmp|File")
DISK_THRESHOLD=1
message=""

R="\e[31m"
N="\e[0m"

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    diskname=$(echo $line | awk '{print $1F}')
    if [ $usage -gt $DISK_THRESHOLD ]
    then
        message+="${R}High disk usage on${N} $diskname usage percent: ${R}$usage%${N}\n"
    fi
done <<< $DISK_USAGE

echo -e "Message: $message"