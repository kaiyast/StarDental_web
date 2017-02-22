<?php
session_start();
include('config.php'); 


			
		$_SESSION["employee_id"] = 0;
		$_SESSION["employee_status"] = "admin";
		$_SESSION["checklogin"] = 0;
		
		session_unset();
		session_destroy();

		header( "Location: index.php" );	
?>