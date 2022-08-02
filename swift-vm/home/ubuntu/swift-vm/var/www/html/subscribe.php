<?php

## CONFIG ##

## LIST EMAIL ADDRESS
$recipient = $_POST['email'];
$name = $_POST['name'];
$phone = $_POST['phone'];

## SUBJECT (Subscribe/Remove)
$subject = "Subscribed";

## RESULT PAGE

### FORM VALUES ##

## SENDER - WE ALSO USE THE RECIPIENT AS SENDER IN THIS SAMPLE
## DON'T INCLUDE UNFILTERED USER INPUT IN THE MAIL HEADER!
$sender = 'vinny@isellemails.com';
$headers = "From: $sender \r\n";
$headers .= "Reply-To: $sender \r\n";
$headers .= "Bcc: $sender \r\n";
## MAIL BODY
$body .= "Name: ".$name." \n";
$body .= "Phone: ".$phone." \n";
$body .= "Email: ".$recipient." \n";
## add more fields here if required

### SEND MESSGAE ##

mail( $recipient, $subject, $body, $headers ) or die ("Mail could not be sent.");

## SHOW RESULT PAGE ##
$error = 'false';
echo 'Success';
?>
