#!/bin/bash

PASS="0"
REPASS="1"


#Password loop
while [ $PASS != $REPASS ]; do
	read -s -p "Password: " PASS; echo
	read -s -p "Retype: " REPASS; echo
done

udo debconf-set-selections <<< "postfix postfix/mailname string diggalabs.com"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
sudo debconf-set-selections <<< "nagios3-cgi nagios3/adminpassword string $PASS"
sudo debconf-set-selections <<< "nagios3-cgi nagios3/adminpassword-repeat string $PASS"


apt-get install -y nagios3


