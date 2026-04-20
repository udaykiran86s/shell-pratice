#!/bin/bash



number1=100
number2=200
name=devops

sum=$(($number1+$number2+$name))
echo "sum =$sum"

leaders=("modi" "tinku"  "uday")
echo "all leaders: ${leaders[@]}"
echo "first leaders: ${leaders[0]}"

