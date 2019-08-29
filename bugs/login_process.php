<?php
session_start();
ini_set('display_errors',1); 
error_reporting(E_ALL);



$username = $_POST['username'];
$password = $_POST['password'];



$adServer = "ldap://fmca-pdc.fmca.com";
$response = 2099;

	
$ldap = ldap_connect($adServer);
$username = $_POST['username'];
$password = $_POST['password'];

$ldaprdn = 'fmca' . "\\" . $username;

ldap_set_option($ldap, LDAP_OPT_PROTOCOL_VERSION, 3);
ldap_set_option($ldap, LDAP_OPT_REFERRALS, 0);

$bind = @ldap_bind($ldap, $ldaprdn, $password);




if ($bind) {
	$filter="(sAMAccountName=$username)";
	$result = ldap_search($ldap,"dc=fmca,dc=com",$filter);
	
	ldap_sort($ldap,$result,"sn");
	$info = ldap_get_entries($ldap, $result);
	
	
	for ($i=0; $i < $info["count"]; $i++){
		if(count($info[$i]['memberof']) > 0){
			//print_r($info[$i]['memberof']);
			for($x = 0; $x < count($info[$i]['memberof']); $x++){
				
				if(strpos($info[$i]['memberof'][$x], 'IT Dept') > 0){
					$_SESSION['istech'] = 'Yes';
					
				}
			}
			
			
		}
	}
	
		
	$response = 1009;
	@ldap_close($ldap);
}

//exit(0);

switch($response){
	case 2099: // bad username
		header('location: login.php?action=2099');
	break;	
	case 1009: // valid login
		$_SESSION['user'] = $username; 
		header('location: index.php');
	break;
}




?>