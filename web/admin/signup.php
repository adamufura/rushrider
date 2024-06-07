<?php require 'helpers/admin_init.php'; ?>
<?php require 'helpers/_signup.php'; ?>

<?php
$pageDetails = [
  'title' => "SIGN UP | Business Account"
];
Includes::custom_include('includes/ex-header.php', $pageDetails, true);

?>

<body class="app app-signup p-0">    	
    <div class="row g-0 app-auth-wrapper">
	    <div class="col-12 col-md-7 col-lg-6 auth-main-col text-center p-5">
		    <div class="d-flex flex-column align-content-end">
			    <div class="app-auth-body mx-auto">	
				    <div class="app-auth-branding mb-4"><a class="app-logo" href="../index.php"><img class="rounded-circle logo-icon me-2" src="assets/images/logo.png" alt="logo"></a></div>
					<h2 class="auth-heading text-center mb-4">Sign up to Business Account</h2>					
	
					<div class="auth-form-container text-start mx-auto">
						<form class="auth-form auth-signup-form" action="" method="post">         
							<div class="email mb-3">
								<label class="sr-only" for="signup-email">Business Name</label>
								<input id="signup-name" name="name" type="text" class="form-control signup-name" placeholder="Business Name" required="required" value="<?php if (isset($name)) {
                                       echo $name;} ?>">
							</div>
							<div class="email mb-3">
								<label class="sr-only" for="signup-email">Business Email</label>
								<input id="signup-email" name="email" type="email" class="form-control signup-email" placeholder="Business Email" required="required" value="<?php if (isset($email)) {
                                       echo $email;} ?>">
							</div>
							<div class="email mb-3">
								<label class="sr-only" for="signup-email">Business Physical Address</label>
								<input id="signup-email" name="address" type="text" class="form-control signup-email" placeholder="Business Physical Address" required="required" value="<?php if (isset($address)) {
                                       echo $address;} ?>">
							</div>
							<div class="password mb-3">
								<label class="sr-only" for="signup-password">Password</label>
								<input id="signup-password" name="password" type="password" class="form-control signup-password" placeholder="Create a password" required="required" value="<?php if (isset($password)) {
                                       echo $password;} ?>">
							</div>
							<div class="password mb-3">
								<label class="sr-only" for="signup-password">Confirm Password</label>
								<input id="signup-password" name="cpassword" type="password" class="form-control signup-password" placeholder="Confirm password" required="required">
							</div>
						<div class="text-center">
							<span class="text-danger text-center">
								<?php if (isset($messages['msgErr'])) {
								echo $messages['msgErr'];
								} ?>
              </span>
						</div>
							
							<div class="text-center">
								<button name="signup" type="submit" class="btn app-btn-primary w-100 theme-btn mx-auto">Sign Up</button>
							</div>
						</form><!--//auth-form-->
						
						<div class="auth-option text-center pt-5">Already have an account? <a class="text-link" href="signin.php" >Sign in</a></div>
					</div><!--//auth-form-container-->	
					
					
				    
			    </div><!--//auth-body-->
		    
			    <footer class="app-auth-footer my-5">
				     <small class="copyright">&copy; 2023 RUSH RIDER
               </small>
			    </footer><!--//app-auth-footer-->	
		    </div><!--//flex-column-->   
	    </div><!--//auth-main-col-->
	    <div class="col-12 col-md-5 col-lg-6 h-100 auth-background-col">
		    <div class="auth-background-holder">			    
		    </div>
		    <div class="auth-background-mask"></div>
		    <div class="auth-background-overlay p-3 p-lg-5">
			    <div class="d-flex flex-column align-content-end h-100">
				    <div class="h-100"></div>
				    <div class="overlay-content p-3 p-lg-4 rounded">
					    <h5 class="mb-3 overlay-title">CREATE RUSH RIDER ACCOUNT</h5>
					    <div>Rush Rider is a cutting-edge delivery tracking platform that ensures swift, efficient, and reliable package deliveries. It offers real-time tracking, a team of expert riders, user-friendly technology, customized delivery solutions, and a strong commitment to reliability. Whether you're a business or an individual, Rush Rider accelerates your delivery experience, making waiting for packages a thing of the past.</div>
				    </div>
				</div>
		    </div><!--//auth-background-overlay-->
	    </div><!--//auth-background-col-->
    
    </div><!--//row-->


</body>
</html> 

