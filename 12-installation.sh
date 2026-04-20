#!/bin/bash
 USERID=$(id -u)

 if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this script with root privelege"
    exit 1
fi

dnf install  mysql -y

if [ $? -ne 0 ]; then 
    echo " error:: installing mysql is failure"
    exit 1
else 
    echo " installing mysql is success"
fi