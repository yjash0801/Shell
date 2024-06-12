#!/bin/bash

USERID=$(id -u)
DATE=$(date +%F:%H:%M:%S)
LOGFILE="/tmp/$0-$DATE.log"

R="\e[31m"
G="\e[32m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "installation $2 $R failed"
    else
        echo -e "installation $2 $G sucess"
    fi
}

if [ $USERID -ne 0 ]
then
    echo -e "$R root permission required $N, enter sudo su -"
    exit 1
else
    echo -e "$G script executed $N on super user(root)"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "MySQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "git"