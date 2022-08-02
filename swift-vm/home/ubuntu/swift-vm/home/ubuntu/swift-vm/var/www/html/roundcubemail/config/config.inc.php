<?php

/* Local configuration for Roundcube Webmail */

// ----------------------------------
// SQL DATABASE
// ----------------------------------
// Database connection string (DSN) for read+write operations
// Format (compatible with PEAR MDB2): db_provider://user:password@host/database
// Currently supported db_providers: mysql, pgsql, sqlite, mssql, sqlsrv, oracle
// For examples see http://pear.php.net/manual/en/package.database.mdb2.intro-dsn.php
// Note: for SQLite use absolute path (Linux): 'sqlite:////full/path/to/sqlite.db?mode=0646'
//       or (Windows): 'sqlite:///C:/full/path/to/sqlite.db'
// Note: Various drivers support various additional arguments for connection,
//       for Mysql: key, cipher, cert, capath, ca, verify_server_cert,
//       for Postgres: application_name, sslmode, sslcert, sslkey, sslrootcert, sslcrl, sslcompression, service.
//       e.g. 'mysql://roundcube:@localhost/roundcubemail?verify_server_cert=false'
//$config['skin'] = 'elastic-dark';
$config['db_dsnw'] = 'mysql://roundcubemail:secretpassword02@localhost/roundcubemail';
$config['enable_installer'] = false;

$config['smtp_server'] = 'tls://mail.isellemails.com';
$config['session_lifetime'] = '2628000';
//$config['username_domain'] = '%t';
//$config['mail_domain'] = '%t';
//$config['smtp_helo_host'] = 'isellemails.com';
$config['smtp_helo_host'] = 'localhost';
//$config['smtp_helo_host'] = '';
// Log sent messages to <log_dir>/sendmail.log or to syslog
//$config['smtp_log'] = true;

// Log successful/failed logins to <log_dir>/userlogins.log or to syslog
$config['log_logins'] = true;
$config['max_message_size'] = '1066M';

// ----------------------------------
// IMAP
// ----------------------------------
// The IMAP host chosen to perform the log-in.
// Leave blank to show a textbox at login, give a list of hosts
// to display a pulldown menu or set one host as string.
// Enter hostname with prefix ssl:// to use Implicit TLS, or use
// prefix tls:// to use STARTTLS.
// Supported replacement variables:
// %n - hostname ($_SERVER['SERVER_NAME'])
// %t - hostname without the first part
// %d - domain (http hostname $_SERVER['HTTP_HOST'] without the first part)
// %s - domain name after the '@' from e-mail address provided at login screen
// For example %n = mail.domain.tld, %t = domain.tld
// WARNING: After hostname change update of mail_host column in users table is
//          required to match old user data records with the new host.
//$config['default_host'] = 'localhost';
$config['default_host'] = 'tls://isellemails.com';

// provide an URL where a user can get support for this Roundcube installation
// PLEASE DO NOT LINK TO THE ROUNDCUBE.NET WEBSITE HERE!
$config['support_url'] = '';

// This key is used for encrypting purposes, like storing of imap password
// in the session. For historical reasons it's called DES_key, but it's used
// with any configured cipher_method (see below).
// For the default cipher_method a required key length is 24 characters.
$config['des_key'] = 'ietFS3VsgKXSpoaG0zfFCbTY';

// ----------------------------------
// PLUGINS
// ----------------------------------
// List of active plugins (in plugins/ directory)
$config['plugins'] = array(
	'managesieve',
	'password',
	'persistent_login',
	'lastlogin',
//	'geolocation',
	'kolab_2fa',
);

// system error reporting, sum of: 1 = log; 4 = show
//$config['debug_level'] = 4;

// Log SQL queries
#$config['sql_debug'] = true;
