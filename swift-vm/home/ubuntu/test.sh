#!/bin/sh
if [ $# -lt 1 ]
then
	  echo "Usage: $0 current_password"
	    exit 1
fi

checkpw=$(/home/ubuntu/checkpw.sh $1)
#echo $checkpw
if [ "$checkpw" = "Password matches" ]
then
	echo "Password is correct."
else	    
	echo "Password is wrong."
fi
