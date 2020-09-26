#!/bin/bash

yes | pkg install mariadb &&
echo "Successfully installed package MariaDB or it is already installed" ||
echo "Failed to install package MariaDB"

for file in setpass start-server
do
	chmod u+x ${file}.sh &&
	echo "Successfully made file ${file} executable" ||
	echo "Failed to make file ${file} executable"

	mv ${file}.sh $HOME/../usr/bin/${file} &&
	echo "Successfully moved ${file} to /usr/bin" ||
	echo "Failed to move ${file} to /usr/bin"
done

echo -e "\nalias mysql=\"mysql -u root -h localhost -P 3306 -p\"\n\nstart-server" >> $HOME/../usr/etc/bash.bashrc &&
echo "Successfully added commands to bash.bashrc" ||
echo "Failed to add commands to bash.bashrc"

pkg clean

start-server  &&
echo "Successfully started the MySQL server" ||
echo "Failed to start the MySQL server"

pkg remove git  &&
echo "Successfully removed package git" ||
echo "Failed to remove package git"
