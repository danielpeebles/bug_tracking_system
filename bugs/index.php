<?php
session_start();
if($_SESSION['user'] == ''){
	header('location: login.php');
}
date_default_timezone_set('America/New_York');

//echo "logged in: " . $_SESSION['user'];

?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>FMCA Website Bug Tracking</title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	
	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css?rand=<?php echo mt_rand(100000,999999); ?>" rel="stylesheet">	

<!-- <LINK REL=StyleSheet HREF="style1.css" TYPE="text/css"> -->

<style>
	body {background-color: #eeeeee;}
</style>



	
  </head><body>
 
  
  
  <div class="container">
  <!-- right aligned log out button -->
	<div style="text-align: right; margin-top: 5px;">
		<a href="help.php"  class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;Help</a> 
		<a href="load_issues.php"  class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;View Issues</a> 
		<a href="logout.php" class="btn btn-info">Logout&nbsp;&nbsp;<i class="fa fa-share-square-o"></i></a>
	</div>
<br>
	<div class="panel panel-default">
    <div class="panel-heading">
    <h3 class="panel-title">FMCA Website Bug Tracking</h3>
  </div>
  <div class="panel-body">

    <p>Please indicate the priority of this issue:</p>

	 
	 
	 
	 <form action="submit.php" method="post" id="new_entry" name="new_entry" enctype="multipart/form-data">
	 
	 
	 
	 

     <label for="Priority"  data-toggle="tooltip" data-placement="right" title="p0 is a critical business need! <br />
p1 is not a 911 but needs fixed <br />
p2 has a workaround, but still needs fixed <br />
p3 is a minor issue <br />
p4 is an enhancement request" class="my_tooltip">Priority:</label>
   
	 <select name="Priority" class="form-control" id="Priority">
		<option value="p0">P0: URGENT!</option>
		<option value="p1">P1: MUST FIX!</option>
		<option value="p2">P2: Work Flow issue</option>
		<option value="p3">P3: Minor issue</option>
		<option value="p4">P4: Enhancement</option>
		
    </select> 
    

  
  
  <br>

   <label for="WebSection">Web Section:</label>
   
   <select name="WebSection" id="WebSection" class="form-control">
		<option value=0>Home</option>
		<option value=1>Presidents Blog</option>
		<option value=2>Motor Homing / Education</option>
		<option value=3>Benefits</option>
		<option value=4>Magazine</option>
		<option value=5>Forums/Blogs</option>
		<option value=6>Conventions</option>
		<option value=7>Chapters</option>
		<option value=8>Membership</option>
		<option value=14>My Membership Profile</option>
		<option value=9>Join</option>
		<option value=10>Contact</option>
		<option value=11>Events Calendar</option>
		<option value=12>FMC University</option>
		<option value=13>Other</option>
		
		
    </select> 
   
  
  
  <br>
  
   <div class="form-group">
		<label for="briefDescription">Brief Description:</label><br>
		<textarea class="form-control" style="min-width: 100%"  rows="1" id="briefDescription" name="briefDescription"></textarea>
	</div>
	
	<br>
	
  <div class="form-group">
	<label for="detailDescription">Detailed Description:</label><br>
	<textarea class="form-control" style="min-width: 100%" rows="20" id="detailDescription" name="detailDescription"></textarea>
  </div>

<div class="form-group">
	<label for="fileToUpload">supporting file attachment (optional):</label><br>
	<input type="file" name="fileToUpload" id="fileToUpload">
</div>
  
  
 <!--  Button (Double) -->
			<div class="form-group">
			  <label class="col-md-4 control-label" for=""></label>
			  <div class="col-md-8">
				<a href="javascript:void(0);" onclick="validate();" class="btn btn-primary"><i class="fa fa-check-circle"></i>&nbsp;&nbsp;Submit</a>
				<a href="javascript:void(0);" onclick="cancel();" class="btn btn-default"><i class="fa fa-times-circle"></i>&nbsp;&nbsp;Cancel</a>
				
			  </div><br><br>
			</div>  
  
   </form>
  </div>
</div>
</div> <!-- for the 2 containers -->

	
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<script>
$(document).ready(function(){
     $('[data-toggle="tooltip"]').tooltip();
});

$('.my_tooltip').tooltip({html: true})

function validate(){
		
		
	//	alert("you are in validate");
		
		$('#briefDescription').parent().removeClass('has-error');
		$('#detailDescription').parent().removeClass('has-error');
	
		
		
		var briefDescription = $('#briefDescription').val();
		var detailDescription = $('#detailDescription').val();
		
		
		var error = 0;
		
		
	
			
		
		if(detailDescription.trim() == ''){
			error++;
			$('#detailDescription').parent().addClass('has-error');			
		}
		
	
		
		
		if(briefDescription.trim() == ''){
			error++;
			$('#briefDescription').parent().addClass('has-error');			
		}
		

		
		if(error == 0){
			document.forms['new_entry'].submit();
		}
		
		
	}
	
	function cancel(){
		var r = confirm('Are you sure you want to cancel?');
		if(r == true){
			location.href = 'index.php';
		}		
	}
	
	

</script>


	
	
	</div>
  </body>
</html>

