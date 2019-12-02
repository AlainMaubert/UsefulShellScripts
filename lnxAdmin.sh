#!/bin/bash

# lnxAdmin -- Basic Linux Admin Script (Version 1.0)
# by Alain Maubert
# December 1st, 2019.

# This script offers a menu for the user with common commands,
# facilitating the tasks of Linux administrators.

# MIT License

start(){
sleep 1;

# lnxAdmin Main Menu

cat << _EOF_
++++++++++++++++++++++++++++++++++++++++++++++++++
lnxAdmin -- Basic Linux Admin Script (Version 1.0)
++++++++++++++++++++++++++++++++++++++++++++++++++

Main Menu: What task would you like to do?

Please type the number:

1) Kernel version your system is currently using
2) System's current IP address
3) Report file system disk space usage
4) Show the options to control the systemd system and service manager
5) Show the options to display the estimate file space usage of a directory's contents 
6) Check network connections and open ports
7) Display Linux processes
8) Display the manual page of a program
0) Exit

_EOF_

read -n 1 -s select;

	case $select in
		1) kernel;;
		2) ipAddress;;
		3) freeDiskSpace;;
		4) system;;
		5) spaceUsage;;
		6) networkStat;;
		7) topProcess;;
		8) manual;;
		0) echo "You have chosen to exit. Good luck!";sleep 2;clear;exit;;
		*) echo "Not a valid option. Try again.";sleep 2;clear;start;;

	esac
}

# Functions

kernel(){
clear;
echo "==============="
echo "Kernel release:"
uname -r;
echo "===============" 
echo
echo "==============="
echo "Kernel version:"
uname -v;
echo "==============="
echo
echo "================"
echo "All kernel info:"
uname -a;
echo "================"

sleep 2;
start;
}

ipAddress(){
clear;
echo "==================================="
echo "Interface short list configuration:"
ifconfig -s;
echo "==================================="$'\n'

echo "============================================"
echo "All interfaces that are currently available:"
ifconfig -a;
echo "============================================"
sleep 2;
start;
}

freeDiskSpace(){
clear;
echo "Amount of disk space available on the file system:"
echo "========="
df -h;
echo
echo "======================================================================================="
echo "Would you like to also include pseudo, duplicate, and inaccessible file systems? [y/N]:"
echo "======================================================================================="
read -n 1 -s choice
	if [ "$choice" == "y" ]; then
	clear;
	sleep 1;
	df -a | less;
	else
	echo "Good luck!";sleep 2;clear;start;
	fi
sleep 2;
start;
}

system(){
clear;
systemctl --help | less
sleep 1;start
}

spaceUsage(){
clear;
du --help | less
sleep 1;start
}

networkStat(){
clear;sleep 1;
netstat -tulpn
sleep 2;start;
}

topProcess(){
clear;sleep 1;
top
start;
}

manual(){
clear;sleep 1;
echo "======================================================="
echo "Please type the name of a program, utility or function:"
echo "======================================================="
read manu
man $manu
start;
}

# Execution
clear;
start
