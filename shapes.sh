#!/bin/bash
#FileName:shapes.sh
#Date:2022/7/27
#Student ID:041003345
#Author:Boyu Li
#Smester:2022 Spring
#Comments:
#The program can draw different graph based on user's needs
maxWidth=$(tput cols)
trianglePrint() {
for ((i=1; i<=$1; i++)) 
do
        for ((j=1; j<=i; j++))
            do 
            echo -n "$2"
            done
            echo ""
            done
}

squarePrint() {
    for ((i=1; i<=$1; i++))
    do
    for ((j=1; j<=$1; j++))
    do
    echo -n "$2"
    done
    echo ""
    done
}

linePrint() {
    for ((i=1; i<=$1; i++))
    do
    echo -n "$2"
    done
    echo ""
}
if [ "$2" -gt "$maxWidth" ];then
echo "The size of the graph exceeds the width of the terminal"
exit
else
if [ $# == 2 ];then
case $1 in
triangle|TRIANGLE)
trianglePrint "$2" "*"
;;
square|SQUARE)
squarePrint "$2" "*"
;;
line|LINE|1)
linePrint "$2" "*"
;;
*)
echo "Your input is incorrect"
exit
esac

elif [ $# == 3 ];then
case $1 in
triangle|TRIANGLE)
trianglePrint "$2" "$3"
;;
square|SQUARE)
squarePrint "$2" "$3"
;;
line|LINE|1)
linePrint "$2" "$3"
;;
*)
echo "Your input is incorrect"
exit
esac
else
echo "Your input is inccorect"
exit
fi
fi