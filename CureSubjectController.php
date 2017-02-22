<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["action"]) == 0 )
	{ header( "Location: CureSubjectPage.php" );	 }
else
	{ $action = $_GET["action"]; }


if( $action != "del")
{
	
	//Get Post Ver

$name = $_POST['name'];
$min = $_POST['min'];
$max = $_POST['max'];



if( $action == "add")
{
	
	$id = 1;
 
 	// check id and dublicate report
	$query = "SELECT * FROM curesubject_tb ORDER BY id";
	$result = mysqli_query($conn,$query); 
				 while($row = mysqli_fetch_array($result)) 
				 {
					 if( $id == $row['id'])
					 {
					    $id++;
					 }
					 
				 }
			
	
	

	
	// Insert
	
	$query = "INSERT INTO curesubject_tb (id, name , max, min ) 
	VALUES 
	('".$id."', '".$name."', '".$max."', '".$min."')";
	
	echo $query ;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	header( "Location: CureSubjectPage.php?suc=2" );	
	 
}else if( $action == "edit")
{
	$id = $_GET['curesubject'];

	$query  = "UPDATE curesubject_tb SET 
	name = '".$name."' , 
	max = '".$max."' , 
	min = '".$min."' 
	WHERE id = '".$id."' "; 
	
	echo $query;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}
		

			
		 header( "Location: CureSubjectDetail.php?curesubject=".$id."&suc=3" );	
}



}
else 
{

$id = $_GET['curesubject'];
	
	$query  = "DELETE FROM curesubject_tb WHERE id = '".$id."'";
	$conn->query($query);
			

			if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	// del in treathment
	$query  = "DELETE FROM curesubject_history_tb WHERE curesubject_id = '".$id."'";
	$conn->query($query);
			

			if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}	
	
	 DeleteFolder("medicsupply/".$id.""); 
	 header( "Location: CureSubjectPage.php?suc=1" );	
}



?>
