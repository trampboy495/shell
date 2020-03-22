#!/bin/bash -x

i=0
noOfheads=0
noOftails=0
while [ $i -lt 4 ]
do
r=$((RANDOM%2))
if [ $r -eq 1 ]
then
((noOfheads++))
else
((noOftails++))
fi
((i++))
done
echo "no of heads $noOfheads"
echo "no of tails $noOftails"
