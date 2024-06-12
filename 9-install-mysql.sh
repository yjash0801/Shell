#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "root permission required, enter sudo su -"
    exit 1
else
    echo "script executed on super user(root)"
fi

yum install mysql -y

if [ $? -eq 0 ]
then
    echo "MySQL installation sucess"
else
    echo "MySQL installation failed"
fi



