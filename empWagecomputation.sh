#!/bin/bash -x


echo "Welcome to Employmee wage calculation program"
isPresent=1
randomcheck=$((RANDOM % 2))
if [ $isPresent -eq $randomcheck ]
then
echo "Employee is present"
else
echo "Employee is not present"
fi
Fulltime=8
Wageperhr=20
dailyWage=$(($Fulltime*$Wageperhr))
echo $dailyWage 
