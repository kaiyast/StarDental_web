<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["action"]) == 0 )
	{ header( "Location: DocumentPage.php" );	 }
else
	{ $action = $_GET["action"]; }


if( $action != "del")
{
	
	//Get Post Ver

$date = $_POST['date'];
$HN = $_POST['patient'];

$date = ConvertTexttoDate($date);

if( $action == "add")
{
	if( isset($_GET['redirect']) == 0){ $redirect = "DocumentPage.php?suc=2";}
	else {$redirect = $_GET['redirect'].'.php?patient='.$HN.'&suc=1'; }
	
	$id = 1;
 
 	// check id and dublicate report
	$query = "SELECT * FROM medicrecord_tb ORDER BY id";
	$result = mysqli_query($conn,$query); 
				 while($row = mysqli_fetch_array($result)) 
				 {
					 if( $id == $row['id'])
					 {
					    $id++;
					 }
					 
				 }
			
				
	// Insert
	
	$query = "INSERT INTO medicrecord_tb (id, date, HN) 
	VALUES 
	('".$id."', '".$date."', '".$HN."')";
	
	echo $query ;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	 $fname = $id."-".$date.".jpg";
	 UploadandRenameImgFile("patient/".$HN."/medic_record",$fname,"medicrecord");
	 
	 
	 echo $redirect;
	header( "Location: ".$redirect.".php?suc=2" );	
	 
}else if( $action == "edit")
{
	$id = $_GET['medicrecord'];
	$fnameold = $_GET['srcname'];
	
	$query  = "UPDATE medicrecord_tb SET 
	HN = '".$HN."' , 
	date = '".$date."'  
	WHERE id = '".$id."' "; 
	
	echo $query;
	
	$fname = $id."-".$date.".jpg";
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}
		
	if($_FILES["fileToUpload"]["size"] != null)
	{
		
		UploadandRenameImgFile("patient/".$HN."/medic_record",$fname,"medicrecord");
	}
	else
	{
		$savepath = "patient/".$HN."/medic_record";
		rename($savepath."/".$fnameold."", $savepath."/".$fname.""); 
		
		
	}
	
	
	   header( "Location: MedicRecordDetail.php?medicrecord=".$id."&suc=3");	
}	
}
else 
{

$id = $_GET['medicrecord'];
$HN = $_GET['patient'];
	
	$query  = "DELETE FROM medicrecord_tb WHERE id = '".$id."'";
	$conn->query($query);
			

		if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		

	 
	 header( "Location: PatientDetail.php?suc=1&patient=".$HN );	
}



?>
