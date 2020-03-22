#!/bin/bash -x


noOfheads=0
noOftails=0
while [ $noOfheads -le 21 -a $noOftails -le 21 ]
do
r=$((RANDOM%2))
if [ $r -eq 1 ]
then
((noOfheads++))
else
((noOftails++))
fi
done
if [ $noOfheads -gt $noOftails ]
then
echo "heads win by $(($noOfheads-$noOftails))"
elif [ $noOfheads -lt $noOftails
then
echo "tails win by $(($noOftails-$noOfheads))"
else
echo "it's a tie"
fi
