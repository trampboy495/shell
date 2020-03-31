#!/bin/bash -x



read -p "enter user frist name: " fristname
regex1='^[A-Z][a-z]{2,}$'
[[ $fristname =~ $regex1 ]] && { echo "valid";} || { echo "invalid"; }

read -p "enter user last name: " lastname
regex1='^[A-Z][a-z]{2,}$'
[[ $lastname =~ $regex1 ]] && { echo "valid";} || { echo "invalid"; }

read -p "enter user email: " email
regex1='^(\<abc\>)+([\+\-\.][0-9a-zA-Z]+)*(@bl\.co)+([\.][a-z]{2})*$'
[[ $email =~ $regex1 ]] && { echo "valid";} || { echo "invalid"; }



