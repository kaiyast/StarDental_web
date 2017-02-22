<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["action"]) == 0 )
	{ header( "Location: EmployeePage.php" );	 }
else
	{ $action = $_GET["action"]; }


if( $action != "del")
{
	
	//Get Post Ver

$name = $_POST['name'];
$lastname = $_POST['lastname'];
$phone = $_POST['phone'];
$address = $_POST['address'];
$ssn = $_POST['ssn'];
$status = $_POST['status'];
$salary = $_POST['salary'];
$email = $_POST['email'];
$username = $_POST['username'];
$password = $_POST['password'];

	// checkbox open username password systemaccount
	 
	$systemaccount = $_POST['systemaccount'];
	  $newsystemaccount = "";
	  foreach($systemaccount as $systemaccount_val) {
		  
		  $newsystemaccount .= $systemaccount_val.",";
	  }
	  
	$allowaccount = $_POST['allowaccount'];
	if($allowaccount != "true")
	{
		$username = "nodata";
		$password = "nodata";
		$newsystemaccount = "";
	}


  
if( $action == "add")
{
	
	$id = 1;
 
 	// check id and dublicate report
	$query = "SELECT * FROM employee_tb ORDER BY id";
	$result = mysqli_query($conn,$query); 
				 while($row = mysqli_fetch_array($result)) 
				 {
					 if( $id == $row['id'])
					 {
					    $id++;
					 }
					 
				 }
			
	
	

	
	// Insert
	
	$query = "INSERT INTO employee_tb (id, name , lastname, phone , address , ssn , status , salary , email , username , password , systemaccount) 
	VALUES 
	('".$id."', '".$name."', '".$lastname."', '".$phone."','".$address."', '".$ssn."', '".$status."', '".$salary."','".$email."', '".$username."','".$password."','".$newsystemaccount."')";
	
	echo $query ;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	
     mkdir("employee/".$id."");	
	 UploadandRenameImgFile('employee/'.$id.'',"useravata.jpg","employee");
	
	header( "Location: EmployeePage.php?suc=2" );	
	 
}else if( $action == "edit")
{
	$id = $_GET['employee'];

	$query  = "UPDATE employee_tb SET 
	name = '".$name."' , 
	lastname = '".$lastname."' , 
	phone = '".$phone."' , 
	email = '".$email."' , 
	address = '".$address."' , 
	ssn = '".$ssn."' , 
	status = '".$status."' , 
	salary = '".$salary."' ,
	username = '".$username."' , 
	password = '".$username."' , 
	systemaccount = '".$newsystemaccount."' 
	WHERE id = '".$id."' "; 
	
	echo $query;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}
		
	if($_FILES["fileToUpload"]["size"] != null)
	{
		UploadandRenameImgFile('employee/'.$id.'',"useravata.jpg","employee");
	}
			
		 header( "Location: EmployeeDetail.php?employee=".$id."&suc=3" );	
}



}
else 
{

$id = $_GET['employee'];
	
	$query  = "DELETE FROM employee_tb WHERE id = '".$id."'";
	$conn->query($query);
			

			if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	
	 DeleteFolder("employee/".$id.""); 
	 header( "Location: EmployeePage.php?suc=1" );	
}



?>
