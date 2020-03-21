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
Parttime=4
isPartTime=1
isFulltime=0
checkemp=$((RANDOM % 2))
case $checkemp in
 $isPartTime) empSalary=$(($Parttime*$Wageperhr))
             ;;
 $isFulltime) empSalary=$(($Fulltime*$Wageperhr))
             ;;
 *) empSalary=0
             ;;
esac
Workingdays=20
TotalSalary=$(($empSalary*$Workingdays))
totalemphr=0
totalworkingdays=0
functiongethour () {
case $1 in
 $isPartTime) emphrs=4
             ;;
 $isFulltime) emphrs=8
             ;;
 *) emphrs=0
             ;;
esac
echo $emphrs
}
while [ $totalemphr -lt 100 -a $totalworkingdays -lt 20 ]
do
((totalWorkingdays++))
emphrs="$( functiongethour $((RANDOM % 2)) )" 
totalemphr=$(($totalemphr + $emphrs))
done
TotalSalary=$(($totalemphr*$Wageperhr))  
empDaliywage[0]=$TotalSalary
echo "employee daily wage is ${empDailywage[@]}"
