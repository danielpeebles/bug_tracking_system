<?php



function get_details($bug_id){
	global $dbr;
	$sql = "Select detailed_description from bug_reports where bug_id=".$bug_id;
	
	$result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
	if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
	//print_r($row);
	$details_html = nl2br($row['detailed_description'],true);
	return $details_html;
	}
	else{
		return "no details<br>";
	}
	
	
}


function get_brief($bug_id){
	global $dbr;
	$sql = "SELECT brief_description from bug_reports where bug_id=".$bug_id;
	
	$result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
	if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
	//print_r($row);
	$brief_html = nl2br($row['brief_description'],true);
	return $brief_html;
	}
	else{
		return "no brief description<br>";
	}
	
	
}




function get_notes($bug_id){
	global $dbr;
	$sql = "Select bug_note, created, reporter from bug_notes where bug_id=".$bug_id." order by created";
	
	$brief_html = "";
	$result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
	if (mysqli_num_rows($result) > 0) {
		$brief_html = '<table class="table table-striped table-bordered">';
		$brief_html .= '<thead>';
		$brief_html .= '<tr><th>Reporter</th><th>Created</th><th>Note</th></tr>';
		$brief_html .= '</thead>';
		$brief_html .= '<tbody>';
		while($row = mysqli_fetch_array($result, MYSQLI_ASSOC)){
		//print_r($row);
		
			$brief_html .= '<tr><td>'. $row['reporter'] . '</td><td>'.$row['created'] . "</td><td>".nl2br($row['bug_note'],true)."</td></tr>";
		}
		$brief_html .= '</tbody>';
		$brief_html .= '</table>';
		return $brief_html;
		
	}
	else{
		return " There are no notes for this bug.<br>";
	}
}

function get_link($bug_id){
	global $dbr;
	
	$sql = "SELECT file_upload1 from bug_reports where bug_id=".$bug_id;
	
	$result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
	if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
	//print_r($row);
	$file_html = nl2br($row['file_upload1'],true);
	$linkadink = "<a href=\"uploads/" .$file_html. "\">". $file_html. "</a>";
	
	return $linkadink;
	}
	else{
		return "no file uploaded<br>";
	}
	
}

function knows_mitch_anderson(){
	global $dbr;
	
	$suspectuser = $_SESSION['user'];
	$sql = "Select username from ASSIGNEE where username='$suspectuser '";
	$result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
	// print_r($result);
	if (mysqli_num_rows($result) > 0) {
		$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
		// print_r($row);
		return true;
	}
	else{
		return false;
	}
}


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
   
 


 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   
	
	<!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	
	<script>

function validate(){
		
		
	//	alert("you are in validate");
		
		$('#newnotes').parent().removeClass('has-error');
		var newnotes = $('#newnotes').val();
		var error = 0;
			
		if(newnotes.trim() == ''){
			error++;
			$('#newnotes').parent().addClass('has-error');			
		}
			
		if(error == 0){
			document.forms['new_entry'].submit();
		}
		
	}
	
	function cancel(){
		var r = confirm('Are you sure you want to cancel?');
		if(r == true){
			window.location.reload(true); 
		}		
	}
	
	function verify_close(){
		var r = confirm('Are you sure you want to close this issue as a resolved issue?');
		return r;	
	}
	
</script>


<style>
	body {background-color: #eeeeee;}
</style>

	
</head>
<body>
 
<?php
// MAIN---------------------------------------------------------------------
ini_set('display_errors',1); 
error_reporting(E_ALL);
require_once('/var/www/intranet/bugs/includes/db_connect.php');
	
	

session_start();
if($_SESSION['user'] == ''){
	header('location: login.php');
}
date_default_timezone_set('America/New_York');
?>
<?php
// echo "logged in: " . $_SESSION['user'];
?>

<div class="container" style="text-align: right;">

		<a href="load_issues.php"  class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;View Issues</a> 
		<a href="logout.php" class="btn btn-info">Logout&nbsp;&nbsp;<i class="fa fa-share-square-o"></i></a>

</div>
<br>
<div class="container">
<?php

   // database return here
	$argument1 = $_GET['argument1']; //$argument1 is actually bug_id
	$my_details = get_details($argument1);
	$my_brief = get_brief($argument1);
	$my_notes = get_notes($argument1);
	$my_link = get_link($argument1);
			

  ?>
  
  <div class="panel panel-default">
  <div class="panel-heading"><h3 class="panel-title">Bug Issue  <?php echo $argument1; ?></h3></div>
  <div class="panel-body">
  
  <!-- html -->
   <form action="add_notes.php" method="post" id="new_entry" name="new_entry">
		<div class="form-group">
			
			<input type="hidden" class="form-control" id="bug_id" name="bug_id" value="<?php echo $argument1 ?>">
		</div>
		
		<?php
		    echo '<p><label>Bug: </label> '.$my_brief.'</p>';
			echo '<p><label>Bug Description: </label><br>'.$my_details.'</p>';
			echo '<p><label>File upload: </label><br>'.$my_link.'</p>';
		?>
		
		
		<div class="form-group">
			<label for="newnotes">new notes:</label> 
			<textarea class="form-control" style="min-width: 100%" rows="20" id="newnotes" name="newnotes"></textarea>
		</div>
		
		<div class="form-group">
			 
			  <div align="center">
				<a href="javascript:void(0);" onclick="validate();" class="btn btn-primary"><i class="fa fa-check-circle"></i>&nbsp;&nbsp;Submit</a>
				<a href="javascript:void(0);" onclick="cancel();" class="btn btn-default"><i class="fa fa-times-circle"></i>&nbsp;&nbsp;Cancel</a>
				<?php if(knows_mitch_anderson()): ?>
				<a href="close.php?argument1=<?php echo $argument1;?>"  onclick="return verify_close();" class="btn btn-danger"><i class="fa fa-bug"></i>&nbsp;&nbsp;Close As Fixed</a>
				<?php endif; ?>
				
			  </div>
		</div>  
			
	</form>
 
  <hr>
  <!-- enough of the html  -->
  
  <?php
  
	echo "<h3>Notes</h3>" .$my_notes;
  
  ?>
  
  </div>
</div>	
  
  <?php
  echo "</div>"; // end container
  
require_once('/var/www/intranet/bugs/includes/db_close.php');
//-----END OF MAIN---------------------------------------------------

  ?>
  
  </body>
  </html>