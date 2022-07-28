#!/bin/bash
if [ $# -lt 2 ]
then
	  echo "Usage: $0 hostname password"
	    exit 1
fi

#apt install $(cat ./i.list)
#mkdir -p /var/www/html/
#mysqldump -uroot -p --flush-privileges --routines --all-databases > SQLDump.sql
sshpass -p "$2" rsync -avI root@$1:/var/spool/cron/crontabs/root /var/spool/cron/crontabs/
sshpass -p "$2" rsync -avI root@$1:/var/www/html/ /var/www/html/
sshpass -p "$2" rsync -avI root@$1:/etc/letsencrypt/ /etc/letsencrypt/

sshpass -p "$2" rsync -avI root@$1:/home/ubuntu/.htpasswd /home/ubuntu/

sshpass -p "$2" rsync -avI root@$1:/home/ubuntu/ /home/ubuntu/

#mysql --host=localhost --user=root --password=$2 < "SQLDump.sql"

#FILEW=/etc/rspamd/local.d/
#mkdir -p $FILEW
sshpass -p "$2" rsync -avI root@$1:/etc/rspamd/local.d/worker-controller.inc /etc/rspamd/local.d/
#FILE=/var/lib/rspamd/dkim/
#mkdir -p $FILE
sshpass -p "$2" rsync -avI root@$1:/var/lib/rspamd/dkim/mail.pub /var/lib/rspamd/dkim/
sshpass -p "$2" rsync -avI root@$1:/etc/postfix/main.cf /etc/postfix/
sshpass -p "$2" rsync -avI root@$1:/etc/dovecot/conf.d/20-lmtp.conf /etc/dovecot/conf.d/
sshpass -p "$2" rsync -avI root@$1:/etc/dovecot/conf.d/10-ssl.conf /etc/dovecot/conf.d/
sshpass -p "$2" rsync -avI root@$1:/etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/
sshpass -p "$2" rsync -avI root@$1:/etc/apache2/sites-enabled/000-default-le-ssl.conf /etc/apache2/sites-enabled/
sshpass -p "$2" rsync -avI root@$1:/var/www/html/postfixadmin/config.local.php /var/www/html/postfixadmin/
sshpass -p "$2" rsync -avI root@$1:/var/www/html/roundcubemail/config/defaults.inc.php /var/www/html/roundcubemail/config/
sshpass -p "$2" rsync -avI root@$1:/var/www/html/roundcubemail/config/config.inc.php /var/www/html/roundcubemail/config/
sshpass -p "$2" rsync -avI root@$1:/etc/dovecot/conf.d/10-auth.conf /etc/dovecot/conf.d/
sshpass -p "$2" rsync -avI root@$1:/etc/postfix/sql/mysql_virtual_alias_maps.cf /etc/postfix/sql/
sshpass -p "$2" rsync -avI root@$1:/etc/postfix/sql/mysql_virtual_mailbox_maps.cf /etc/postfix/sql/
