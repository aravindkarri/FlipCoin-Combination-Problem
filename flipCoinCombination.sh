#!/bin/bash -x

echo "Welcome to FlipCoin Combination Problem"

randomCheck=$((RANDOM%2))
if [ $randomCheck -eq 1 ]
then
	echo "head"
else
	echo "tail"
fi
