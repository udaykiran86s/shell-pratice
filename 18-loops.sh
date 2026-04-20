#!/bin/bash

USERID=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

LOGS_FOLDER="/var/log/shel-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

echo "Script started executed at: $(date)"  | tee -a $LOG_FILE

if [ $USERID -ne 0 ];then
   echo "please run with root user"
    exit 1
fi

VALIDATE() {
    if [ $1 -ne 0 ] ; then
    echo "installation $r failed $n need root permission"
    exit 1
else 
    echo "installing  is  -e $g success $n"
    fi
}

# $@
for package in $@
do 
    echo "package is : $package"
    #check package is already installed or not
    dnf list installed $package &>>$LOG_FILE

    #if  exit status is 0,already installed -ne 0 need install it
    if [ $? -ne 0 ];then 
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
    echo -e " $package  already installed ...$y"
    fi 
done