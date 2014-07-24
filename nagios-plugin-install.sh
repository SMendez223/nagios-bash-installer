#!/bin/bash

PASS="0"
REPASS="1"


#Password loop
while [ $PASS != $REPASS ]; do
	read -s -p "Password: " PASS; echo
	read -s -p "Retype: " REPASS; echo
done

#initial installs
apt-get install -y apache2 apache2-utils

#file setup
mkdir /etc/nagios3
htpasswd -cb /etc/nagios3/htpasswd.users nagiosadmin $PASS

#nagios install
apt-get install nagios3


