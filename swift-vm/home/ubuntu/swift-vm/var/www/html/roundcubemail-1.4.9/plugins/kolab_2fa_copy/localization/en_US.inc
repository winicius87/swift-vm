<?php

/**
 * Localizations for the Kolab 2-Factor-Auth plugin
 *
 * Copyright (C) 2015, Kolab Systems AG
 *
 * For translation see https://www.transifex.com/projects/p/kolab/resource/kolab_2fa/
 */

$labels['factor'] = 'Factor';
$labels['secret'] = 'Secret Key';
$labels['created'] = 'Created';
$labels['remove'] = 'Remove';
$labels['continue'] = 'Continue';

$labels['settingslist'] = 'Multi-Factor Auth';
$labels['settingstitle'] = 'Authentication Factors';

$labels['totp'] = 'Mobile App (TOTP)';
$labels['hotp'] = 'Mobile App (HOTP)';
$labels['yubikey'] = 'Yubikey';

$labels['or'] = 'or';
$labels['yes'] = 'yes';
$labels['no'] = 'no';

$labels['label'] = 'Name';
$labels['qrcode'] = 'QR Code';
$labels['showqrcode'] = 'Show QR Code';
$labels['qrcodeexplaintotp'] = 'Download an authenticator app on your phone. Two apps which work well are <strong>FreeOTP</strong> and <strong>Google Authenticator</strong>, but any other TOTP app should also work.<br/><br/>
Launch the app on your phone, and add a new entry for this service. When prompted, scan the QR code below to configure your mobile app.';
$labels['qrcodeexplainhotp'] = 'Download an authenticator app on your phone. One app known to work well is <strong>Google Authenticator</strong>, but any other HOTP app should also work.<br/><br/>
Launch the app on your phone, and add a new entry for this service. When prompted, scan the QR code below to configure your mobile app.';

$labels['yubikeyid'] = 'Your YubiKey ID';
$labels['yubikeyidexplainyubikey'] = 'Press your YubiKey once and submit the generated code';

$labels['addfactor'] = 'Add Authentication Factor';
$labels['testfactor'] = 'Test this factor';
$labels['verifycode'] = 'Verify Code';
$labels['verifycodeexplaintotp'] = 'Once you have scanned the QR code, enter the 6-digit verification code generated by the authenticator app.';
$labels['verifycodeexplainhotp'] = 'Once you have scanned the QR code, enter the 6-digit verification code generated by the authenticator app.';

$labels['loginexpired'] = 'Login request expired! Please try again.';
$labels['authremoveconfirm'] = 'Do you really want to remove this authentication factor from your account?';
$labels['verifycodemissing'] = 'Please enter the verification code from your device';

$labels['factorsavesuccess'] = 'Successfully saved authentication factor';
$labels['factorremovesuccess'] = 'Successfully removed the authentication factor';
$labels['factorsaveerror'] = 'Failed to save authentication factor settings';
$labels['codeverificationpassed'] = 'Code verification for $method passed';
$labels['codeverificationfailed'] = 'Code verification for $method failed';

$labels['highsecurityrequired'] = 'Entering High Security - Verification required';
$labels['highsecuritydialog'] = 'High security mode helps protect your account from security threats, like session theft or someone messing with your stuff while you\'re away. To enter high security mode, confirm your credentials with the additional authentication factor:';
$labels['enterhighsecurity'] = 'Confirm';