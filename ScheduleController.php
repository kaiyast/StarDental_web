<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["action"]) == 0 )
	{ header( "Location: SchedulePage.php" );	 }
else
	{ $action = $_GET["action"]; }

if(isset($_GET["redirect"]) == 0 )
		{ $redirect = ""; 	 }
	else
		{ $redirect = $_GET["redirect"]; }

if( $action != "del")
{
	
	//Get Post Ver

$date = $_POST['date'];
$date = ConvertTexttoDate($date);

$start = $_POST['start'];
$end = $_POST['end'];
$detail = $_POST['detail'];
$patient = $_POST['patient'];


echo $date;

if( $action == "add")
{
	
	$id = 1;
 
 	// check id and dublicate report
	$query = "SELECT * FROM schedule_tb ORDER BY schedule_id";
	$result = mysqli_query($conn,$query); 
				 while($row = mysqli_fetch_array($result)) 
				 {
					 if( $id == $row['schedule_id'])
					 {
					    $id++;
					 }
					 
				 }
			
				
	// Insert
	
	$query = "INSERT INTO schedule_tb (schedule_id, date, start, end, detail, HN) 
	VALUES 
	('".$id."', '".$date."', '".$start."', '".$end."', '".$detail."'
	, '".$patient."')";
	
	echo $query ;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	

	if( $redirect == "" )
		{ $redirect = "SchedulePage.php?suc=2"; 	 }
	else
		{ $redirect = $redirect.".php?suc=2&patient=".$patient; }

	 header( "Location: ".$redirect."" );	
	 
}else if( $action == "edit")
{
	$schedule_id = $_GET['schedule'];
	
	$query  = "UPDATE schedule_tb SET 
	date = '".$date."' , 
	start = '".$start."' , 
	end = '".$end."' , 
	detail = '".$detail."' , 
	HN = '".$patient."' 
	WHERE schedule_id = '".$schedule_id."' "; 
	
	echo $query;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}
		
		
	if( $redirect == "" )
		{ $redirect = "SchedulePage.php?schedule=".$schedule_id."&suc=3"; 	 }
	else
		{ $redirect = $redirect.".php?suc=2&patient=".$patient; }
	
	
	
		 header( "Location: ".$redirect );	
}




}
else 
{

	$schedule_id = $_GET['schedule'];
	$patient = $_GET['patient'];
	
	$query  = "DELETE FROM schedule_tb WHERE schedule_id = '".$schedule_id."'";
	$conn->query($query);
			

			if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}

	if($redirect == ""  )
		{ $redirect = "SchedulePage.php?suc=1"; 	 }
	else
		{ $redirect = $redirect.".php?suc=1&patient=".$patient; }
	
		 header( "Location: ".$redirect."" );	
		 
}



?>
