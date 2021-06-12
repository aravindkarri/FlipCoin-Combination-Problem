#!/bin/bash -x

echo "Welcome to FlipCoin Combination Problem"

read -p "Enter how many times have to flip the coin : " n

declare -A dict

headCount=0
tailCount=0

for ((i=0;i<n;i++))
do
	randomCheck=$((RANDOM%2))
	if [ $randomCheck -eq 1 ]
	then
		((headCount++))
		dict[$i]="head"
	else
		((tailCount++))
		dict[$i]="tail"
	fi
done
headPercent=$(( ($headCount*100)/$n ))
tailPercent=$(( ($tailCount*100)/$n ))
echo "percentage of head: "$headPercent
echo "percentage of tail: "$tailPercent
echo ${dict[@]}
