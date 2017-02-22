<?php
session_start();
include('config.php'); 



$username = $_POST['username'];
$password = $_POST['password'];

$checkinputsuccess = 0;
$employee_id = 0;
$employee_status = "admin";

$_SESSION["employee_id"] = $employee_id;
$_SESSION["employee_status"] = $employee_status;
					
		$query  = "SELECT * FROM employee_tb WHERE username = '".$username."' AND password = '".$password."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
				if($username != "nodata" && $password != "nodata" && $username != "" && $password != "")	
				{
					$checkinputsuccess = 1;
					$employee_id = $row['id'];
					$employee_status = $row['status'];
					
					$_SESSION["employee_id"] = $employee_id;
					$_SESSION["employee_status"] = $employee_status;
					$_SESSION["checklogin"] = 1;					
				}

			}
			
		if($username == "admin" && $password == "admin" )	
		{
			    $checkinputsuccess = 1;
				$_SESSION["checklogin"] = 1;
		}
	

		
		if($checkinputsuccess == 1){header( "Location: Home.php" );	}
		else {header( "Location: index.php" );	}
		
?>