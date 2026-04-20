#!/bin/bash

USERID=(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"
if [ $USERID -ne 0 ];then
    echo "please run with root user"
    exit 1
fi
LOGS_FOLDER="/var/log/shel-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

echo "Script started executed at: $(date)"



VALIDATE() {
    if [ $1 -ne 0 ] ; then
    echo "installation $r failed $n need root permission"
    exit 1
else 
    echo "installing  is $g success $n"
}

dnf list installed mysql &>> $LOG_FILE
#install if it is not found
if [ $? -ne 0 ]; then
dnf install mysql -y
VALIDATE $? "mysql"
else 
echo "mysql already exist .. $y skiping $n"
fi

dnf list installed nginx  &>> $LOG_FILE #install if it is not found
if [ $? -ne 0 ]; then
dnf install nginx -y
VALIDATE $? "NGINX"
else 
echo " nginx already exist .. $y skiping $n"
fi


dnf list installed mongosh  &>> $LOG_FILE#install if it is not found
if [ $? -ne 0 ]; then
dnf install mongodb-mongosh -y
VALIDATE $? "mongosh"
else 
echo "mongosh already exist .. $y skiping $n"
fi


