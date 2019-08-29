
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



	
</head>
<body>

<div class="container">
  <!-- right aligned log out button -->
	<div style="text-align: right; margin-top: 5px;">
	<a href="load_issues.php"  class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;View Issues</a> 
	<a href="index.php" class="btn btn-info"><i class="fa fa-bug"></i>&nbsp;&nbsp;Report new</a>
	<a href="logout.php" class="btn btn-info">Logout&nbsp;&nbsp;<i class="fa fa-share-square-o"></i></a>
	</div>
</div>

<br>

<div class="container">
	<div class="panel panel-default">
		<div class="panel-heading"><h3 class="panel-title">About The Website Bug Tracking System</h3>
		</div>
		<div class="panel-body">
			<div class="container-fluid">

				<pre>
To submit a new issue, please do the following:

1.	Indicate the priority*
	- P0: Urgent; is an urgent need that needs to be fixed ASAP as it pertains directly to real time business.
	- P1: Must fix; is not an emergency, but still important enough that it needs to be addressed quickly.
	- P2: Workflow Issue; is an issue that is annoying, but has a workable solution.
	- P3: Minor; is a minor issue that can wait until all the above are addressed.
	- P4: Enhancement; is an issue that really could be better and should be planned on implementing.
	*If you’re not sure, choose a higher priority, The IT Dept can always change it.
	
2.	Web Section.
	a.	Click the drop down list and select the area of the website that needs fixing, or select Other.
	
3.	Brief Description:
	a.	Describe the problem in one sentence.
	
4.	Detailed Description:
	a.	Describe in detail, what the problem is, and how to reproduce the problem.
	
5.	Click Submit.

				</pre>


			</div>
		</div>
	</div>
</div>	
  
  
  
  
  
  
  </body>
  </html>