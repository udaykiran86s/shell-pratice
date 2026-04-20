#!/bin/bash 

echo "all variables passwed to the script : $@"
echo "all varaiable passed to the script : $*"
echo " scriptname : $0"
echo "current directory  : $pwd"
echo "who is running this : $user"
echo " current user home directory : $home"
echo :"pid of the script :  $$"
sleep 10 &
echo " pid of the last command in background is $!"
