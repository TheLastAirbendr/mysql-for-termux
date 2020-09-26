#!/bin/bash

yes | pkg install mariadb

for file in setpass start-server
do
	chmod u+x ${file}.sh
	mv ${file}.sh $HOME/../usr/bin/${file}
done

echo -e "\nalias mysql=\"mysql -u root -h localhost -P 3306 -p\"\n\nstart-server" >> $HOME/../usr/etc/bash.bashrc
pkg clean
start-server

