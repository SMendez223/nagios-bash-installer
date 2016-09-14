#!/bin/bash

PASS="0"
REPASS="1"

read -p "mailname: " NAME
#Password loop
while [ $PASS != $REPASS ]; do
	read -s -p "Nagios Password: " PASS; echo
	read -s -p "Retype Nagios Password: " REPASS; echo
done

debconf-set-selections <<< "postfix postfix/mailname string $NAME"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
debconf-set-selections <<< "nagios3-cgi nagios3/adminpassword string $PASS"
debconf-set-selections <<< "nagios3-cgi nagios3/adminpassword-repeat string $PASS"


sudo apt-get install -y nagios3


