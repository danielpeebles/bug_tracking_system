<?php

function get_todays_sql_date(){
	
// get todays date
$myDate_ = date('Y/m/d');
$myDate = "'" . $myDate_ . "'"; //for sql
return $myDate;

}


//-----------MAIN--------------------------
//-section dealing with posts and email----
//-----------------------------------------

ini_set('display_errors',1); 
error_reporting(E_ALL);
session_start();
if($_SESSION['user'] == ''){
	header('location: login.php');
}

date_default_timezone_set('America/New_York');
require_once('/var/www/intranet/bugs/includes/db_connect.php');
 $argument1 = $_GET['argument1']; //$argument1 is actually bug_id
 $mydate = get_todays_sql_date();
 $sql = "UPDATE bug_reports set closed_date = $mydate where bug_id = ".$argument1;
 echo "our SQL command looks like this: " . $sql . "<br>";
 mysqli_query($dbr, $sql) or die(mysqli_error($dbr));

 //redirect back to where we came from
 header("Location: load_issues.php");
 exit;

require_once('/var/www/intranet/bugs/includes/db_close.php');
//-----END OF MAIN---------------------------------------------------


?>