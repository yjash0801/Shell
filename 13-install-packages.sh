#!/bin/bash

ID=$(id -u)
DATE=$(date +%F:%H:%M:%S)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE=/tmp/$0-$DATE.log

VALIDATE() {
    if [ $1 -ne 0 ]
    then
        echo -e "$N Installation $2 $R failed"
    else
        echo -e "$N Installation $2 $G sucess"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R Root permissions required,$N run script with root user."
    exit 1
else
    echo -e "$G Script executed with root user."
fi

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        echo -e "The package $package is not installed, preparing for installtion"
        echo "                                                                                   " &>> $LOGFILE
        echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< INSTALLING $package >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" &>> $LOGFILE
        echo "                                                                                   " &>> $LOGFILE
        dnf install $package -y &>> $LOGFILE
        VALIDATE $? "$package "
    else
        echo "                                                                                   " &>> $LOGFILE
        echo "<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< $package ALREADY INSTALLED >>>>>>>>>>>>>>>>>>>>>>>>>>>>>" &>> $LOGFILE
        echo "                                                                                   " &>> $LOGFILE
        echo -e "$Y Package $package is already installed,$N proceeding with next"
    fi
done