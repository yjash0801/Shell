#!/bin/bash

APPLOG="/tmp/shell-logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d  $APPLOG ]
then
    echo -e "${R}The Directory doesn't exist.${N}"
fi

FILES_TO_DELETE=$(find $APPLOG -type f -name "*.log" -mtime +14)

while IFS= read -r line
do
    echo "Deleting file: $line"
    rm -rf $line
done <<< $FILES_TO_DELETE