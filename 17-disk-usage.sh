#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE "tmp|File" | awk '{print $6F}' | cut -d % -f1)
DISK_THRESHOL=1
message=""

R="\e[31m"
N="\e[0m"

while IFS= read line
do
    diskname=$(df -hT | grep -vE "tmp|File"| awk '{print $1F}')
    if [ $line -gt 0 ]
    then
        message+="${R}High disk usage on${N}$diskname: usage percent: ${R}$line%${N}\n"
    fi
done <<< $DISK_USAGE

echo -e "Message: $message"