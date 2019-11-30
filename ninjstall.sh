#!/bin/bash

# Ninjstall -- Ninja Installation Script (v. 1.0) --
# by Alain Maubert (https://github.com/AlainMaubert)
# November 30th, 2019.
#
# Tested in Fedora.
#
# This is a script that asks a user what program to install.
# It will do it silently and will automatically answer
# yes for all questions.


echo $'\n'"Please type the name of the program to install."

read -n 20 name

echo "Please wait while "$name" is getting installed."

rpm -qa | grep -qw "$name" || sudo dnf install -yyq "$name"

echo $name" has been installed."


exit
