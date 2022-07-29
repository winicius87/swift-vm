<?php
$CONF['configured'] = true;

$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = 'localhost';
$CONF['database_user'] = 'postfixadmin';
$CONF['database_password'] = 'secretpassword02';
$CONF['database_name'] = 'postfixadmin';

$CONF['default_aliases'] = array (
	  'abuse'      => 'abuse@isellemails.com',
	    'hostmaster' => 'hostmaster@isellemails.com',
	      'postmaster' => 'postmaster@isellemails.com',
	        'webmaster'  => 'webmaster@isellemails.com'
);

$CONF['fetchmail'] = 'NO';
$CONF['show_footer_text'] = 'NO';

$CONF['quota'] = 'YES';
$CONF['domain_quota'] = 'YES';
$CONF['quota_multiplier'] = '1024000';
$CONF['used_quotas'] = 'YES';
$CONF['new_quota_table'] = 'YES';

$CONF['aliases'] = '0';
$CONF['mailboxes'] = '0';
$CONF['maxquota'] = '0';
$CONF['domain_quota_default'] = '0';

$CONF['setup_password'] = '$2y$10$E6ICxQhLnvktVVk3K2mF4.fSiusVa/knQGr7ouxLNXPWHH3e4yRB6';
#pw:Awdawd123!
?>
