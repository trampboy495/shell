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
HeadpercentageSinglet=$(($noOfheads*10))
noOfheads=0
noOftails=0
i=0
while [ $i -lt 10 ]
do
r=$((RANDOM%2))
r2=$((RANDOM%2))
if [ $r -eq 1 -a  $r2 -eq 1 ]
then
coinDoublet[$i]="HH"
noOfheads=$(($noOfheads+1))
elif [ $r -eq 0 -a  $r2 -eq 0 ]
then
coinDoublet[$i]="TT"
((noOftails++))
elif [ $r -eq 0 -a  $r2 -eq 1 ]
then
coinDoublet[$i]="TH"
else
coinDoublet[$i]="HT"
fi
((i++))
done
HeadpercentageDoublet=$(($noOfheads*10))

