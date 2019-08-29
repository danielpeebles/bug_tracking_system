<?php
function debug_info($row){
	print_r($row);
	echo "<br><br>";
}


function load_all(){
	global $dbr;
	$sql = "SELECT * FROM bug_reports where closed_date = '0000-00-00'";
	$result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
	// print_r($result);
	// echo "<div class="container">";
	echo "<table class=\"table table-hover\" class=\"table table-striped\"  class=\"table table-bordered\" >";
	echo "<thead>";
	echo "<tr><th>Priority</th><th>Area</th><th>User</th><th>assigned</th><th>created</th><th>Brief description</th><th>Details+Notes</th></tr>";
	echo "</thead><tbody>";
	// if (mysqli_num_rows($result) > 0) {
	while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
	// debug_info($row);
		$mybugid = $row['bug_id'];
		echo "<tr><td>". $row['priority'] . "</td><td>" .$row['web_area']."</td><td>".$row['reported_by']."</td><td>".$row['assigned_to']."</td><td>"
 .$row['created_date']."</td><td>".$row['brief_description']."</td><td><a href=\"details.php?argument1=$mybugid\" class=\"btn btn-info btn-xs\">View Detail</a></td></tr>";
 	}// end of while
	echo "</tbody></table>";
 //}
}// end of load_all()-----------------------------


function load_all_closed(){
	global $dbr;
	$sql = "SELECT * FROM bug_reports where closed_date <> '0000-00-00'";
	$result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
	// print_r($result);
	// echo "<div class=\"container\">";
	echo "<table class=\"table table-hover\" class=\"table table-striped\"  class=\"table table-bordered\" >";
	echo "<thead>";
	echo "<tr><th>Priority</th><th>Area</th><th>User</th><th>assigned</th><th>created</th><th>Brief description</th><th>Details+Notes</th></tr>";
	echo "</thead><tbody>";
	// if (mysqli_num_rows($result) > 0) {
	while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
	// debug_info($row);
		$mybugid = $row['bug_id'];
		echo "<tr><td>". $row['priority'] . "</td><td>" .$row['web_area']."</td><td>".$row['reported_by']."</td><td>".$row['assigned_to']."</td><td>"
 .$row['created_date']."</td><td>".$row['brief_description']."</td><td><a href=\"details.php?argument1=$mybugid\" class=\"btn btn-info btn-xs\">View Detail</a></td></tr>";
 	}// end of while
	echo "</tbody></table>";
 //}
}// end of load_all_closed()-----------------------------
?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>FMCA Website Bug Tracking</title>

   
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
	
	
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
	
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css?rand=<?php echo mt_rand(100000,999999); ?>" rel="stylesheet">	

 <!-- <LINK REL=StyleSheet HREF="style1.css" TYPE="text/css"> -->

 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<style>
	body {background-color: #eeeeee;}
</style>

	
  </head>
  
  
  
<?php
// main -------------------
ini_set('display_errors',1); 
error_reporting(E_ALL);


session_start();
if($_SESSION['user'] == ''){
	header('location: login.php');
}
date_default_timezone_set('America/New_York');

//echo "logged in: " . $_SESSION['user'];


require_once('/var/www/intranet/bugs/includes/db_connect.php');
 echo "<body>";
 ?>
 
 <div class="container">
  <!-- right aligned log out button -->
	<div style="text-align: right; margin-top: 5px;">
	<a href="index.php" class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;Report new</a>
		<a href="logout.php" class="btn btn-info">Logout&nbsp;&nbsp;<i class="fa fa-share-square-o"></i></a>
	</div>
</div>
<br>
 <div class="container">
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title">All issues not closed</h3>
		</div>
		<div class="panel-body">
			<div class="container-fluid">
				<div class="col-lg-1"><span></span></div>
				<div class=\"col-lg-10\" align=\"center\" >	
					<?php load_all(); // put this behind button/menu ?>
				</div> <!-- end 10 columns -->
				<div class="col-lg-1"><span></span></div>
			</div> <!-- end container inside panel -->
			<div class="row" align="center"> 
				<br><br>
			</div>
		</div> <!-- end panel body -->
	</div> 	<!-- end panel panel-default -->
</div> <!-- end container -->
</body>
</html>
	<?php
require_once('/var/www/intranet/bugs/includes/db_close.php');
// end main

?>