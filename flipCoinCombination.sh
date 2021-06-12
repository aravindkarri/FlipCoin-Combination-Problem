#!/bin/bash -x

echo "Welcome to FlipCoin Combination Problem"

read -p "Enter how many times have to flip the coin : " n

declare -A dict

h=1
t=0
headCount=0
tailCount=0
headTailCount=0
tailHeadCount=0
headHeadCount=0
tailTailCount=0

function getDoubletCombination()
{
	doublet=$1
        case $doublet in
                $h$t)
                        echo "HT"
                        ((headTailCount++))
                        ;;
                $h$h)
                        echo "HH"
                        ((headHeadCount++))
                        ;;
                $t$h)
                        echo "TH"
                        ((tailHeadCount++))
                        ;;
                $t$t)
                        echo "TT"
                        ((tailTailCount++))
                        ;;
        esac

}

function getPercentage()
{
	echo $(( ($1*100)/$n ))
}

for ((i=0;i<n;i++))
do
	flipCoin1=$((RANDOM%2))
	flipCoin2=$((RANDOM%2))
	doublet="$flipCoin1$flipCoin2"
	getDoubletCombination $doublet
	dict["$i"]="$( getDoubletCombination $doublet )"

done
echo "Doublet combination in dictionary: " ${dict[@]}
headTailPercent="$( getPercentage $headTailCount )"
headHeadPercent="$( getPercentage $headHeadCount )"
tailHeadPercent="$( getPercentage $tailHeadCount )"
tailTailPercent="$( getPercentage $tailTailCount )"
echo "percentage of headTail: "$headTailPercent
echo "percentage of headHead: "$headHeadPercent
echo "percentage of tailHead: "$tailHeadPercent
echo "percentage of tailTail: "$tailTailPercent
