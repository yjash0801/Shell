#!/bin/bash

FILE=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f  $APPLOG ]
then
    echo -e "${R}The file doesn't exist.${N}"
fi

while IFS=":" read -r username password userid groupid User_ID_Info hdirectory shell
do
    echo "username:$username password:$username userid:$userid groupid:$groupid User_ID_Info:$User_ID_Info hdirectory:$hdirectory shell:$shell"
done < $FILE