<?php
/**
 * Postfix Admin
 *
 * LICENSE
 * This source file is subject to the GPL license that is bundled with
 * this package in the file LICENSE.TXT.
 *
 * Further details on the project are available at http://postfixadmin.sf.net
 *
 * @version $Id$
 * @license GNU GPL v2 or later.
 *
 * File: edit.php
 * This file implements the handling of edit forms.
 * The form layout is retrieved from the *Handler classes, which also do
 * the actual work of verifying and storing the values.
 *
 * GET parameters:
 *      table   what to edit (*Handler)
 *      edit    item to edit (if net given: a new item will be created)
 *      additional parameters will be accepted if specified in *Handler->webformConfig()[prefill] when creating a new item
 */

define("RECAPTCHA_V3_SECRET_KEY", '6Lck3ykaAAAAAHjJR5Qbkea73XwyCa9c18DXX9Cu');
 
if ($_SERVER['REQUEST_METHOD'] == "POST") {
	$token2 = $_POST['token2'];
	$action2 = $_POST['action'];
// call curl to POST request
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL,"https://www.google.com/recaptcha/api/siteverify");
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array('secret' => RECAPTCHA_V3_SECRET_KEY, 'response' => $token2)));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$response = curl_exec($ch);
curl_close($ch);
$arrResponse = json_decode($response, true);
 
// verify the response
if($arrResponse["success"] == '1' && $arrResponse["action"] == $action2 && $arrResponse["score"] >= 0.5) {
     //valid submission
     //go ahead and do necessary stuff
} else {
     //spam submission
	//show error message
	header("Location: https://isellemails.com/postfixadmin/public/signup.php?table=mailbox&domain=isellemails.com");
	exit;
}

} 

$username='winicius@gmail.com';
$_SESSION['sessid']['username']=$username;
require_once('common.php');

//$username = authentication_get_username(); # enforce login

$table = safepost('table', safeget('table'));
$handlerclass = ucfirst($table) . 'Handler';

if (!preg_match('/^[a-z]+$/', $table) || !file_exists(dirname(__FILE__) . "/../model/$handlerclass.php")) { # validate $table
    die("Invalid table name given!");
}

$error = 0;

$edit = safepost('edit', safeget('edit'));
$new  = 0;
if ($edit == "") {
    $new = 1;
}
//winicius
$new  = 1;

//$is_admin = authentication_has_role('admin');
$is_admin = true;
$handler  = new $handlerclass($new, $username, $is_admin);
$formconf = $handler->webformConfig();
$_SESSION['sessid']['roles'] = array('admin');

if ($is_admin) {
//	error_log("echo 1: ". $formconf['required_role']);
    authentication_require_role($formconf['required_role']);
} else {
//    if (empty($formconf['user_hardcoded_field'])) {
//        die($handlerclass . ' is not available for users');
//    }
}
if ($new == 0 || $formconf['early_init']) {
    if (!$handler->init($edit)) {
        if (count($handler->errormsg) == 0) {
            # should never happen and indicates a bug in $handler->init()
            flash_error($handlerclass . "->init() failed, but didn't set any error message");
        }
        flash_error($handler->errormsg);
        header("Location: " . $formconf['listview']);
        exit;
    }
}

$form_fields = $handler->getStruct();
$id_field    = $handler->getId_field();

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    if ($new) { # new - prefill fields from URL parameters if allowed in $formconf['prefill']
        if (isset($formconf['prefill'])) {
            foreach ($formconf['prefill'] as $field) {
                $prefillvalue = safeget($field, safesession("prefill:$table:$field"));
                if ($prefillvalue != '') {
                    $form_fields[$field]['default'] = $prefillvalue;
                    $handler->prefill($field, $prefillvalue);
                }
            }
        }
        $form_fields = $handler->getStruct(); # refresh $form_fields - a prefill field might have changed something
    } else { # edit mode - read values from database
        if (!$handler->view()) {
            flash_error($handler->errormsg);
            header("Location: " . $formconf['listview']);
            exit;
        } else {
            $values = $handler->result;
            $values[$id_field] = $edit;
        }
    }
}


if ($_SERVER['REQUEST_METHOD'] == "POST") {
    //if (safepost('token') != $_SESSION['PFA_token']) {
    //    die('Invalid token!');
    //}
    $inp_values = safepost('value', array());

    foreach ($form_fields as $key => $field) {
        if ($field['editable'] && $field['display_in_form']) {
            if (!isset($inp_values[$key])) {
                $inp_values[$key] = ''; # newer PHP versions don't include empty fields in $_POST (noticed with PHP 5.6.6)
            }

            if ($field['type'] == 'bool' && $inp_values[$key] == '') {
                $values[$key] = 0; # isset() for unchecked checkboxes is always false
            } elseif ($field['type'] == 'txtl') {
                $values[$key] = $inp_values[$key];
                $values[$key] = preg_replace('/\\\r\\\n/', ',', $values[$key]);
                $values[$key] = preg_replace('/\r\n/',     ',', $values[$key]);
                $values[$key] = preg_replace('/,[\s]+/i',  ',', $values[$key]);
                $values[$key] = preg_replace('/[\s]+,/i',  ',', $values[$key]);
                $values[$key] = preg_replace('/,,*/',      ',', $values[$key]);
                $values[$key] = preg_replace('/,*$|^,*/',  '',  $values[$key]);
                if ($values[$key] == '') {
                    $values[$key] = array();
                } else {
                    $values[$key] = explode(",", $values[$key]);
                }
            } else {
                $values[$key] = $inp_values[$key];
            }
        }
    }

    if (isset($formconf['hardcoded_edit']) && $formconf['hardcoded_edit']) {
        $values[$id_field] = $form_fields[$id_field]['default'];
    } elseif ($new == 0) {
        $values[$id_field] = $edit;
    }

    if ($new && ($form_fields[$id_field]['display_in_form'] == 0)) {
        if ($form_fields[$id_field]['editable'] == 1) { # address split to localpart and domain?
            $values[$id_field] = $handler->mergeId($values);
        } else { # probably auto_increment
            $values[$id_field] = '';
        }
    }

    if (!$handler->init($values[$id_field])) {
        $error = 1;
        $errormsg = $handler->errormsg;
    }

    if (!$handler->set($values)) {
        $error = 1;
        $errormsg = $handler->errormsg;
    }

    $form_fields = $handler->getStruct(); # refresh $form_fields - set() might have changed something
//winicius
    //winicius 
 //   error_log("echo: " . $error);
    if ($error != 1) {
 //   		error_log("echo3: ");// . print_r($handler->values));
        if (!$handler->store()) {
	    $errormsg = $handler->errormsg;
 //   		error_log("echo2: ");
 //   		error_log("echo2: " . $errormsg);
        } else {
            flash_info($handler->infomsg);
  //  		error_log("echo2 info: ");
  //  		error_log("echo2 info: " . $handler->infomsg);

            if (count($handler->errormsg)) { # might happen if domain_postcreation fails
                flash_error($handler->errormsg);
            }

            # remember prefill values for next usage of the form
            if (isset($formconf['prefill'])) {
                foreach ($formconf['prefill'] as $field) {
                    if (isset($values[$field])) {
                        $_SESSION["prefill:$table:$field"] = $values[$field];
                    }
                }
            }

            if ($new == 0) {
                header("Location: " . $formconf['listview']);
                exit;
            } else {
    		header("Location: signup.php?table=mailbox&domain=isellemails.com&success=true");
                exit;
            }
        }
    }
}

/*
if ($error != 1 && $new) { # no error and not in edit mode - reset fields to default for new item
    $values = array();
    foreach (array_keys($form_fields) as $key) {
        $values[$key] = $form_fields[$key]['default'];
    }
}

$errormsg = $handler->errormsg;
$fielderror = array();

foreach ($form_fields as $key => $field) {
    if ($form_fields[$key]['display_in_form']) {
        if (isset($errormsg[$key])) {
            $fielderror[$key] = $errormsg[$key];
            unset($errormsg[$key]);
        } else {
            $fielderror[$key] = '';
        }

        if (isset($values[$key])) {
            $smarty->assign("value_$key", $values[$key]);
        } else {
            $smarty->assign("value_$key", $form_fields[$key]['default']);
        }
    }
}
if (count($errormsg)) {
    flash_error($errormsg);
} # display the remaining error messages (not related to a field) with flash_error

if ($new) {
    $smarty->assign('mode', 'create');
    $smarty->assign('formtitle', Config::lang($formconf['formtitle_create']));
    $smarty->assign('submitbutton', Config::lang($formconf['create_button']));
} else {
    $smarty->assign('mode', 'edit');
    $smarty->assign('formtitle', Config::lang($formconf['formtitle_edit']));
    $smarty->assign('submitbutton', Config::lang('save'));
}

$smarty->assign('struct', $form_fields);
$smarty->assign('fielderror', $fielderror);
$smarty->assign('table', $table);
$smarty->assign('smarty_template', 'editform');
 */
//$smarty->display('index.tpl');
//

/* vim: set expandtab softtabstop=4 tabstop=4 shiftwidth=4: */
?>

<!-- index.tpl -->
<!-- header.tpl -->
<!doctype html>
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
<!-- menu.tpl -->
<?php
?>
<!-- flash_error.tpl -->
<div id="edit_form">

<form class="needs-validation" name="edit_mailbox" id="edit_mailbox" method="post" action="signup.php" novalidate oninput='password2.setCustomValidity(password2.value != password1.value ? "Passwords do not match." : "")'>
<input class="flat" type="hidden" name="table" value="mailbox" />
<input class="flat" type="hidden" name="token" value="" />



<?php
       if (isset($_GET['success'])) {
echo '  <h1 class="col-md-6 mb-3"><a href="https://mail.isellemails.com">Login to your new email at mail.isellemails.com. Click here.</a></h1>
';
       }else{
echo '  <h1 class="col-md-6 mb-3">Welcome to @isellemails.com</h1>
	  <h2 class="col-md-6 mb-3">Create a new email address! Forget about gmail, yahoo, and bing.</h2>
';       }
?>
<div class="col-md-6 mb-3">
                <label for="username1">Username</label>
	<input placeholder="Username" id="username1" class="form-control" type="text" name="value[local_part]" value="" pattern="[a-z0-9._%+-]+" required/>
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
                <label for="password1">Password (length of 6 characters with 2 digits)</label>
               <input type="password" class="form-control" id="password1" placeholder="Password" name="value[password]" pattern="(?=.*?\d.*?\d).{4,}" required="" />
                <div class="invalid-feedback">
                  Valid password length of 6 characters with 2 digits is required.
                </div>
              </div>




<div class="col-md-6 mb-3">
                <label for="password2">Password</label>
               <input id="password2" class="form-control" type="password" name="value[password2]" required=""placeholder="Password" />
                <div class="invalid-feedback">
                  Passwords do not match.
                </div>
</div>



<div class="col-md-6 mb-3">
                <label for="fullname">Full name</label>
               <input class="form-control" type="text" name="value[name]" value="" required="" placeholder="Firstname Lastname" />
                <div class="invalid-feedback">
                  Please enter full name.
                </div>
</div>
          
               <input class="flat" type="hidden" name="value[quota]" value="2000" />
          
               <input class="flat" type="hidden" value='1' name="value[active]" checked="checked"/>
  
               <input class="flat" type="hidden" value='1' name="value[welcome_mail]" checked="checked"/>
          
<div class="col-md-6 mb-3">
                <label for="other_email">Other Email for Recovery (Optional)</label>
               <input id="other_email" class="form-control" type="text" name="value[email_other]" value="" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  placeholder="email@domain.com"/>
                <div class="invalid-feedback">
                  Enter valid email address.
                </div>
</div>

<input class="btn btn-primary" type="submit" name="submit" value="Add Mailbox (Press Once)" /></td>

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
/*
    $('#edit_mailbox').submit(function(event) {
	            event.preventDefault();
		     
        grecaptcha.ready(function() {
            grecaptcha.execute('6Lck3ykaAAAAABxqBmTWA1dwE_rP2XPVltJjjzeg', {action: 'signup'}).then(function(token2) {
                $('#edit_mailbox').prepend('<input type="hidden" name="token2" value="' + token2 + '">');
                $('#edit_mailbox').prepend('<input type="hidden" name="action" value="signup">');
		
		$('#edit_mailbox').unbind('submit').submit();
            });
        });
  });
 */
  </script>

</div>
<!-- footer.tpl -->
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

