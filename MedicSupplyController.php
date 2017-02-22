<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["action"]) == 0 )
	{ header( "Location: MedicSupplyPage.php" );	 }
else
	{ $action = $_GET["action"]; }


if( $action != "del" && $action != "addsub")
{
	
	//Get Post Ver

$name = $_POST['name'];
$detail = $_POST['detail'];
$amount = $_POST['amount'];
$sh_amount = $_POST['sh_amount'];
$unit = $_POST['unit'];
$redate = date("Y-m-d");


if( $action == "add")
{
	
	$id = 1;
 
 	// check id and dublicate report
	$query = "SELECT * FROM medicsupply_tb ORDER BY id";
	$result = mysqli_query($conn,$query); 
				 while($row = mysqli_fetch_array($result)) 
				 {
					 if( $id == $row['id'])
					 {
					    $id++;
					 }
					 
				 }
			
	
	

	
	// Insert
	
	$query = "INSERT INTO medicsupply_tb (id, name, detail, amount, sh_amount
	, unit, redate ) 
	VALUES 
	('".$id."', '".$name."', '".$detail."', '".$amount."', '".$sh_amount."'
	, '".$unit."', '".$redate."')";
	
	echo $query ;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
		 mkdir("medicsupply/".$id."");	
		 UploadandRenameImgFile('medicsupply/'.$id.'',"supply.jpg","medicsupply");
	
	
	 
	 
	header( "Location: MedicSupplyPage.php?suc=2" );	
	 
}else if( $action == "edit")
{
	$id = $_GET['medicsupply'];

	$query  = "UPDATE medicsupply_tb SET 
	name = '".$name."' , 
	detail = '".$detail."' , 
	sh_amount = '".$sh_amount."' , 
	unit = '".$unit."' , 
	redate = '".$redate."'
	WHERE id = '".$id."' "; 
	
	echo $query;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}
		
	if($_FILES["fileToUpload"]["size"] != null)
	{
		UploadandRenameImgFile('medicsupply/'.$id.'',"supply.jpg","medicsupply");
	}
	
			
		 header( "Location: MedicSupplyDetail.php?medicsupply=".$id."&suc=3" );	
}



}
else if( $action == "del")
{

$id = $_GET['medicsupply'];
	
	$query  = "DELETE FROM medicsupply_tb WHERE id = '".$id."'";
	$conn->query($query);
			

			if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	// del in treathment
		
	$query  = "DELETE FROM medicsupply_history_tb WHERE medicsupply_id = '".$id."'";
	$conn->query($query);
			

			if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	// edit in history
	$query  = "UPDATE medicsupply_record_tb SET 
	medicsupply_id = '-1' 
	WHERE medicsupply_id = '".$id."' "; 
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	 DeleteFolder("medicsupply/".$id.""); 
	 header( "Location: MedicSupplyPage.php?suc=1" );	
}
else if( $action == "addsub")
{

	$medicsupply_id = $_GET['medicsupply'];
	$employee_id = $_SESSION["employee_id"];
	
	$func = $_GET['func'];
	$num = $_GET['num'];
	$today = date("Y-m-d"); 
	$input_amount = $_GET["amount"];
	
	$medicsuppyDetail = GetMedicSupplyFromID($conn,$medicsupply_id);
	
	$amount_now = $medicsuppyDetail['amount'];
	if($func == "add"){$amount_now += $num;}
	else if($func == "sub"){$amount_now -= $num; $num *= -1;} 
	
	// edit medicrecord +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	$query  = "UPDATE medicsupply_tb SET 
	amount = '".$amount_now."'  
	WHERE id = '".$medicsupply_id."' "; 
		
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}

	if( $num != 0)
	{
		
			// add record +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
			$query = "INSERT INTO medicsupply_record_tb ( medicsupply_id, employee_id, date, amount) 
			VALUES 
			('".$medicsupply_id."', '".$employee_id."', '".$today."', '".$num."')";
			
			
			if ($conn->query($query) === TRUE) {
					echo "Record updated successfully";
				} else {
					echo "Error updating record: " . $conn->error;
				}
		
	}

		echo $query ;
	   header( "Location: MedicSupplyPage.php?suc=2" );	
}


?>
