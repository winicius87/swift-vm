#!/bin/bash
#if [ $# -lt 2 ]
#then
#	  echo "Usage: $0 hostname password"
#	    exit 1
#fi


#apt install $(cat ./installed_packages.list)
#mkdir -p /var/www/html/
#mysqldump -uroot -p --flush-privileges --routines --all-databases > SQLDump.sql
rsync -lptgoDvI --relative /etc/fail2ban/jail.local ./swift-vm/
rsync -lptgoDvI --relative /etc/fail2ban/filter.d/roundcube-auth.conf ./swift-vm/
rsync -lptgoDvI --relative /var/spool/cron/crontabs/root ./swift-vm/
rsync -avI --relative /var/www/html/ ./swift-vm/
rsync -avI --relative /etc/letsencrypt/ ./swift-vm/

rsync -lptgoDvI --relative /home/ubuntu/.htpasswd ./swift-vm/

rsync -avI --relative /home/ubuntu/ ./swift-vm/

#mysql --host=localhost --user=root --password=$2 < "SQLDump.sql"

#FILEW=/etc/rspamd/local.d/
#mkdir -p $FILEW
rsync -lptgoDvI --relative /etc/rspamd/local.d/worker-controller.inc ./swift-vm/
#FILE=/var/lib/rspamd/dkim/
#mkdir -p $FILE
rsync -lptgoDvI --relative /var/lib/rspamd/dkim/mail.pub ./swift-vm/
rsync -lptgoDvI --relative /etc/postfix/main.cf ./swift-vm/
rsync -lptgoDvI --relative /etc/dovecot/conf.d/20-lmtp.conf ./swift-vm/
rsync -lptgoDvI --relative /etc/dovecot/conf.d/10-ssl.conf ./swift-vm/
rsync -lptgoDvI --relative /etc/apache2/sites-enabled/000-default.conf ./swift-vm/
rsync -lptgoDvI --relative /etc/apache2/sites-enabled/000-default-le-ssl.conf ./swift-vm/
rsync -lptgoDvI --relative /var/www/html/postfixadmin/config.local.php ./swift-vm/
rsync -lptgoDvI --relative /var/www/html/roundcubemail/config/defaults.inc.php ./swift-vm/
rsync -lptgoDvI --relative /var/www/html/roundcubemail/config/config.inc.php ./swift-vm/
rsync -lptgoDvI --relative /etc/dovecot/conf.d/10-auth.conf ./swift-vm/
rsync -lptgoDvI --relative /etc/postfix/sql/mysql_virtual_alias_maps.cf ./swift-vm/
rsync -lptgoDvI --relative /etc/postfix/sql/mysql_virtual_mailbox_maps.cf ./swift-vm/
