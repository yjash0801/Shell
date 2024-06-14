#!/bin/bash

APPLOG=/tmp/shell-logs
DATE=$(date +%F:%H:%M:%S)
LOGDIR=/home/centos/Shell_Logs/
DELETED_LOGS=$LOGDIR/$(basename $0)-$DATE.log


#exec &> $LOGDIR

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -d  $APPLOG ]
then
    echo -e "${R}The Directory doesn't exist."
fi

FILES_TO_DELETE=$(find . -type f -name "*.log" -mtime +14)

while IFS= read -r lines
do
    echo "Deleting file: $line"
    #rm -rf $line &>> $DELETED_LOGS
done >>> $FILES_TO_DELETE