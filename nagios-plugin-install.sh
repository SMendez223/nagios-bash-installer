#!/bin/bash

$PASS="0"
$REPASS="1"

while [ $PASS !+= $REPASS ]; do
	read -s -p "Password: " PASS
	read -s -p "Retype: " REPASS
done


