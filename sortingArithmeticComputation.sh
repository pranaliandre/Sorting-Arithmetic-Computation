#!/bin/bash -x
#initialising a dictionary
declare -A dictResult
echo "Welcome"
#Take three input from user
read -p "Enter the first number: " number1
read -p "Enter the second number: " number2
read -p "Enter the third number: " number3

#compute
result1=`echo "scale=2; $((number1+number2*number3))" | bc`
dictResult[1]=$result1 #storing result in dictionary 

#compute a*b+c
result2=`echo "scale=2; $((number1*number2+number3))" | bc`
dictResult[2]=$result2 #stroing result in dictionary

#compute c+a/b
result3=`echo "scale=2; $((number3+number1/number2))" | bc`
dictResult[3]=$result3 #stroing result in dicionary

#compute a%b+c
result4=`echo "scale=2; $((number1%number2+number3))" | bc`
dictResult[4]=$result4 #storing result in dictionary
#display all value with key
echo "${!dictResult[@]}" value="${dictResult[@]}"
