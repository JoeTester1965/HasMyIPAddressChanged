#!/bin/bash


while true
do
	my_ip_address_file="/tmp/my_last_ip_address"

	my_current_ip_address=`dig +short myip.opendns.com @resolver1.opendns.com`
	
	touch $my_ip_address_file 

	my_last_ip_address=$(head -n 1 $my_ip_address_file)

	if [ "$my_last_ip_address" != "$my_current_ip_address" ]; then
		`logger -p local0.notice -t ${0##*/}[$$] IP address changed from $my_last_ip_address to $my_current_ip_address`
	fi

	echo $my_current_ip_address > $my_ip_address_file
	
	sleep 60
done
