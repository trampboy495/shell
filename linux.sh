#!/bin/bash -x



#2.


for file in `ls *.txt`
do
foldername=`echo $file | awk -F. '{print $1}'`
mkdir $foldername
mv $file $foldername
done

#3.

for file in `ls *.log.1`
do
foldername=`echo $file | awk -F. '{print $1}'`
d=`date "+%d%m%Y"`
format=`echo $file | awk -F.  '{print $2"."$3}'`
foldername=`echo $foldername-$d.$format`
mv $file $foldername
done

#4.

mv `find /var/log -mtime +7 -type f` Archive


#5.

echo "file name to search"
read file
if [ !-d"$file" ]
then 
touch $file
fi

#6.


awk '/systemd/ {print $0}' /var/log/dpkg.log | sort | uniq -c | sort -gr


#7.

ps -eo pid,ppid,cmd,%mem,%cpu


#8.


awk 'NR==1{print $2,$7}' data.csv
awk '$4 > 10000 {printf "%-20s %-40s\n",$2,$7}' data.csv        #prints only that employee's name and his total pay whose base pay is greater than 10000


awk ' /CAPTAIN/ {print $0} {sum+=$7} END{printf "aggregate pay of captain total pay is %s\n", sum} ' data.csv


awk ' $5 > 7000 && $5<10000 {printf "%-20s %-40s\n",$3,$5}' data.csv



awk 'NR > 1 {sum+=$4} END{printf "the avearge base pay is %s\n", sum/(NR - 1)} ' data.csv


#9.


mkdir original updated
cp original-file.sh original
cp updated-file.sh updated
diff original updated
mkdir original-backup
cp -r original original-backup
diff updated original-backup
