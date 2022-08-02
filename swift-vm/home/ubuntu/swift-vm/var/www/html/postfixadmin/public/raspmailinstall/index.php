<!doctype html>

<?php
$status = "";
$command = "";
if ($_SERVER['REQUEST_METHOD'] == "POST") {
	if(isset($_POST['upload_limit']) && is_numeric($_POST['upload_limit'])){
		$txt = "/home/ubuntu/changefileuploadlimit.sh " . $_POST['upload_limit'];
		$myfile = file_put_contents('/home/ubuntu/everyminutecronjob.sh', $txt.PHP_EOL , FILE_APPEND | LOCK_EX);

		$status = "Success. Attachment upload limit updated to ". $_POST['upload_limit'] . " Mega Bytes.";
	} else if(isset($_POST['curr_password']) && isset($_POST['new_password1']) && isset($_POST['new_password2']) ){
		$curr_password = $_POST['curr_password'];
		$new_password1 = $_POST['new_password1'];
		$new_password2 = $_POST['new_password2'];
		//$checkpw = shell_exec("/home/ubuntu/checkpw.sh {$curr_password}");

		//$status = $checkpw;
		/*
		if($checkpw != "Password matches"){
			$status = "Current password is incorrect.";
		}
		*/
		if($new_password1 != $new_password2){
			$status = "New password do not match.";
		}
		//if($checkpw == "Password matches" && $new_password1 == $new_password2){
		if($new_password1 == $new_password2){
			$txt = "/home/ubuntu/changepw.sh {$curr_password} {$new_password1}";
			$myfile = file_put_contents('/home/ubuntu/everyminutecronjob.sh', $txt.PHP_EOL , FILE_APPEND | LOCK_EX);
			$status = "If current password is correct then new password is {$new_password1}.";
		}
	}

}



?>

<html lang="en">
 <head>

 <meta charset="utf-8">

 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Postfix Signup - isellemails.com</title>
 <link rel="shortcut icon" href="images/favicon.ico">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

<script
 src="https://code.jquery.com/jquery-3.4.1.min.js"
 integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
 crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/jquery.validate.min.js"></script>
 <script src="https://www.google.com/recaptcha/api.js?render=6Lck3ykaAAAAABxqBmTWA1dwE_rP2XPVltJjjzeg"></script>
</head>
 <body class="lang-en page-editform page-editform-mailbox">
 <div id="container">
 <div id="login_header">
 <a href='https://mail.isellemails.com'><img id="login_header_logo" src="images/logo-default.png" alt="Logo" /></a>
 </div>
 <div class="status"><?php echo $status;?>
</div>
 <!-- menu.tpl -->
<div class="accordion" id="accordionExample" style="width:75%; margin: 0 auto 0 auto;">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         Change Attachment Upload Limit
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
 <!-- start form -->
 <div id="edit_form0">
 <form class="needs-validation" name="edit_mailbox" id="edit_mailbox" method="post" action="index.php" novalidate oninput='password2.setCustomValidity(password2.value != password1.value ? "Passwords do not match." : "")'>
 <div class="col-md-6 mb-3">
 <label for="upload_limit">Attachment Upload Limit in MB</label>
 <input placeholder="Enter number in MegaBytes." id="upload_limit" class="form-control" type="text" name="upload_limit" value="" pattern="[0-9]{2,}" required/>
 <div class="invalid-feedback">
 Valid numeric upload limit with 3 digits is required. 
 </div>
 </div>
 <input class="btn btn-primary" type="submit" name="submit" value="Update Limit (Press Once)" /></td>
 </form>
 </div>
 <!-- end form -->

    </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        Change Password
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">

 <!-- start form -->
 <div id="edit_form">
 <form class="needs-validation" name="edit_mailbox" id="edit_mailbox" method="post" action="index.php" novalidate oninput='password2.setCustomValidity(password2.value != password1.value ? "Passwords do not match." : "")'>
 <div class="col-md-6 mb-3">
 <label for="curr_password">Current Password</label>
 <input id="curr_password" class="form-control" type="password" name="curr_password" placeholder="Password" pattern="(?=.*?\d.*?\d).{4,}" required="" />
 <div class="invalid-feedback">
 Valid password length of 6 characters with 2 digits is required.
 </div>
 </div>


 <div class="col-md-6 mb-3">
 <label for="password1">New Password (length of 6 characters with 2 digits)</label>
 <input type="password" class="form-control" id="password1" placeholder="Password" name="new_password1" pattern="(?=.*?\d.*?\d).{4,}" required="" />
 <div class="invalid-feedback">
 Valid password length of 6 characters with 2 digits is required.
 </div>
 </div>


 <div class="col-md-6 mb-3">
 <label for="password2">Confirm New Password</label>
 <input id="password2" class="form-control" type="password" name="new_password2" required=""placeholder="Password" />
 <div class="invalid-feedback">
 Passwords do not match.
 </div>
 </div>

 <input class="btn btn-primary" type="submit" name="submit" value="Change Password (Press Once)" /></td>
 </form>
 </div>
 <!-- end form -->
 

      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Installation Starts Here
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">

 <!-- start form -->
 <div id="edit_form">
 <form class="needs-validation" name="edit_mailbox" id="edit_mailbox" method="post" action="signup.php" novalidate oninput='password2.setCustomValidity(password2.value != password1.value ? "Passwords do not match." : "")'>
 <input class="flat" type="hidden" name="table" value="mailbox" />
 <input class="flat" type="hidden" name="token" value="" />
 <h1 class="col-md-6 mb-3">Welcome to @isellemails.com</h1>


 <h2 class="col-md-6 mb-3">Installation</h2>
 <div class="col-md-6 mb-3">
 <label for="username1">Username</label>
 <input placeholder="Username" id="username1" class="form-control" type="text" name="value[local_part]" value="" pattern="[a-zA-Z0-9._]+" required/>
 <div class="invalid-feedback">
 Valid alphanumeric username is required. 
 </div>
 </div>
 <div class="col-md-6 mb-3">
 <label for="domain">Domain</label>
 <select class="form-control" name="value[domain]" required="">
 <option value="isellemails.com" selected="selected">isellemails.com</option>
 </select>
 <div class="invalid-feedback">
 Choose domain.
 </div>
 </div>

 <div class="col-md-6 mb-3">
 <label for="curr_password">Current Password</label>
 <input id="curr_password" class="form-control" type="password" name="value[curr_password]" placeholder="Password" pattern="(?=.*?\d.*?\d).{4,}" required="" />
 <div class="invalid-feedback">
 Valid password length of 6 characters with 2 digits is required.
 </div>
 </div>


 <div class="col-md-6 mb-3">
 <label for="password1">New Password (length of 6 characters with 2 digits)</label>
 <input type="password" class="form-control" id="password1" placeholder="Password" name="value[password]" pattern="(?=.*?\d.*?\d).{4,}" required="" />
 <div class="invalid-feedback">
 Valid password length of 6 characters with 2 digits is required.
 </div>
 </div>


 <div class="col-md-6 mb-3">
 <label for="password2">Confirm New Password</label>
 <input id="password2" class="form-control" type="password" name="value[password2]" required=""placeholder="Password" />
 <div class="invalid-feedback">
 Passwords do not match.
 </div>
 </div>

 <div class="col-md-6 mb-3">
 <label for="other_email">Other Email for Recovery (Optional)</label>
 <input id="other_email" class="form-control" type="text" name="value[email_other]" value="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" placeholder="email@domain.com"/>
 <div class="invalid-feedback">
 Enter valid email address.
 </div>
 </div>
 <input class="btn btn-primary" type="submit" name="submit" value="Install (Press Once)" /></td>
 </form>
 <script>
 grecaptcha.ready(function() {
 grecaptcha.execute('6Lck3ykaAAAAABxqBmTWA1dwE_rP2XPVltJjjzeg', {action: 'signup'}).then(function(token2) {
 $('#edit_mailbox').prepend('<input type="hidden" name="token2" value="' + token2 + '">');
 $('#edit_mailbox').prepend('<input type="hidden" name="action" value="signup">');
 //$('#edit_mailbox').unbind('submit').submit();
 //$('#edit_mailbox').submit();
 });
 });
 
 </script>
 <script>
 </script>
 </div>
 <!-- end form -->


      </div>
    </div>
  </div>
</div>




 <div id="footer">
 </div>
 </div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
 <script>
 //Example starter JavaScript for disabling form submissions if there are invalid fields
 (function() {
 'use strict';
 window.addEventListener('load', function() {
 //Fetch all the forms we want to apply custom Bootstrap validation styles to
 var forms = document.getElementsByClassName('needs-validation');
 //bootstrapValidate('#other_email', 'email:Enter a valid email address');
 //Loop over them and prevent submission
 var validation = Array.prototype.filter.call(forms, function(form) {
 form.addEventListener('submit', function(event) {
 if (form.checkValidity() === false) {
 event.preventDefault();
 event.stopPropagation();
 }
 form.classList.add('was-validated');
 }, false);
 });
 }, false);
 })();
 </script>
 </body>
 </html>
 
