<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["action"]) == 0 )
	{ header( "Location: CureSubjectPage.php" );	 }
else
	{ $action = $_GET["action"]; }

echo $action ;




if( $action == "add")
{
	
	$id = GenIDinTable($conn,"treatment_history_tb");
			
	// Insert
	$date = GetNowDate();
	
	$query = "INSERT INTO treatment_history_tb (id , date ,employee_id , patient_id ) 
	VALUES 
	('".$id."','".$date."', 0 , 0 )";
	
	echo $query ;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	header( "Location: TreatmentHistoryDetail.php?treatment_history=".$id );	
	 
} 
else if( $action == "adddaily")
{
	$patient_id = $_GET['patient'];
	$id = GenIDinTable($conn,"treatment_history_tb");
			
	// Insert
	
	$query = "INSERT INTO treatment_history_tb (id , employee_id , patient_id ) 
	VALUES 
	('".$id."', 0 , '".$patient_id."' )";
	

	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	echo $query;
	header( "Location: TreatmentHistoryDetail.php?treatment_history=".$id );	
	 
}
else if($action == "del")
{
	$id = $_GET['treatment_history'];
		
		$query  = "DELETE FROM treatment_history_tb WHERE id = '".$id."'";
		$conn->query($query);
				

				if ($conn->query($query) === TRUE) {
				echo "Record updated successfully";
			} else {
				echo "Error updating record: " . $conn->error;
			}
		
		// del in treathment
		$query  = "DELETE FROM curesubject_history_tb WHERE treatment_history_id = '".$id."'";
		$conn->query($query);
				

				if ($conn->query($query) === TRUE) {
				echo "Record updated successfully";
			} else {
				echo "Error updating record: " . $conn->error;
			}

		// del in treathment
		$query  = "DELETE FROM medicsupply_history_tb WHERE treatment_history_id = '".$id."'";
		$conn->query($query);
				

				if ($conn->query($query) === TRUE) {
				echo "Record updated successfully";
			} else {
				echo "Error updating record: " . $conn->error;
			}		
		
		
		 header( "Location: TreatmentHistoryPage.php?suc=1" );
	 
}
else if($action == "changepatient")
{
	$id = $_GET['treatment_history'];
	$patient_id = $_GET['searchoutput'];
	
	
	$query  = "UPDATE treatment_history_tb SET patient_id = '".$patient_id."'
	WHERE id = '".$id."' "; 
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	
	 header( "Location: TreatmentHistoryDetail.php?treatment_history=".$id );
}

else if($action == "changeemployee")
{
	$id = $_GET['treatment_history'];
	$employee_id = $_GET['searchoutput'];
	
	
	$query  = "UPDATE treatment_history_tb SET employee_id = '".$employee_id."'
	WHERE id = '".$id."' "; 
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	
	 header( "Location: TreatmentHistoryDetail.php?treatment_history=".$id );
}

else if($action == "addcuresubject")
{
	$treatment_history_id = $_GET['treatment_history'];
	$curesubject_id = $_GET['searchoutput'];
	
	//gen id
	$id = GenIDinTable($conn,"curesubject_history_tb");
				
	$query = "INSERT INTO curesubject_history_tb (id, treatment_history_id , curesubject_id) 
	VALUES 
	('".$id."', '".$treatment_history_id."', '".$curesubject_id."')";
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	
	 header( "Location: TreatmentHistoryDetail.php?treatment_history=".$treatment_history_id );
}

else if($action == "delcuresubject")
{
	$treatment_history_id = $_GET['treatment_history'];
	$curesubject_id = $_GET['curesubject'];
				
	$query  = "DELETE FROM curesubject_history_tb WHERE curesubject_id = '".$curesubject_id."' AND treatment_history_id LIKE '".$treatment_history_id."' ";
	$conn->query($query);
	
	 header( "Location: TreatmentHistoryDetail.php?treatment_history=".$treatment_history_id );
}

else if($action == "addmedicsupply")
{
	$treatment_history_id = $_GET['treatment_history'];
	$medicsupply_id = $_GET['searchoutput'];
	$amount = 0;
	//gen id
	$id = GenIDinTable($conn,"medicsupply_history_tb");
				
	$query = "INSERT INTO medicsupply_history_tb (id, treatment_history_id , medicsupply_id , amount) 
	VALUES 
	('".$id."', '".$treatment_history_id."', '".$medicsupply_id."' , '".$amount."' )";
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	
	 header( "Location: TreatmentHistoryDetail.php?treatment_history=".$treatment_history_id );
}

else if($action == "delmedicsupply")
{
	$treatment_history_id = $_GET['treatment_history'];
	$medicsupply_id = $_GET['medicsupply'];
	$medicsupply_value= $_GET['medicsupply_value'];
	
				
	$query  = "DELETE FROM medicsupply_history_tb WHERE medicsupply_id = '".$medicsupply_id."' AND treatment_history_id LIKE '".$treatment_history_id."'";
		$conn->query($query);
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	// Check with medicsupply_tb ---------------------------------------------
	$old_value = 0;
			$query  = "SELECT * FROM medicsupply_tb WHERE id = '".$medicsupply_id."' "; 
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
				$old_value = $row['amount'];
			}
	$new_value = $old_value + $medicsupply_value;
	
	$query  = "UPDATE medicsupply_tb SET 
	amount = '".$new_value."' 
	WHERE id = '".$medicsupply_id."' "; 
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	//----------------------------------------------------------------------------------------------------------
	
	echo $query;
	 header( "Location: TreatmentHistoryDetail.php?treatment_history=".$treatment_history_id );
}
else if($action == "addmedic")
{
	$treatment_history_id = $_GET['treatment_history'];
	$medicsupply_id = $_GET['medicsupply'];
	$medicsupply_newvalue = $_GET['value'];
	$medicsupply_oldvalue = $_GET['oldvalue'];
	
	$medicsupply_value = $medicsupply_newvalue - $medicsupply_oldvalue;
	// Check with medicsupply_tb ---------------------------------------------
	$old_value = 0;
			$query  = "SELECT * FROM medicsupply_tb WHERE id = '".$medicsupply_id."' "; 
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
				$old_value = $row['amount'];
			}
	$new_value = $old_value - $medicsupply_value;
	
	$query  = "UPDATE medicsupply_tb SET 
	amount = '".$new_value."' 
	WHERE id = '".$medicsupply_id."' "; 
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	//----------------------------------------------------------------------------------------------------------
	
	$query  = "UPDATE medicsupply_history_tb SET 
	amount = '".$medicsupply_newvalue."' 
	WHERE treatment_history_id = '".$treatment_history_id."' AND medicsupply_id = '".$medicsupply_id."' "; 
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	echo $medicsupply_value." ".$new_value;
	header( "Location: TreatmentHistoryDetail.php?treatment_history=".$treatment_history_id."");
}
else if($action == "editdate")
{
	$id = $_GET['treatment_history'];
	$date = ConvertTexttoDate($_GET['date']);
	
	$query  = "UPDATE treatment_history_tb SET 
	date = '".$date."' 
	WHERE id = '".$id."' "; 
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	header( "Location: TreatmentHistoryDetail.php?treatment_history=".$id."");
}
else
{	
	//Get Post Ver

$payment = $_POST['payment'];
$employee_earn = $_POST['employee_earn'];

if( $action == "edit")
{
	$id = $_GET['treatment_history'];

	$query  = "UPDATE treatment_history_tb SET 
	payment = '".$payment."' , 
	employee_earn = '".$employee_earn."'  
	WHERE id = '".$id."' "; 
	
	echo $query;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}
		

			
		 header( "Location: TreatmentHistoryDetail.php?treatment_history=".$id."&suc=3" );	
}



}




?>
