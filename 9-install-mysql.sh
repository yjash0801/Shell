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

if [ $? -ne 0 ]
then
    echo "MySQL installation failed"
else
    echo "MySQL installation sucess"
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "MySQL installation failed"
else
    echo "MySQL installation sucess"
fi