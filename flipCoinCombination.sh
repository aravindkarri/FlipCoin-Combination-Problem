#!/bin/bash -x

echo "Welcome to FlipCoin Combination Problem"

read -p "Enter how many times have to flip the coin : " n

declare -A dict

h=1
t=0
tttCount=0
tthCount=0
thtCount=0
thhCount=0
httCount=0
hthCount=0
hhtCount=0
hhhCount=0

function getTripletCombination()
{
	triplet=$1
        case $triplet in
                $t$t$t)
                        echo "TTT"
                        ((tttCount++))
                        ;;
                $t$t$h)
                        echo "TTH"
                        ((tthCount++))
                        ;;
                $t$h$t)
                        echo "THT"
                        ((thtCount++))
                        ;;
                $t$h$h)
                        echo "THH"
                        ((thhCount++))
                        ;;
		$h$t$t)
			echo "HTT"
			((httCount++))
			;;
		$h$t$h)
			echo "HTH"
			((hthCount++))
			;;
		$h$h$t)
			echo "HHT"
			((hhtCount++))
			;;
		$h$h$h)
			echo "HHH"
			((hhhCount++))
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
	flipCoin3=$((RANDOM%2))
	triplet="$flipCoin1$flipCoin2$flipCoin3"
	getTripletCombination $triplet
	dict["$i"]="$( getTripletCombination $triplet )"

done

echo "Triplet combination in dictionary: " ${dict[@]}
hhhPercent="$( getPercentage $hhhCount )"
hthPercent="$( getPercentage $hthCount )"
hhtPercent="$( getPercentage $hhtCount )"
httPercent="$( getPercentage $httCount )"
tttPercent="$( getPercentage $tttCount )"
tthPercent="$( getPercentage $tthCount )"
thtPercent="$( getPercentage $thtCount )"
thhPercent="$( getPercentage $thhCount )"
echo "percentage of TTT: "$tttPercent
echo "percentage of TTH: "$tthPercent
echo "percentage of THT: "$thtPercent
echo "percentage of THH: "$thhPercent
echo "peuircentage of HTT: "$httPercent
echo "percentage of HTH: "$hthPercent
echo "percentage of HHT: "$hhtPercent
echo "percentage of HHH: "$hhhPercent
