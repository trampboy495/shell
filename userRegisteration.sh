#!/bin/bash -x



read -p "enter user frist name: " fristname
regex1='^[A-Z][a-z]{2,}$'
[[ $fristname =~ $regex1 ]] && { echo "valid";} || { echo "invalid"; }
