#!/bin/bash -x




declare -a B=(e e e e e e e e e) mov=()
declare -i depth bestmove best isMax
declare  h c
setBoard () {
for i in "${!B[@]}" ; do
B[$i]="e"
done
}
initialise () {
echo -e "\t\t simulating flip coin to decide who will play first \n"
[[ "RANDOM%2"  -eq 0 ]] && { echo "computer won the toss"; c=X h=O; isMax=0; return; }  || read -p "You won \
choose your mark X or O " h
[[ "$h" == "X" ]] && c="O" || c="X"
isMax=1
}
showBoard () {
for i in "${!B[@]}"; do
[[ "$i" -eq 2  ||  "$i" -eq 5 ]]  && { echo -e "${B[$i]} \n__________"; continue; } || [[ $i -eq 8 ]] && echo "\
${B[$i]}" || echo -n "${B[$i]} | "
done
}
evaluate () {
local ME=$1; local -i p=$2
[[ ${B[p/3*3]} = $ME  &&  ${B[p/3*3+1]} = $ME  &&  ${B[p/3*3+2]} = $ME ]] && { [[ $ME = $c ]] &&  { echo -10; return; }  ||  { echo 10; return; } }
[[ ${B[p]} = $ME && ${B[(p+3)%9]} = $ME && ${B[(p+6)%9]} = $ME ]] && { [[ $ME = $c ]] && { echo -10; return; } || { echo 10; return; } }
[[ ${B[4]} != $ME ]] && { echo 0; return; }
[[ p%4 -eq 0 && ${B[0]} = $ME && ${B[8]} = $ME ]] && { [[ $ME = $c ]] && { echo -10; return; } || { echo 10; return; } }
[[ p%4 -eq 2 || p -eq 4 ]] && [[ ${B[2]} = $ME && ${B[6]} = $ME ]] && { [[ $ME = $c ]] && { echo -10; return; } || { echo 10; return; } }
echo 0
}
getAllmoves () {
mov=()
for i in "${!B[@]}"; do
[[ ${B[i]} != "e" ]] && continue
mov[${#mov[@]}]="$i"
done
}
minimax () {
local ME=$1 OP=$2
ret=$(evaluate $OP $i)
[[ $ret -ne 0 ]] && { echo $ret; return; }
getAllmoves
[[ "${#mov[@]}" -eq 0 ]] && return 0
[[ $depth -gt 3 ]] && { echo $ret; return; }
if [ "$3" -eq 0 ]; then
best=1000
for i in "${mov[@]}"; do
B[i]=$c ; (( depth++ ))
ret=$(minimax $h $c $(( ! max )) ) 
[[ $ret -lt $best ]] && { best=$ret; bestmove=$i; }
B[i]="e"
done
echo $best ; return
else
best=-1000
for i in "${mov[@]}"; do
B[i]=$h ; (( depth++ ))
ret=$(minimax $c $h $(( ! max )) ) 
[[ $ret -gt $best ]] && { best=$ret; } 
B[i]="e"
done
echo $best ; return
fi
}
playTictactoe () {
initialise
getAllmoves
while [ "${#mov[@]}" -ne 0 ]; do
if [ $isMax -eq 0 ]; then
best=1000; bestmove=0; depth=0
local -i p
minimax $c $h $isMax  
B[bestmove]=$c
isMax=1
else
showBoard; read -p "choose cell you wish to mark:  " r
B[r]=$h
isMax=0
fi
getAllmoves
done
}
playTictactoe

