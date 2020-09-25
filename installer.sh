#!/bin/bash

for file in setpass start-server
	chmod u+x ${file}.sh &&
	echo "Successfully made file ${file}.sh executable" ||
	echo "Failed to make file ${file}.sh executable"
	mv ${file}.sh $HOME/../usr/bin/${file} &&
	echo "Successfully moved and file ${file} to /usr/bin" ||
	echo "Failed to move file ${file} to /usr/bin"

echo -e "\nalias mysql=\"mysql -u root -h localhost -P 3306 -p\"\n\nstart-server" >> $HOME/../usr/etc/bash.bashrc &&
echo "Successfully added commands to bash.bashrc" ||
echo "Failed to add commands to bash.bashrc"

pkg clean

termux-wake-lock &&
echo "Successfully acquired wake-lock" ||
echo "Failed to acquire wake-lock"
