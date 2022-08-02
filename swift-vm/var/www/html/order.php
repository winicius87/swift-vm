<?php
if($_SERVER['REQUEST_METHOD'] == 'POST'){
	$email_from = 'vinny@isellemails.com';
	$email_subject = "Order";
	$visitor_email = $_POST['email'];
	$to = $visitor_email;

	$headers = "From: $email_from \r\n";
	$headers .= "Reply-To: $visitor_email \r\n";
	$headers .= "Bcc: $email_from \r\n";
	
	$email_body = print_r($_POST, true);

	mail($to,$email_subject,$email_body,$headers);

	//alert("Success.");
	header("Location: http://www.isellemails.com/?success");
	exit();
}
?>
<!DOCTYPE html>
<html lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/docs/4.0/assets/img/favicons/favicon.ico">

    <title>Checkout</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/checkout/">

    <!-- Bootstrap core CSS -->
    <link href="order/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="order/form-validation.css" rel="stylesheet">

  
  </head>

  <body class="bg-light" data-new-gr-c-s-check-loaded="8.884.0" data-gr-ext-installed="">

    <div class="container">
      <div class="py-5 text-center">
        <!--img class="d-block mx-auto mb-4" src="Checkout%20example%20for%20Bootstrap_files/bootstrap-solid.svg" alt="" width="72" height="72"-->
        <h2>Checkout form</h2>
        <!--p class="lead">Below is an example form built entirely with 
Bootstrap's form controls. Each required form group has a validation 
state that can be triggered by attempting to submit the form without 
completing it.</p-->
      </div>
     <form action="order.php" method="post" class="needs-validation" novalidate="">

      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-muted">Your cart</span>
            <span class="badge badge-secondary badge-pill">1</span>
          </h4>
          <ul class="list-group mb-3">
            <li class="list-group-item d-flex justify-content-between lh-condensed">

              <div>
			  			<figure>
<img src="https://isellemails.com/Strategy_files/5.jpg" alt="Free Template" class="img-fluid">
</figure>
                <h6 class="my-0">Raspberry Pi 4</h6>
                <small class="text-muted">Email Server</small>
              </div>
			  <span><input type="number" min="0" class="quantity"
				value="1"
				size=2
				onChange="updatePrice(this)" /> 
				</td> </span>
              <span id="item1_total" class="text-muted">$89</span>
            </li>
            <li class="list-group-item d-flex justify-content-between lh-condensed">
              <div>
                <h6 class="my-0">Shipping</h6>
                <small class="text-muted"></small>
              </div>
              <span id="shipping" class="text-muted">$8</span>
            </li>
            
            <li class="list-group-item d-flex justify-content-between">
              <span>Total (USD)</span>
              <strong id="total">$97</strong>
            </li>
          </ul>

          <!--form class="card p-2">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Promo code">
              <div class="input-group-append">
                <button type="submit" class="btn btn-secondary">Redeem</button>
              </div>
            </div>
          </form-->
        </div>
        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Billing address</h4>
          <!--form action="order.php" method="post" class="needs-validation" novalidate=""-->
		  <input type="hidden" class="form-control" name="fquantity" id="fquantity" placeholder="" required="">
		  <input type="hidden" class="form-control" name="ftotal" id="ftotal" placeholder="" required="">
		  <input type="hidden" class="form-control" name="fshipping" id="fshipping" placeholder="" required="">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="firstName">First name</label>
                <input type="text" class="form-control" name="firstName" id="firstName" placeholder="" required="">
                <div class="invalid-feedback">
                  Valid first name is required.
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="lastName">Last name</label>
                <input type="text" class="form-control" name="lastName" id="lastName" placeholder="" required="">
                <div class="invalid-feedback">
                  Valid last name is required.
                </div>
              </div>
            </div>

            <!--div class="mb-3">
              <label for="username">Username</label>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">@</span>
                </div>
                <input type="text" class="form-control" id="username" placeholder="Username" required="">
                <div class="invalid-feedback" style="width: 100%;">
                  Your username is required.
                </div>
              </div>
            </div-->

            <div class="mb-3">
              <label for="email">Email <span class="text-muted"></span></label>
              <input type="email" class="form-control" name="email" id="email" placeholder="you@example.com" required="">
              <div class="invalid-feedback">
                Please enter a valid email address for shipping updates.
              </div>
            </div>

            <div class="mb-3">
              <label for="address">Address</label>
              <input type="text" class="form-control" name="address" id="address" placeholder="1234 Main St" required="">
              <div class="invalid-feedback">
                Please enter your shipping address.
              </div>
            </div>

            <div class="mb-3">
              <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
              <input type="text" class="form-control" name="address2" id="address2" placeholder="Apartment or suite">
            </div>

            <div class="row">
              <div class="col-md-5 mb-3">
                <label for="country">Country</label>
                <select class="custom-select d-block w-100" id="country" required="">
                  <option value="" selected="selected">Choose...</option>
                  <option>United States</option>
                </select>
                <div class="invalid-feedback">
                  Please select a valid country.
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="state">State</label>
				<input type="text" class="form-control" name="state" id="state" placeholder="" required="">
                <!--select class="custom-select d-block w-100" id="state" required="">
                  <option value="" selected="selected">Choose...</option>
                  <option>California</option>
                </select-->
                <div class="invalid-feedback">
                  Please provide a valid state.
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="zip">Zip</label>
                <input type="text" class="form-control" name="zip" id="zip" placeholder="" required="">
                <div class="invalid-feedback">
                  Zip code required.
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" name="same-address" id="same-address">
              <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
            </div>
            <!--div class="custom-control custom-checkbox">
              <input type="checkbox" class="custom-control-input" id="save-info">
              <label class="custom-control-label" for="save-info">Save this information for next time</label>
            </div-->
            <hr class="mb-4">

            <h4 class="mb-3">Payment</h4>

            <div class="d-block my-3">
              <div class="custom-control custom-radio">
                <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="checked" required="">
                <label class="custom-control-label" for="credit">Credit card</label>
              </div>
              <div class="custom-control custom-radio">
                <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                <label class="custom-control-label" for="debit">Debit card</label>
              </div>
              <!--div class="custom-control custom-radio">
                <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
                <label class="custom-control-label" for="paypal">Paypal</label>
              </div-->
            </div>
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" name="cc-name" id="cc-name" placeholder="" required="">
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" name="cc-number" id="cc-number" placeholder="" required="">
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" name="cc-expiration" id="cc-expiration" placeholder="" required="">
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">CVV</label>
                <input type="text" class="form-control" name="cc-cvv" id="cc-cvv" placeholder="" required="">
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div>
            <hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
        </div>
      </div>
          </form>

      <footer class="my-5 pt-5 text-muted text-center text-small">
        <span class="mb-1">© </span><span id="year" class="mb-1"></span><span class="mb-1"> isellemails.com</span>
        <!--ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul-->
      </footer>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="order/jquery-3.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="order/popper.js"></script>
    <script src="order/bootstrap.js"></script>
    <script src="order/holder.js"></script>
    <script>
	var updatePrice;
	$( document ).ready(function() {
	
		document.getElementById("year").innerHTML = new Date().getFullYear();
		updatePrice = function(obj) {
		//alert("awd");
		var quantity = obj.value;
		var ship = 8;
		//alert(quantity);
		var it = quantity*89;
		var st = quantity*ship;
		var t = it+st;
		$("#shipping").text('$'+st);
		$("#item1_total").text('$'+it);
		$("#total").text('$'+t);
		
		$("#fquantity").val(quantity);
		$("#fshipping").val('$'+st);
		$("#ftotal").val('$'+t);
	}
});
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function() {

        'use strict';
        window.addEventListener('load', function() {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');

          // Loop over them and prevent submission
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
  

</body><grammarly-desktop-integration data-grammarly-shadow-root="true"></grammarly-desktop-integration></html>
