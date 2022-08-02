<?php
$CONF['configured'] = true;

$CONF['database_type'] = 'mysqli';
$CONF['database_host'] = 'localhost';
$CONF['database_user'] = 'postfixadmin';
$CONF['database_password'] = 'XqSiq123ML';
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

$CONF['setup_password'] = 'df27356dadd8fab4fc659736ffbaf2a7:c0b559303c853b72e4e710d7c20b921c34e226f5';
?>
