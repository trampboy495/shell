#!/bin/bash -x





noOfheads=0
noOftails=0
i=0
declare -A coinSinglet coinDoublet coinTriplet
while [ $i -lt 10 ]
do
r=$((RANDOM%2))
if [ $r -eq 1 ]
then
coinSinglet[$i]="H"
((noOfheads++))
else
coinSinglet[$i]="T"
((noOftails++))
fi
((i++))
done
Headpercentage=$(($noOfheads*10))


