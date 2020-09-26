#!/bin/bash

res1=$(ps -e -o pid= -o comm= | grep mysqld_safe)
res2=$(ps -e -o pid= -o comm= | grep mariadb)

if [ -n "$res1" -a -n "$res2" ]
then
        IFS=" " read -r -a pid1  <<< "$res1"
        IFS=" " read -r -a pid2 <<< "$res2"

        kill -9 $pid1 $pid2
fi

useless=$(mysqld_safe -u root &)
