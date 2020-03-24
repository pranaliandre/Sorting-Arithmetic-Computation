#!/bin/bash -x 
initialising a dictionary
declare -A dictResult

#initialising an array
declare -A arrayResult

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

#strore in array

for key in ${!dictResult[@]}
do
	arrayResult[$key]=${dictResult[$key]}
done		
echo "${arrayResult[@]}" 

#function of sorted in descending order
function sortDes() {
	local tempArray=("$@")
	for (( i=1;i<=${#tempArray[@]};i++ ))
	do
		for (( j=$((i+1));j<=${#tempArray[@]};j++ ))
		do
			if [[ ${tempArray[$i]} -lt ${tempArray[$j]} ]]
			then
				temp=${tempArray[$i]}
				tempArray[$i]=${tempArray[$j]}
				tempArray[$j]=$temp
			fi
		done
	done
	echo "sorted in descending order ${tempArray[@]}"
}
sortDes ${arrayResult[@]}

#main function of sorted in ascending order
function sortAsc(){
	for (( i=1;i<=${#arrayResult[@]};i++ ))
	do
		for (( j=$((i+1));j<=${#arrayResult[@]};j++ ))
		do
			if [[ ${arrayResult[$i]} -gt ${arrayResult[$j]} ]]
			then
				temp=${arrayResult[$i]}
				arrayResult[$i]=${arrayResult[$j]}
				arrayResult[$j]=$temp
			fi
		done
	done
	echo "sorted in asending order ${arrayResult[@]}"
}
sortAsc ${arrayResult[@]}
