#!/bin/bash

# Ninjstall -- Ninja Installation Script (v. 1.0) --
# by Alain Maubert (https://github.com/AlainMaubert)
# November 30th, 2019.
#
# Tested in Fedora and Debian.
#
# This is a script that asks a user what program to install.
# It will do it silently and will automatically answer
# yes for all questions.

# Functions

start(){
sleep 1;

# Ninjstall Main Menu

cat << _EOF_
++++++++++++++++++++++++++++++++++++++++++++++++++++
Ninjstall -- Ninja Installation Script (Version 1.0)
++++++++++++++++++++++++++++++++++++++++++++++++++++

Please select the distribution that your OS is currently using:
	1) Debian-based distribution
	2) Red Hat-based distribution
	0) Exit
_EOF_

read -n 1 -s select;

	case $select in
		1) Debian;;
		2) RedHat;;
		0) echo "You have chosen to exit. Good luck!";sleep 2;clear;exit;;
		*) echo "Not a valid option. Try again.";sleep 2;clear;start;;
	esac
}

# Functions

Debian(){
echo $'\n'"Please type the name of the program to install in Debian:"

read name

echo "Please wait while "$name" is getting installed."
 
dpkg -l | grep -qw "$name" || sudo apt install -yyq "$name"

echo $name" has been installed."
sleep 2;start;

}

RedHat(){

echo $'\n'"Please type the name of the program to install in Red Hat"

read name

echo "Please wait while "$name" is getting installed."

rpm -qa | grep -qw "$name" || sudo dnf install -yyq "$name"

echo $name" has been installed."
sleep 2;start;
}

ninHelp(){
cat << _EOF_
Ninjstall -- Ninja Installation Script (v. 1.0)
by Alain Maubert (https://github.com/AlainMaubert)

Tested in Fedora and Debian.

This is a script that asks a user what program to install.
It will do it silently and will automatically answer
yes for all questions.

OPTIONS
         --rhs
                 Will search for an existing program based on Red Hat

         --debs
		Will search for an existing program based on Debian
_EOF_
}

if [ "$1" == "--debs" ]; then
echo $'\n'"Please type the name of the program to search in Debian."

read -n 20 check

sudo apt search $check | less

fi

if [ "$1" == "--rhs" ]; then
echo $'\n'"Please type the name of the program to search in Red Hat."

read -n 20 check

sudo dnf search $check | less

fi


if [ "$1" == "--help" ]; then
clear;
sleep 1;
ninHelp;
sleep 4;
start;
fi

# Execution
clear;
start;
exit;
