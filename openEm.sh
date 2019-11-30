#!/bin/bash 

# OpenEm -- Open Them Script (v. 1.0) -- by Alain Maubert
# (https://github.com/AlainMaubert)
# November 30th, 2019.
#
# Tested in Fedora.
# This program opens the following useful apps:
# Signal, Discord, Firefox, Thunderbird, KeePassX,
# and SyncThing at once.

# Quit app if there are errors.
set -e

# Functions

open() {
cat << _EOF_
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
OpenEm 1.0 
Signal, Discord, Firefox, Thunderbird, KeePassx,
and Syncthing will be opened.
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
_EOF_
keepassx &
discord &
thunderbird &
firefox &
syncthing &
signal-desktop &
gnome-terminal
}

killApp(){
killall keepassx &
killall Discord &
killall Discord &
killall thunderbird &
killall firefox &
killall syncthing &
killall signal-desktop &
killall signal-desktop &
echo "++++++++++++++++"
echo "Closed them all!"
echo "++++++++++++++++"
exit
}

leave() {
echo "++++++++++++++++++"
echo "Commands finished."
echo "++++++++++++++++++"
exit 
}

ini-help() {
cat << _EOF_

This program opens KeePassX, Discord, Thunderbird, Firefox, 
SyncThing, and Signal. All at once.

Commands:
	ini        = Opens several apps at once.
	ini --help = Shows this help page.
	ini --off  = Kills all Apps.

Coded by Alain Maubert (MIT License)
_EOF_

}

# Execution

# App name
echo "OpenEm v. 1.0"

if [ "$1" == "--help" ]; then
ini-help
exit
fi

if [ "$1" == "--off" ]; then
killApp
exit
fi

if [ -n "$1" ]; then
cat << _EOF_
openEm error: Invalid input, please type 
openEm.sh --help for more information! >&2
_EOF_
exit 1
fi

open
leave
