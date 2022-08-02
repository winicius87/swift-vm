#!/bin/bash
if [ $# -lt 1 ]
then
	  echo "Usage: $0 current_password"
	    exit 1
fi

#read -p "Username >" username
#IFS= read -p "Password >" password
username='ubuntu'
password=$1
#IFS=$1

salt=$(sudo getent shadow $username | cut -d$ -f3)
epassword=$(sudo getent shadow $username | cut -d: -f2)
match=$(python -c 'import crypt; print crypt.crypt("'"${password}"'", "$6$'${salt}'")')
#[ ${match} == ${epassword} ] && echo "Password matches" || echo "Password doesn't match"
if [ "$match" = "$epassword" ]; then
	echo "Password matches"
else
	echo "Password doesn't match"
fi
