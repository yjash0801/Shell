#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "installation $2 failed"
    else
        echo "installation $2 sucess"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "root permission required, enter sudo su -"
    exit 1
else
    echo "script executed on super user(root)"
fi

yum install mysql -y

VALIDATE $? "MySQL"

yum install git -y

VALIDATE $? "git"