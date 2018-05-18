#!/bin/bash

echo -e "Enter new MariaDB/MySQL password for docker-compose.yml: ";
read -s pass;
echo
sed -i 's/MYSQL_ROOT_PASSWORD:.*/MYSQL_ROOT_PASSWORD: '"$pass"'/' docker-compose.yml
sleep 1
echo -e "Password was changed!"
echo
egrep 'MYSQL_ROOT_PASSWORD' docker-compose.yml | uniq
