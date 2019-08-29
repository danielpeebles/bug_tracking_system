<?php
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

// who's logged in making the request
// $new_notes =  $_POST["newnotes"]; 
$new_notes  = mysqli_real_escape_string($dbr, $_POST['newnotes']);
$notes_html = nl2br($new_notes,true);
// $created_date = get_todays_sql_date();   
$argument1 = $_POST["bug_id"]; //$argument1 is actually bug_id
// $argument1 = mysqli_real_escape_string($dbr,$_GET['argument1']);
// echo $argument1;
$whoIAm = mysqli_real_escape_string($dbr,$_SESSION['user']); 

 $sql = "INSERT INTO bug_notes (bug_id, bug_note, created, reporter ) VALUES ($argument1,'$notes_html', now() , '$whoIAm' ) ";
 echo "our SQL command looks like this: " . $sql . "<br>";
 mysqli_query($dbr, $sql) or die(mysqli_error($dbr));

 //redirect back to where we came from
  header("Location: details.php?argument1=".$argument1);
   exit;

require_once('/var/www/intranet/bugs/includes/db_close.php');
//-----END OF MAIN---------------------------------------------------
?>