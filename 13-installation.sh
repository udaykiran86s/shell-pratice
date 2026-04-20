#!/bin/bash

USERID=(id -u)

if [ $USERID -ne 0 ];then
    echo "please run with root user"
    exit 1
fi

VALIDATE(){
    f [ $1 -ne 0 ] ; then
    echo "installation failed need root permission"
    exit 1
else 
    echo "installing  is success"
}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nginx -y
VALIDATE $? "NGINX"

dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"
