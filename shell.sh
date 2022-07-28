#!/bin/sh
#first run old_password berry123
if [ $# -lt 3 ]
then
	  echo "Usage: $0 current_password new_password domain"
	    exit 1
fi
echo "Current Password: $1"
echo "New Password: $2"
echo "Domain: $3"

echo "ubuntu:$2" | chpasswd
echo "root:$2" | chpasswd

htpasswd -cb /home/ubuntu/.htpasswd ubuntu $2

cp SQL_original.sql SQL.sql
sed -i "s/berry123/$2/g" SQL.sql

mysql --host=localhost --user=root --password=$1 < "SQL.sql"

FILEW=/etc/rspamd/local.d/worker-controller.inc
echo "password = \"$(rspamadm pw --encrypt -p $2)\";" | sudo tee $FILEW

FILE=/var/lib/rspamd/dkim/mail.pub
if [ ! -f "$FILE" ]; then
	    echo "$FILE does not exist."
	rspamadm dkim_keygen -b 2048 -s mail -k /var/lib/rspamd/dkim/mail.key | sudo tee -a  /var/lib/rspamd/dkim/mail.pub
	sudo chown -R _rspamd: /var/lib/rspamd/dkim
	sudo chmod 440 /var/lib/rspamd/dkim/*
fi


sed -i "s/isellemails.com/$3/g" /etc/postfix/main.cf
#:27:smtpd_tls_cert_file = /etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/postfix/main.cf:28:smtpd_tls_key_file = /etc/letsencrypt/live/isellemails.com/privkey.pem
#/etc/postfix/main.cf:33:#smtp_tls_CApath=/etc/letsencrypt/live/isellemails.com/chain.pem
#/etc/postfix/main.cf:52:myhostname = isellemails.com
sed -i "s/isellemails.com/$3/g" /etc/dovecot/conf.d/20-lmtp.conf
#:38:  postmaster_address = postmaster@isellemails.com
sed -i "s/isellemails.com/$3/g" /etc/dovecot/conf.d/10-ssl.conf
#:12:ssl_cert = </etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/dovecot/conf.d/10-ssl.conf:13:ssl_key = </etc/letsencrypt/live/isellemails.com/privkey.pem
#/etc/dovecot/conf.d/10-ssl.conf:56:ssl_cert = </etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/dovecot/conf.d/10-ssl.conf:57:ssl_key = </etc/letsencrypt/live/isellemails.com/privkey.pem
sed -i "s/isellemails.com/$3/g" /etc/apache2/sites-enabled/000-default.conf
#:13:	ServerName isellemails.com
#/etc/apache2/sites-enabled/000-default.conf:31:RewriteCond %{SERVER_NAME} =isellemails.com
sed -i "s/isellemails.com/$3/g" /etc/apache2/sites-enabled/000-default-le-ssl.conf
#:14:	ServerName isellemails.com
#/etc/apache2/sites-enabled/000-default-le-ssl.conf:33:SSLCertificateFile /etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/apache2/sites-enabled/000-default-le-ssl.conf:34:SSLCertificateKeyFile /etc/letsencrypt/live/isellemails.com/privkey.pem
#sed -i "s/isellemails.com/mail.$3/g" /etc/apache2/sites-available/000-default.conf
#:13:	ServerName isellemails.com
#/etc/apache2/sites-available/000-default.conf:31:RewriteCond %{SERVER_NAME} =isellemails.com
#sed -i "s/isellemails.com/$3/g" /etc/apache2/sites-available/000-default-le-ssl.conf
#:14:	ServerName isellemails.com
#/etc/apache2/sites-available/000-default-le-ssl.conf:33:SSLCertificateFile /etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/apache2/sites-available/000-default-le-ssl.conf:34:SSLCertificateKeyFile /etc/letsencrypt/live/isellemails.com/privkey.pem

#/etc/letsencrypt/renewal/isellemails.com.conf:3:archive_dir = /etc/letsencrypt/archive/isellemails.com
#/etc/letsencrypt/renewal/isellemails.com.conf:4:cert = /etc/letsencrypt/live/isellemails.com/cert.pem
#/etc/letsencrypt/renewal/isellemails.com.conf:5:privkey = /etc/letsencrypt/live/isellemails.com/privkey.pem
#/etc/letsencrypt/renewal/isellemails.com.conf:6:chain = /etc/letsencrypt/live/isellemails.com/chain.pem
#/etc/letsencrypt/renewal/isellemails.com.conf:7:fullchain = /etc/letsencrypt/live/isellemails.com/fullchain.pem

sed -i "s/isellemails.com/$3/g" /var/www/html/postfixadmin/config.local.php
#:11:	  'abuse'      => 'abuse@isellemails.com',
#/var/www/html/postfixadmin/config.local.php:12:	    'hostmaster' => 'hostmaster@isellemails.com',
#/var/www/html/postfixadmin/config.local.php:13:	      'postmaster' => 'postmaster@isellemails.com',
#/var/www/html/postfixadmin/config.local.php:14:	        'webmaster'  => 'webmaster@isellemails.com'
sed -i "s/isellemails.com/$3/g" /var/www/html/roundcubemail/config/defaults.inc.php
#:271:$config['smtp_server'] = 'tls://mail.isellemails.com';
sed -i "s/isellemails.com/$3/g" /var/www/html/roundcubemail/config/config.inc.php
#:21:$config['smtp_server'] = 'tls://mail.isellemails.com';
#/var/www/html/roundcubemail/config/config.inc.php:24:#$config['smtp_helo_host'] = 'isellemails.com';
sed -i "s/isellemails.com/$3/g" /etc/dovecot/conf.d/10-auth.conf

sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_maps.cf
#:2:password = $1
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_mailbox_maps.cf
#:2:password = $1
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_mailbox_maps.cf
#:2:password = $1
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_maps.cf
#:2:password = $1
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_domains_maps.cf
#:2:password = $1
sed -i "s/$1/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_catchall_maps.cf
#:2:password = $1
sed -i "s/$1/$2/g" /etc/dovecot/dovecot-sql.conf.ext
#:5:connect = host=127.0.0.1 dbname=postfixadmin user=postfixadmin password=$1
sed -i "s/$1/$2/g" /etc/dovecot/dovecot-dict-sql.conf.ext
#:12:connect = host=127.0.0.1 dbname=postfixadmin user=postfixadmin password=$1
sed -i "s/$1/$2/g" /var/www/html/postfixadmin/config.local.php
#:7:$CONF['database_password'] = '$1';
sed -i "s/$1/$2/g" /var/www/html/roundcubemail/config/config.inc.php
#:18:$config['db_dsnw'] = 'mysql://roundcubemail:$1@localhost/roundcubemail';
sed -i "s/$1/$2/g" /var/www/html/roundcubemail/plugins/password/config.inc.php
#$config['password_db_dsn'] = 'mysql://postfixadmin:$1@localhost/postfixadmin';

#/etc/dovecot/conf.d/20-lmtp.conf
#vinny@isellemails.com
service dovecot restart
service postfix restart
service apache2 restart
echo "Success"
