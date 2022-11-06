#!/bin/bash
#FileName:admin.sh
#Date:2022/8/06
#Student ID:041003345
#Author:Boyu Li
#Smester:2022 Spring
#Comments:
#The program implements an user management system
menuPrint(){ 
    echo $(bash shapes.sh line 56 "#")
    echo ""
    echo "  Hello $( whoami )"
    echo "  Welcome to the System Administration menu"
    echo ""
    echo $(bash shapes.sh line 56 "#")
    echo "  Note that there are administrative functions that will"
    echo "  ask for an administrator password."
    echo $(bash shapes.sh line 56 "#")
    echo ""
    echo "Enter your choice:"
    echo "(P)rint out a list of users"
    echo "(L)ist the user groups"
    echo "(A)dd a new user"
    echo "(C)reate a welcome file for a user"
    echo "(Q)uit the menu "
}


userPrint(){
   echo $(bash shapes.sh line 56 "#")
   echo ""
   echo "Actual Users of the System"
   awk -F: '$3 >= 1000 && $3 <= 60000{ print $1":",$5 }' /etc/passwd | cut -d ',' -f 1
   echo ""
   echo $(bash shapes.sh line 56 "#")
   echo ""
   echo "Press enter to continue"
}

groupPrint(){
    echo $(bash shapes.sh line 56 "#")
    echo ""
    echo "User Groups of the system"
    echo "An * indicates the group is not a personal group"
    echo ""
    awk -F: '$3 >= 1000 && $3 <= 60000{ print $1," group" }' /etc/group
    echo ""
    echo $(bash shapes.sh line 56 "#")
    echo ""
    echo "Press enter to continue"
}

userAdd(){
    echo $(bash shapes.sh line 56 "#")
    echo ""
    read -p "Enter a login name for the user to be added: " userName
    sudo adduser $userName
    if [[ $? -eq 0 ]];then
        echo ""
        echo "$userName is created"
        else
        echo""
        echo "$userName is faliure to create"
        fi
    echo ""
    echo $(bash shapes.sh line 56 "#")
    echo ""
    echo "Press enter to continue"
}

createFile(){
    read -p "Enter a login name for the user: " myUser
    if id -u $myUser >/dev/null 2>&1; then
        cd /home/$myUser
        sudo touch welcome_readme.txt
        sudo chmod 777 welcome_readme.txt
        echo "welcome to the system $myUser." > welcome_readme.txt
        echo "The file was successfully created"
        echo "Press enter to continue"
        cd /home/boyu2/lab08
    else
        echo "user does not exist"
    fi
}

while [[ 1 == 1 ]]
do
menuPrint
read choice
clear
case $choice in
p | P)
userPrint
read enter1
clear
;;
l | L)
groupPrint
read enter2
clear
;;
a | A)
userAdd
read enter3
clear
;;
C | c)
createFile
read enter4
clear
;;
Q | q)
echo "Thanks for your using! The program will exit now."
exit
;;
* )
echo "Your input is incorrect!"
;;
esac
done
