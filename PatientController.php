<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["action"]) == 0 )
	{ header( "Location: PatientPage.php" );	 }
else
	{ $action = $_GET["action"]; }


if( $action != "del")
{
	
	//Get Post Ver

$SSN = $_POST['SSN'];
$title = $_POST['title'];
$gender = $_POST['gender'];
$name = $_POST['name'];
$lastname = $_POST['lastname'];

$birthday = $_POST['birthday'];
$birthday = ConvertTexttoDate($birthday);

$age = $_POST['age'];
$bloodtype = $_POST['bloodtype'];
$marry = $_POST['marry'];
$national = $_POST['national'];
$religion = $_POST['religion'];
$phone = $_POST['phone'];
$email = $_POST['email'];
$emer1_name = $_POST['emer1_name'];
$emer1_phone = $_POST['emer1_phone'];
$emer2_name = $_POST['emer2_name'];
$emer2_phone = $_POST['emer2_phone'];
$addr_num = $_POST['addr_num'];
$addr_swine = $_POST['addr_swine'];
$addr_district = $_POST['addr_district'];
$addr_canton = $_POST['addr_canton'];
$addr_province = $_POST['addr_province'];
$zipcode = $_POST['zipcode'];
$job = $_POST['job'];
$addr_work = $_POST['addr_work'];
$medical_history = $_POST['medical_history'];
$disease = $_POST['disease'];
$treatment = $_POST['treatment'];
$addr_road = $_POST['addr_road'];

  $newtreatment = "";
  foreach($treatment as $treatment_val) {
	  
	  $newtreatment .= $treatment_val.",";
  }
  $newtreatment[strlen($newtreatment)-1] = "";
  $treatment = $newtreatment;

if( $action == "add")
{
	
	$id = 1;
 
 	// check id and dublicate report
	$query = "SELECT * FROM patient_tb ORDER BY HN";
	$result = mysqli_query($conn,$query); 
				 while($row = mysqli_fetch_array($result)) 
				 {
					 if( $id == $row['HN'])
					 {
					    $id++;
					 }
					 
				 }
			
	
	

	
	// Insert
	
	$query = "INSERT INTO patient_tb (HN, SSN, title, gender, name
	, lastname, birthday, age, bloodtype, marry, national, religion, phone, email
	, emer1_name, emer1_phone, emer2_name, emer2_phone, addr_num, addr_swine
	, addr_district, addr_canton, addr_province, zipcode, job, addr_work
	, medical_history, disease, treatment, addr_road) 
	VALUES 
	('".$id."', '".$SSN."', '".$title."', '".$gender."', '".$name."'
	, '".$lastname."', '".$birthday."', '".$age."', '".$bloodtype."', '".$marry."', '".$national."', '".$religion."', '".$phone."', '".$email."'
	, '".$emer1_name."', '".$emer1_phone."', '".$emer2_name."', '".$emer2_phone."', '".$addr_num."', '".$addr_swine."'
	, '".$addr_district."', '".$addr_canton."', '".$addr_province."', '".$zipcode."', '".$job."', '".$addr_work."'
	, '".$medical_history."', '".$disease."', '".$treatment."', '".$addr_road."')";
	
	echo $query ;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
	
	 mkdir("patient/".$id."");	
	 mkdir("patient/".$id."/medic_record");	
	 UploadandRenameImgFile('patient/'.$id.'',"useravata.jpg","patient");
	 
	 
	header( "Location: PatientPage.php?suc=2" );	
	 
}else if( $action == "edit")
{
	$HN = $_GET['patient'];
	
	$query  = "UPDATE patient_tb SET 
	SSN = '".$SSN."' , 
	title = '".$title."' , 
	gender = '".$gender."' , 
	name = '".$name."' , 
	lastname = '".$lastname."' , 
	birthday = '".$birthday."' , 
	age = '".$age."' , 
	bloodtype = '".$bloodtype."' , 
	marry = '".$marry."' , 
	national = '".$national."' , 
	religion = '".$religion."' , 
	phone = '".$phone."' , 
	email = '".$email."' , 
	emer1_name = '".$emer1_name."' , 
	emer1_phone = '".$emer1_phone."' , 
	emer2_name = '".$emer2_name."' , 
	emer2_phone = '".$emer2_phone."' , 
	addr_num = '".$addr_num."' , 
	addr_swine = '".$addr_swine."' , 
	addr_district = '".$addr_district."' , 
	addr_canton = '".$addr_canton."' , 
	addr_province = '".$addr_province."' , 
	zipcode = '".$zipcode."' , 
	job = '".$job."' , 
	addr_work = '".$addr_work."' , 
	medical_history = '".$medical_history."' , 
	disease = '".$disease."' , 
	treatment = '".$treatment."' , 
	addr_road = '".$addr_road."'
	WHERE HN = '".$HN."' "; 
	
	echo $query;
	
	if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error update record: " . $conn->error;
		}
	if($_FILES["fileToUpload"]["size"] != null)
	{
		UploadandRenameImgFile('patient/'.$HN.'',"useravata.jpg","patient");
	}
	
	
		 header( "Location: PatientDetail.php?patient=".$HN."&suc=3" );	
}



}
else 
{

$HN = $_GET['patient'];
	
	$query  = "DELETE FROM patient_tb WHERE HN = '".$HN."'";
	$conn->query($query);
			

			if ($conn->query($query) === TRUE) {
			echo "Record updated successfully";
		} else {
			echo "Error updating record: " . $conn->error;
		}
		
	
	 DeleteFolder("patient/".$HN.""); 
	 header( "Location: PatientPage.php?suc=1" );	
}



?>
