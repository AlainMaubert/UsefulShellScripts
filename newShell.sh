#!/bin/bash

# NewShell -- New Shell Script (v. 1.0) -- by Alain Maubert
# (https://github.com/AlainMaubert)
# November 30th, 2019.
#
# Tested in Fedora.
#
# A script that creates a new file that has already the shebang line
# and chmod 777 enabled to be executable. If the file already exists,
# it will not overwrite the previous one. It also will open
# GNU nano to be ready for editing.
cat << _EOF_

This script will help you to create a new script faster. Please
type the name of the new file with a maximum of 10 characters.

_EOF_
read -n 10 file

# Check if the file already exists.

if [ -e $file.sh ]; then
	i=0
	while [ -e $file-$i.sh ]; do
	let i++
	done
	file=$file-$i
fi

# Create the new script and make it executable.

touch "$file".sh
chmod 777 $file.sh

# Add the shebang to the new script.

echo "#!/bin/bash"$'\n'\
# This script is for...\
> ./$file.sh
echo "Opening "$file".sh for editting."
sleep 3

# Opens GNU nano for editing.

nano $file.sh
exit
