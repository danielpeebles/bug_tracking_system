<?php

// documentation on this functionality:
// I assume it is possible that  you need a token instead of using my token: 
// see this: https://gist.github.com/nadar/68a347d2d1de586e4393
// which references this which you need to get a token: https://api.slack.com/custom-integrations/legacy-tokens
// so, the only thing in this function I had to change was the token, and I removed the words 'public static'
// curl is a popular program for throwing slack notifications, and php conveniently has curl functions anyhow: http://php.net/manual/en/ref.curl.php
function slack($message, $channel){
    $ch = curl_init("https://slack.com/api/chat.postMessage");
    $data = http_build_query([
        "token" => "xoxp-45876546400-225744315329-247197220978-d32e50e159fd2c9757fcecedfb7674c1",
    	"channel" => $channel, //"#mychannel",
    	"text" => $message, //"Hello, Foo-Bar channel message.",
    	"username" => "Web Issues Tracker",
    ]);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $result = curl_exec($ch);
    curl_close($ch);
    
    return $result;
}
// SO ENDS THE COOL SLACK PORTION OF THIS PHP PROGRAM




function get_todays_sql_date(){
	
// get todays date
$myDate_ = date('Y/m/d');
$myDate = "'" . $myDate_ . "'"; //for sql
return $myDate;

}




function get_assignee($webSection){

 global $dbr;
 
 $row = "";
 $sql = "SELECT owner FROM WebAreas WHERE `section id`='". $webSection."'";
 // echo  $sql;
 $result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
 if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
 }
 
 return $row['owner'];
 
} 



function get_web_area($webSection){

 global $dbr;
 
 $row = "";
 $sql = "SELECT WebArea FROM WebAreas WHERE `section id`='". $webSection."'";
 // echo  $sql;
 $result = mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
 if (mysqli_num_rows($result) > 0) {
	$row = mysqli_fetch_assoc($result);
 }
 
 return $row['WebArea'];
 
} 


//-----------MAIN--------------------------
//-section dealing with posts and email----
//-----------------------------------------

ini_set('display_errors',1); 
error_reporting(E_ALL);

require_once('/var/www/intranet/bugs/includes/db_connect.php');


session_start();
if($_SESSION['user'] == ''){
	header('location: login.php');
}
date_default_timezone_set('America/New_York');

// echo "logged in: " . $_SESSION['user'];


$whobrokeit = $_SESSION['user'];
$headers = "MIME-Version: 1.0" . "\r\n";
$headers .= "Content-Type: text/html; charset=ISO-8859-1" . "\r\n";
$headers .= "From: " . $whobrokeit . "@fmca.com \r\n";
$headers .= "Cc: " . $whobrokeit . "@fmca.com\r\n";
// who's logged in making the request
$priority =  $_POST["Priority"];
$webSection = $_POST["WebSection"];

$email_subject = $_POST["briefDescription"];
$email_body = "<p>Priority level: " . $priority . "</p>";
$email_body .= "<p>Web Section: " . $webSection . "</p>";

$email_body .= "<p>Detailed description from report is below:</p><hr>";
$brief = $_POST["briefDescription"];
// $email_body .= $_POST["detailDescription"];
// $details = mysqli_real_escape_string($dbr, $_POST['detailDescription']);
 $details = $_POST['detailDescription'];
 $details_html = nl2br($details,true);
 $email_body .= $details_html;
 
 

try{
	if(mail('itdept@fmca.com',$email_subject,$email_body,$headers)){ //itdept
		// echo 'mail sent' ."<BR>";
	}	
	else{
		echo 'failed to send the email' ."<BR>";
	}
}
catch(Exception $e){
	print_r($e);
	
}
// done with email here---------------------------------------------
slack("web issue submitted: \nPrioity: " . $priority. " Section:" . $webSection . "\nbrief description: \n" . $brief . "\n\ndetails: \n" .$details,"#it-department"); //#it-department
// done with slack here---------------------------------------------

// start with data storage of bug reports here----------------------



$priority = mysqli_real_escape_string($dbr, $_POST['Priority']);
$webSection = mysqli_real_escape_string($dbr, $_POST['WebSection']);  
$specSection = ""; // $specSection = get_spec(); TODO:IMPLEMENT SPECS
$reported_by = mysqli_real_escape_string($dbr, $_SESSION['user']);    // should be ok
$assgigned_to = mysqli_real_escape_string($dbr, get_assignee($webSection)); // should be ok
// $assgigned_to = "dpeebles";
$created_date = get_todays_sql_date();     // should be ok
// $closed_date = null;
$brief_desc = mysqli_real_escape_string($dbr, $_POST['briefDescription']); // should be ok
$detailed_desc = mysqli_real_escape_string($dbr, $_POST['detailDescription']); // should be ok
// $developer_diary = null;
$webArea = get_web_area($webSection);

// echo "our SQL command looks like this: " . $sql . "<br>";

// all code to handle file upload stuff ------------------------------------------------------------

$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if image file is a actual image or fake image
if(isset($_POST["fileToUpload"])) {
    $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        echo "File is an image - " . $check["mime"] . ".";
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
}
// Check if file already exists
if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}
// Check file size
if ($_FILES["fileToUpload"]["size"] > 500000) {
    echo "Sorry, your file is too large.";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
&& $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
        echo "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}



if(basename($_FILES["fileToUpload"]["name"])){
$upload_filename = basename($_FILES["fileToUpload"]["name"]);
}else{
	$upload_filename = null;
}

	
// end code for file upload stuff ------------------------------------------------------------

$sql = "INSERT INTO bug_reports (priority, web_area, specific_area , reported_by, assigned_to , created_date , brief_description, detailed_description, file_upload1 ) VALUES ('$priority','$webArea','$specSection','$reported_by','$assgigned_to', $created_date  , '$brief_desc', '$detailed_desc', '$upload_filename') ";


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
<div style="text-align: right; margin-top: 5px;">
		<a href="load_issues.php"  class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;View Issues</a> 
		<a href="logout.php" class="btn btn-info">Logout&nbsp;&nbsp;<i class="fa fa-share-square-o"></i></a>
	</div>
	 <br>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">FMCA Website Bug Tracking</h3>
		</div>
		<div class="panel-body">
			<h4>Your issue has been submitted</h4>
		</div>
		<div class="panel-body">
			
			<a href="index.php" class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;Report New Issue</a>
		</div>
	</div>
</div>
  <?php
mysqli_query($dbr, $sql) or die(mysqli_error($dbr));
require_once('/var/www/intranet/bugs/includes/db_close.php');
//-----END OF MAIN---------------------------------------------------
?>
</body>
</html>