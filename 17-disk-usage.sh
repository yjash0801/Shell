#!/bin/bash

DISK_USAGE=$(df -hT | grep -vE "tmp|File")
DISK_THRESHOLD=0
message=""

R="\e[31m"
N="\e[0m"

while IFS= read line
do
    usage=$(echo $line | awk '{print $6F}' | cut -d % -f1)
    diskname=$(echo $line | awk '{print $1F}')
    if [ $usage -ge $DISK_THRESHOLD ]
    then
        message+="High disk usage on $diskname | usage percent: $usage% <br>"
    fi
done <<< $DISK_USAGE

echo -e "Message: $message"
#echo "$message" | mail -s "High Disk Usage" jashwanthya6@gmail.com

sh mail.sh "DevOps Team" "High Disk Usage" "$message" "ALERT: High Disk Usage" "jashwanthya6@gmail.com"