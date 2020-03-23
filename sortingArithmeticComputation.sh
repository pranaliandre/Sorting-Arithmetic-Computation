#!/bin/bash -x
echo "Welcome"
#Take three input from user
read -p "Enter the first number: " number1
read -p "Enter the second number: " number2
read -p "Enter the third number: " number3

#compute
result1=`echo "scale=2; $((number1+number2*number3))" | bc`

#compute a*b+c
result2=`echo "scale=2; $((number1*number2+number3))" | bc`

#compute c+a/b
result3=`echo "scale=2; $((number3+number1/number2))" | bc`
