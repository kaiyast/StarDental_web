<?php


$servername = "localhost";
$username = "root";
$password = "";
$db_name = "dental_db";



/*
$servername = "localhost";
$username = "rstwork_test";
$password = "testtest";
$db_name = "rstwork_test";
*/

// Create connection
 
  $conn = new mysqli($servername, $username, $password ,$db_name);
mysqli_query($conn,"SET NAMES UTF8");

// Check connection
if ($conn->connect_error) {
    echo("Connection failed: " . $conn->connect_error);
} 
//echo "Connected successfully <br>";

  include('lib.php'); 

  ?>