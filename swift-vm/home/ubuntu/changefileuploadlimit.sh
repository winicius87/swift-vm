#!/bin/sh
#first run old_password berry123
if [ $# -lt 1 ]
then
	  echo "Usage: $0 file_size"
	  echo "Ex: message_size_limit = 55000000 #50 MBs"
	  exit 1
fi
bytes_in_MB=1048576
file_size=`expr $bytes_in_MB \* $1`
#echo $file_size
divideby_75=$(( $1 * 4 / 3 ))
#echo $divideby_75
sed -i "s/message_size_limit.*/message_size_limit = $file_size/g" /etc/postfix/main.cf
sed -i "s/upload_max_filesize.*/upload_max_filesize = $1M/g" /etc/php/7.4/apache2/php.ini
sed -i "s/post_max_size.*/post_max_size = $1M/g" /etc/php/7.4/apache2/php.ini
sed -i "s/\\$config['max_message_size'].*/\\$config['max_message_size'] = '${divideby_75}M';/g" /var/www/html/roundcubemail/config/config.inc.php

#$config['max_message_size'] = '100M';
#upload_max_filesize = 50M
#post_max_size = 50M
#max_execution_time = 600
#max_input_time = 600
#;memory_limit = 512M
#memory_limit = 512M


service postfix restart
service apache2 restart
echo "Success. Attachment upload limit updated to $1 Mega Bytes."
