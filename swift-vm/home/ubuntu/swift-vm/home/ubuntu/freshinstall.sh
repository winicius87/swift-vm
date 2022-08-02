#!/bin/bash
if [ $# -lt 3 ]
then
	  echo "Usage: $0 hostname password"
	    exit 1
fi

mysqldump -uroot -p --flush-privileges --routines --all-databases > SQLDump.sql
apt install $(cat ./installed_packages.list)
mkdir -p /var/www/html/
scp -r root@$1:/var/www/html/ /var/www/html/

scp root@$1:/home/ubuntu/.htpasswd /home/ubuntu/.htpasswd


scp -r root@$1:/home/ubuntu/SQLDump.sql /home/ubuntu/SQLDump.sql
mysql --host=localhost --user=root --password=$1 < "SQLDump.sql"

FILEW=/etc/rspamd/local.d/
mkdir -p $FILEW
scp -r root@$1:/etc/rspamd/local.d/worker-controller.inc /etc/rspamd/local.d/worker-controller.inc
FILE=/var/lib/rspamd/dkim/
mkdir -p $FILE
scp -r root@$1:/var/lib/rspamd/dkim/mail.pub /var/lib/rspamd/dkim/mail.pub

scp -r root@$1:/etc/postfix/main.cf /etc/postfix/main.cf
scp -r root@$1:/etc/dovecot/conf.d/20-lmtp.conf /etc/dovecot/conf.d/20-lmtp.conf
scp -r root@$1:/etc/dovecot/conf.d/10-ssl.conf /etc/dovecot/conf.d/10-ssl.conf
scp -r root@$1:/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/000-default.conf
scp -r root@$1:/etc/apache2/sites-enabled/000-default-le-ssl.conf /etc/apache2/sites-enabled/000-default-le-ssl.conf
scp -r root@$1:/var/www/html/postfixadmin/config.local.php /var/www/html/postfixadmin/config.local.php
scp -r root@$1:/var/www/html/roundcubemail/config/defaults.inc.php /var/www/html/roundcubemail/config/defaults.inc.php
scp -r root@$1:/var/www/html/roundcubemail/config/config.inc.php /var/www/html/roundcubemail/config/config.inc.php
scp -r root@$1:/etc/dovecot/conf.d/10-auth.conf /etc/dovecot/conf.d/10-auth.conf
scp -r root@$1:/etc/postfix/sql/mysql_virtual_alias_maps.cf /etc/postfix/sql/mysql_virtual_alias_maps.cf
scp -r root@$1:/etc/postfix/sql/mysql_virtual_mailbox_maps.cf /etc/postfix/sql/mysql_virtual_mailbox_maps.cf
