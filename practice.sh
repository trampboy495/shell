#!/bin/bash -x






read -p "postal code to validate: " p
regex3='^([^a-zA-Z\^\$\*\%]*400 +0)([^a-zA-Z\^\$\*\%]*[0-9]{2})$'
[[ $p =~ $regex3 ]] && { echo "valid"; } || { echo "invalid"; }

shopt -s extglob
read -p "enter email-id to validate: " email
regex4='^(\<abc\>)+([\+\-\.][0-9a-zA-Z]+)*(@bridgelabz\.co)+([\.][a-z]{2})*$'
[[ $email =~ $regex4 ]] && { echo "valid"; } || { echo "invalid"; }


