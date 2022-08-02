sed -i "s/berry123/$2/g" /etc/postfix/main.cf
#:27:smtpd_tls_cert_file = /etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/postfix/main.cf:28:smtpd_tls_key_file = /etc/letsencrypt/live/isellemails.com/privkey.pem
#/etc/postfix/main.cf:33:#smtp_tls_CApath=/etc/letsencrypt/live/isellemails.com/chain.pem
#/etc/postfix/main.cf:52:myhostname = isellemails.com
sed -i "s/berry123/$2/g" /etc/dovecot/conf.d/20-lmtp.conf
#:38:  postmaster_address = postmaster@isellemails.com
sed -i "s/berry123/$2/g" /etc/dovecot/conf.d/10-ssl.conf
#:12:ssl_cert = </etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/dovecot/conf.d/10-ssl.conf:13:ssl_key = </etc/letsencrypt/live/isellemails.com/privkey.pem
#/etc/dovecot/conf.d/10-ssl.conf:56:ssl_cert = </etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/dovecot/conf.d/10-ssl.conf:57:ssl_key = </etc/letsencrypt/live/isellemails.com/privkey.pem
sed -i "s/berry123/$2/g" /etc/apache2/sites-enabled/000-default.conf
#:13:	ServerName isellemails.com
#/etc/apache2/sites-enabled/000-default.conf:31:RewriteCond %{SERVER_NAME} =isellemails.com
sed -i "s/berry123/$2/g" /etc/apache2/sites-enabled/000-default-le-ssl.conf
#:14:	ServerName isellemails.com
#/etc/apache2/sites-enabled/000-default-le-ssl.conf:33:SSLCertificateFile /etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/apache2/sites-enabled/000-default-le-ssl.conf:34:SSLCertificateKeyFile /etc/letsencrypt/live/isellemails.com/privkey.pem
sed -i "s/berry123/$2/g" /etc/apache2/sites-available/000-default.conf
#:13:	ServerName isellemails.com
#/etc/apache2/sites-available/000-default.conf:31:RewriteCond %{SERVER_NAME} =isellemails.com
sed -i "s/berry123/$2/g" /etc/apache2/sites-available/000-default-le-ssl.conf
#:14:	ServerName isellemails.com
#/etc/apache2/sites-available/000-default-le-ssl.conf:33:SSLCertificateFile /etc/letsencrypt/live/isellemails.com/fullchain.pem
#/etc/apache2/sites-available/000-default-le-ssl.conf:34:SSLCertificateKeyFile /etc/letsencrypt/live/isellemails.com/privkey.pem

#/etc/letsencrypt/renewal/isellemails.com.conf:3:archive_dir = /etc/letsencrypt/archive/isellemails.com
#/etc/letsencrypt/renewal/isellemails.com.conf:4:cert = /etc/letsencrypt/live/isellemails.com/cert.pem
#/etc/letsencrypt/renewal/isellemails.com.conf:5:privkey = /etc/letsencrypt/live/isellemails.com/privkey.pem
#/etc/letsencrypt/renewal/isellemails.com.conf:6:chain = /etc/letsencrypt/live/isellemails.com/chain.pem
#/etc/letsencrypt/renewal/isellemails.com.conf:7:fullchain = /etc/letsencrypt/live/isellemails.com/fullchain.pem

sed -i "s/berry123/$2/g" /var/www/html/postfixadmin/config.local.php
#:11:	  'abuse'      => 'abuse@isellemails.com',
#/var/www/html/postfixadmin/config.local.php:12:	    'hostmaster' => 'hostmaster@isellemails.com',
#/var/www/html/postfixadmin/config.local.php:13:	      'postmaster' => 'postmaster@isellemails.com',
#/var/www/html/postfixadmin/config.local.php:14:	        'webmaster'  => 'webmaster@isellemails.com'
sed -i "s/berry123/$2/g" /var/www/html/roundcubemail/config/defaults.inc.php
#:271:$config['smtp_server'] = 'tls://mail.isellemails.com';
sed -i "s/berry123/$2/g" /var/www/html/roundcubemail/config/config.inc.php
#:21:$config['smtp_server'] = 'tls://mail.isellemails.com';
#/var/www/html/roundcubemail/config/config.inc.php:24:#$config['smtp_helo_host'] = 'isellemails.com';
sed -i "s/berry123/$2/g" /etc/postfix/sql/mysql_virtual_alias_maps.cf
#:2:password = berry123
sed -i "s/berry123/$2/g" /etc/postfix/sql/mysql_virtual_mailbox_maps.cf
#:2:password = berry123
sed -i "s/berry123/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_mailbox_maps.cf
#:2:password = berry123
sed -i "s/berry123/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_maps.cf
#:2:password = berry123
sed -i "s/berry123/$2/g" /etc/postfix/sql/mysql_virtual_domains_maps.cf
#:2:password = berry123
sed -i "s/berry123/$2/g" /etc/postfix/sql/mysql_virtual_alias_domain_catchall_maps.cf
#:2:password = berry123
sed -i "s/berry123/$2/g" /etc/dovecot/dovecot-sql.conf.ext
#:5:connect = host=127.0.0.1 dbname=postfixadmin user=postfixadmin password=berry123
sed -i "s/berry123/$2/g" /etc/dovecot/dovecot-dict-sql.conf.ext
#:12:connect = host=127.0.0.1 dbname=postfixadmin user=postfixadmin password=berry123
sed -i "s/berry123/$2/g" /var/www/html/postfixadmin/config.local.php
#:7:$CONF['database_password'] = 'berry123';
sed -i "s/berry123/$2/g" /var/www/html/roundcubemail/config/config.inc.php
#:18:$config['db_dsnw'] = 'mysql://roundcubemail:berry123@localhost/roundcubemail';
