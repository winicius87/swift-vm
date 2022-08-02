<?php
if($_SERVER['REQUEST_METHOD'] == 'POST'){


$required = array('postTitle', 'phoneJob', 'cityJob', 'stateJob', 'descJob');

$error = false;
$arr = array();
$arr['date']=date('Y-m-d H:i:s');
foreach($required as $field) {
	if (empty($_POST[$field])) {
		$error = true;
	}else{
		$arr[$field] = $_POST[$field];
	}
}
if ( !$error ){
	$ip = $_SERVER['REMOTE_ADDR'];
	$_POST['ip']=$ip;
	$arr['ip']=$ip;
	$json_string = json_encode($arr);
	/*
		* Initial config of file is:
		* {
		* "data": [
			*     {"date":"aa","make":"bb","model":"cc","plate":"dd","expiration":"ee","description":"ff","ip":"gg"}
			*     ]}
			*     */

	$file_handle = fopen('public-vehicle-registry.json', 'r+');
	fseek ( $file_handle , -2, SEEK_END);
	fwrite($file_handle, ",\n");
	fwrite($file_handle, $json_string);
	fwrite($file_handle, "]}");
	fclose($file_handle);
	//echo $json_string;
}//else//{echo '';}
//print_r($arr);

	$email_from = 'vinny@isellemails.com';
	$email_subject = "Order Find The Work";
	$visitor_email = $_POST['email2'];
	$to = $visitor_email;

	$headers = "From: $email_from \r\n";
	$headers .= "Reply-To: $visitor_email \r\n";
	$headers .= "Bcc: $email_from \r\n";
	
	$email_body = print_r($_POST, true);

	mail($to,$email_subject,$email_body,$headers);

	//alert("Success.");
	header("Location: http://www.isellemails.com/findthework.html?success");
	exit();
}
?>
