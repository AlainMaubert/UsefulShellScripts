#!/bin/bash

# sshAgent -- sshAgent Script (v. 1.0) -- by Alain Maubert
#
# February 26, 2020.
#
# Tested in Manjaro.
# This program adds your SSH key to the ssh-agent. For more information, visit:
# https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-add>

# Quit app if there are errors.
# set -e

# Functions

open() {
cat << _EOF_
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
sshAgent 1.0
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++
_EOF_
eval "$(ssh-agent -s)";
ssh-add ~/.ssh/id_rsa;
bash -i
}


open

