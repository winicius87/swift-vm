#!/bin/sh
filename=/home/ubuntu/everyminutecronjob.sh
maxsize=10
filesize=$(stat -c%s "$filename")
#echo "Size of $filename = $filesize bytes."

if [ $filesize -gt $maxsize ]; then
	#echo "nope"
	sed -ni '1p' /home/ubuntu/everyminutecronjob.sh
#    else
#	echo "fine"
fi
