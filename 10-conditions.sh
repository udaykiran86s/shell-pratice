#!/bin/bash

NUMBER=$1
if [ $NUMBER -lt 10 ];then
 echo "given number $NUMBER  is lestthan 10"
elif [ $NUMBER -eq 10 ];  then 
 echo " given number  $NUMBER is equal to 10"
else 
echo "given number $NUMBER is greater then 10"
fi



#-gt
#-lt
#-ne

# NUMBER=$2
# if [($NUMBER%2) -eq  0 ];  then
#     echo "given number $NUMBER is divisible by 2"

# else 
#         echo "given number $NUMBER is  not divisible by 2"
#     fi
