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
    echo "${G}username${N}:$username | ${G}password${N}:$username | ${G}userid${N}:$userid | ${G}groupid${N}:$groupid | ${G}User_ID_Info${N}:$User_ID_Info | ${G}hdirectory${N}:$hdirectory | ${G}shell${N}:$shell"
done < $FILE