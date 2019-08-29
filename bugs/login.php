<?php
session_start();


?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>FMCA.com Website Bugs Login</title>

    <!-- Bootstrap -->
   <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
	<style>
		body {background-color: #C9C9C9;}
		#content{margin-left: auto; margin-right: auto; width: 90%; max-width: 400px; margin-top: 30px;}
		.error {color: red; font-weight: bold;}
	</style>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="//oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
	
	
	<div class="container" id="content">
	<?php
	if((!empty($_REQUEST)) && ($_REQUEST['action'] == 2097)){
		
			echo '<br><div class="alert alert-danger" role="alert">Your account has been locked out.</div>';
		
	}
	else{
	?>
	<div class="panel panel-default">

	<div class="panel-body">
						
	<center><h3>FMCA Website Bug Tracking</h3></center>
	<form class="form-horizontal" action="login_process.php" method="post" name="abd_login" onsubmit="return true;">
		<fieldset>

		<!-- Form Name -->
		
		<center><span style="font-size: 12px; margin-top: 0px; margin-bottom: 10px; margin-left: auto; margin-right: auto;">Enter your username and password below.</span></center><br>
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="username">Username</label>  
		  <div class="col-md-6">
		  <input id="username" name="username" placeholder="" required="" class="form-control input-md" type="text">
			<?php
				if(!empty($_REQUEST)){
					if($_REQUEST['action'] == 2099){
					 echo '<div id="user_name_error" class="error">Username is invalid.</div>';
					}
				}
			?>
		  </div>
		</div>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="password">Password</label>  
		  <div class="col-md-6">
		  <input id="password" name="password" placeholder="" required="" class="form-control input-md" type="password">
			<?php
				if(!empty($_REQUEST)){
					if($_REQUEST['action'] == 2098){
					 echo '<div id="password_error" class="error">Password is invalid.</div>';
					}
				}
			?>
		  </div>
		</div>

		

		</fieldset>
		
	
	</div>
		<div class="panel-footer">
		<fieldset>
			<div class="form-group">
			  
			  <div class="col-md-12">
				<center>
				<button id="button1id" name="button1id" class="btn btn-primary">Login</button>
				<a href="index.php" class="btn btn-default">Cancel</a>
				</center>
			  </div>
			</div>
		</fieldset>	
		</div>
		</form>
	
	</div>
	<?php
	}
	?>
</div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous">
  </body>
</html>