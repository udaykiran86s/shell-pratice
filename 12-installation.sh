#!/bin/bash
 USEDID=$(id -u)

 if [ $USERID -NE 0 ]; then
    echo "ERROR: please run this script with root privelege"
fi

dnf install  mysql -y

if [ $? -ne 0]; then 
    echo " error:: installing mysql is failure"
else 
    echo " installing mysql is success"
fi