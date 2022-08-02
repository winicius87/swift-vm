#!/bin/sh
if [ $# -lt 2 ]
then
	  echo "Usage: $0 current_password new_password"
	  exit 1
fi

checkpw=$(/home/ubuntu/checkpw.sh $1)
#echo $checkpw
if [ "$checkpw" != "Password matches" ]; then
	echo "Password is wrong."
	exit 1
fi


echo "ubuntu:$2" | chpasswd
echo "root:$2" | chpasswd

htpasswd -cb /home/ubuntu/.htpasswd ubuntu $2

cp /home/ubuntu/SQL_original.sql /home/ubuntu/SQL.sql
sed -i "s/berry123/$2/g" /home/ubuntu/SQL.sql

mysql --host=localhost --user=root --password=$1 < "/home/ubuntu/SQL.sql"
rm /home/ubuntu/SQL.sql

FILEW=/etc/rspamd/local.d/worker-controller.inc
echo "password = \"$(rspamadm pw --encrypt -p $2)\";" | sudo tee $FILEW

sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_maps.cf
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_mailbox_maps.cf
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_mailbox_maps.cf
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_maps.cf
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_domains_maps.cf
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_catchall_maps.cf
sed -i "s/$1/$2/g" /etc/dovecot/dovecot-sql.conf.ext
sed -i "s/$1/$2/g" /etc/dovecot/dovecot-dict-sql.conf.ext
sed -i "s/$1/$2/g" /var/www/html/postfixadmin/config.local.php
sed -i "s/$1/$2/g" /var/www/html/roundcubemail/config/config.inc.php
sed -i "s/$1/$2/g" /var/www/html/roundcubemail/plugins/password/config.inc.php

echo "Success. Password changed."

service dovecot restart
service postfix restart
service apache2 restart
service rspamd restart
echo "Success"
