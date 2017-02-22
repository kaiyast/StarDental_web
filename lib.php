<?php

 if( (isset($_SESSION["checklogin"])== 1 ) &&  (strpos($_SERVER['REQUEST_URI'], 'index') == false) )
 {
	 
	 if($_SESSION["checklogin"] == 0){   header( "Location: logout.php" );	}
 }
 else if( (isset($_SESSION["checklogin"])== 0 ) &&  (strpos($_SERVER['REQUEST_URI'], 'index') == false) )
 {
	  header( "Location: logout.php" );
	  
 }

  
// Func Zone --------------------------------------
// List ------
/*


  - GetpatientDetailFromID($conn,$id)
  - GetdayFromDate($inputdate)
  - GetmedicrecordDetailFromID($conn,$id)
  - GetscheduleDetailFromID($conn,$id)
  - GetCureSubjectFromID($conn,$id)
  - DeleteFolder($path)
  - UploadandRenameImgFile($savepath,$fname,$func)
  - printid($id)

  - ConvertTexttoDate($text_in)
  - ConvertDatetoText($date_in)
*/
// ----------
// Getpatientdetail

function GetNowDate()
{
	$date = date("Y-m-d");  
	return $date;
}

function GetpatientDetailFromID($conn,$id)
{
			//intial
				$patientDetail = array(
						"HN"=>"",
						"SSN"=>"",
						"title"=>"",
						"gender"=>"",
						"name"=>"",
						"lastname"=>"",
						"birthday"=>"",
						"age"=>"",
						"bloodtype"=>"",
						"marry"=>"",
						"national"=>"",
						"religion"=>"",
						"phone"=>"",
						"email"=>"",
						"emer1_name"=>"",
						"emer1_phone"=>"",
						"emer2_name"=>"",
						"emer2_phone"=>"",
						"addr_num"=>"",
						"addr_swine"=>"",
						"addr_district"=>"",
						"addr_canton"=>"",
						"addr_province"=>"",
						"zipcode"=>"",
						"job"=>"",
						"addr_work"=>"",
						"medical_history"=>"",
						"disease"=>"",
						"treatment"=>"",
						"addr_road"=>"");
						
		$query  = "SELECT * FROM patient_tb WHERE HN = '".$id."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
				
				
					$patientDetail = array(
						"HN"=>"".$id,
						"SSN"=>"".$row['SSN'],
						"title"=>"".$row['title'],
						"gender"=>"".$row['gender'],
						"name"=>"".$row['name'],
						"lastname"=>"".$row['lastname'],
						"birthday"=>"".$row['birthday'],
						"age"=>"".$row['age'],
						"bloodtype"=>"".$row['bloodtype'],
						"marry"=>"".$row['marry'],
						"national"=>"".$row['national'],
						"religion"=>"".$row['religion'],
						"phone"=>"".$row['phone'],
						"email"=>"".$row['email'],
						"emer1_name"=>"".$row['emer1_name'],
						"emer1_phone"=>"".$row['emer1_phone'],
						"emer2_name"=>"".$row['emer2_name'],
						"emer2_phone"=>"".$row['emer2_phone'],
						"addr_num"=>"".$row['addr_num'],
						"addr_swine"=>"".$row['addr_swine'],
						"addr_district"=>"".$row['addr_district'],
						"addr_canton"=>"".$row['addr_canton'],
						"addr_province"=>"".$row['addr_province'],
						"zipcode"=>"".$row['zipcode'],
						"job"=>"".$row['job'],
						"addr_work"=>"".$row['addr_work'],
						"medical_history"=>"".$row['medical_history'],
						"disease"=>"".$row['disease'],
						"treatment"=>"".$row['treatment'],
						"addr_road"=>"".$row['addr_road']);


					
					return $patientDetail;
				
			}
			
			return $patientDetail;
	
}

// get day month form date
function GetdayFromDate($inputdate)
{
	$dateArr = explode("-",$inputdate);   // 0 - year 1 - month 2 - day

	$datetime = DateTime::createFromFormat('Ymd', $dateArr[0].$dateArr[1].$dateArr[2]);
	//$datetime->format('D');
	
	$dayname = $datetime->format('D');
	if($dayname == "Mon"){ $dayname = "วันจันทร์";}
	else if($dayname == "Tue"){ $dayname = "วันอังคาร";}
	else if($dayname == "Wed"){ $dayname = "วันพุธ";}
	else if($dayname == "Thu"){ $dayname = "วันพฤหัสบดี";}
	else if($dayname == "Fri"){ $dayname = "วันศุกร์";}
	else if($dayname == "Sat"){ $dayname = "วันเสาร์";}
	else if($dayname == "Sun"){ $dayname = "วันอาทิตย์";}
	
	$month = $datetime->format('m');
	if($month == 1){ $month = "มกราคม";}
	else if($month == 2){ $month = "กุมภาพันธ์";}
	else if($month == 3){ $month = "มีนาคม";}
	else if($month == 4){ $month = "เมษายน";}
	else if($month == 5){ $month = "พฤษภาคม";}
	else if($month == 6){ $month = "มิถุนายน";}
	else if($month == 7){ $month = "กรกฎาคม";}
	else if($month == 8){ $month = "สิงหาคม";}
	else if($month == 9){ $month = "กันยายน";}
	else if($month == 10){ $month = "ตุลาคม";}
	else if($month == 11){ $month = "พฤศจิกายน";}
	else if($month == 12){ $month = "ธันวาคม";}
	
	$year = $datetime->format('Y')+543;
	
	$dateoutput = array(
						"day"=>"".$dateArr[2],
						"dayname"=>"".$dayname,
						"month"=>"".$month,
						"year"=>"".$year ,
						"date"=>$datetime);
						
	return $dateoutput;
}

function GetscheduleDetailFromID($conn,$id)
{
	//intial
				$scheduleDetail = array(
						"schedule_id"=>"",
						"date"=>"",
						"start"=>"",
						"end"=>"",
						"detail"=>"",
						"HN"=>"");
						
		$query  = "SELECT * FROM schedule_tb WHERE schedule_id = '".$id."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
					$scheduleDetail = array(
						"schedule_id"=>$row['schedule_id'],
						"date"=>$row['date'],
						"start"=>$row['start'],
						"end"=>$row['end'],
						"detail"=>$row['detail'],
						"HN"=>$row['HN']);
				
				return $scheduleDetail;
			}
			
			return $scheduleDetail;
}

function GetmedicrecordDetailFromID($conn,$id)
{
	//intial
				$medicrecordDetail = array(
						"id"=>"",
						"date"=>"",
						"HN"=>"");
						
		$query  = "SELECT * FROM medicrecord_tb WHERE id = '".$id."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
					$medicrecordDetail = array(
							"id"=>$row['id'],
							"date"=>$row['date'],
							"HN"=>$row['HN']);
				
				return $medicrecordDetail;
			}
			
			return $medicrecordDetail;
}

function GetMedicSupplyFromID($conn,$id)
{
	//intial
				$medicsuppyDetail = array(
							"id"=>"",
							"name"=>"",
							"detail"=>"",
							"amount"=>"",
							"sh_amount"=>"",
							"redate"=>"",
							"unit"=>"");
						
		$query  = "SELECT * FROM medicsupply_tb WHERE id = '".$id."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
					$medicsuppyDetail = array(
							"id"=>$row['id'],
							"name"=>$row['name'],
							"detail"=>$row['detail'],
							"amount"=>$row['amount'],
							"sh_amount"=>$row['sh_amount'],
							"redate"=>$row['redate'],
							"unit"=>$row['unit']);
				
				
				return $medicsuppyDetail;
			}
			
			return $medicsuppyDetail;
}

function GetCureSubjectFromID($conn,$id)
{
	//intial
				$curesubjectDetail = array(
							"id"=>"",
							"name"=>"",
							"max"=>"",
							"min"=>"");
						
		$query  = "SELECT * FROM curesubject_tb WHERE id = '".$id."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
					$curesubjectDetail = array(
							"id"=>$row['id'],
							"name"=>$row['name'],
							"max"=>$row['max'],
							"min"=>$row['min']);
				
				
				return $curesubjectDetail;
			}
			
			return $curesubjectDetail;
}

function GetEmployeeFromID($conn,$id)
{
	//intial
				$employeeDetail = array(
							"id"=>"",
							"name"=>"",
							"lastname"=>"",
							"email"=>"",
							"phone"=>"",
							"ssn"=>"",
							"salary"=>"",
							"status"=>"",
							"username"=>"",
							"password"=>"",
							"systemaccount"=>"",
							"address"=>"");
						
		$query  = "SELECT * FROM employee_tb WHERE id = '".$id."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
				$employeeDetail = array(
							"id"=>$row['id'],
							"name"=>$row['name'],
							"lastname"=>$row['lastname'],
							"email"=>$row['email'],
							"phone"=>$row['phone'],
							"ssn"=>$row['ssn'],
							"salary"=>$row['salary'],
							"status"=>$row['status'],
							"username"=>$row['username'],
							"password"=>$row['password'],
							"systemaccount"=>$row['systemaccount'],
							"address"=>$row['address']);
				
				
				return $employeeDetail;
			}
			
			return $employeeDetail;
}

//   Treatment ------------------------------------------------------

class MedicSupplyHistory { 
	public $medicsupply = "";
	public $amount = 0;
}

class TreatmentHistory { 
    public $id = "0"; 
	public $date = "00-00-00"; 
	public $employee_earn = "0";
	public $payment = "0"; 	
	public $curesubject_arr = array("ไม่มีรายการรักษา");
	public $medicsupply_arr = array("ไม่มีรายการยา");
	public $patient = 0; 
    public $employee = 0;
    

} 

function GetTreatmentHistoryFromID($conn,$id)
{
	//intial
		$TreatmentDetail = new TreatmentHistory;
				
		$query  = "SELECT * FROM treatment_history_tb WHERE id = '".$id."' "; 
		//echo $query;
			$result = mysqli_query($conn,$query); 
			while($row = mysqli_fetch_array($result)) 
			{
				$TreatmentDetail = new TreatmentHistory;
					
			
				$TreatmentDetail->{'id'} = $row['id'];
				$TreatmentDetail->{'date'} = $row['date'];
				$TreatmentDetail->{'payment'} = $row['payment'];
				$TreatmentDetail->{'employee_earn'} = $row['employee_earn'];
				$TreatmentDetail->{'patient'} = GetpatientDetailFromID($conn,$row['patient_id']);
				$TreatmentDetail->{'employee'} = GetEmployeeFromID($conn,$row['employee_id']);
				
				//second query for search casesubject_arr
				$query2  = "SELECT * FROM curesubject_history_tb WHERE treatment_history_id = '".$id."' "; 
				$result2 = mysqli_query($conn,$query2); 
				$count = 0;
				while($row2 = mysqli_fetch_array($result2)) 
				{
					
					 if( $count ==0 ) {$TreatmentDetail->{'curesubject_arr'} = array();}
				   array_push($TreatmentDetail->{'curesubject_arr'},GetCureSubjectFromID($conn,$row2['curesubject_id']));
				   $count++;
				   
				}
				
				//thrid query for search medicsupply_arr
				$query2  = "SELECT * FROM medicsupply_history_tb WHERE treatment_history_id = '".$id."' "; 
				$result2 = mysqli_query($conn,$query2); 
				$count = 0;
				while($row2 = mysqli_fetch_array($result2)) 
				{
					// create medicsup history keep medicsupply and amount in class
					$medicSupplyHistory = new MedicSupplyHistory;
					$medicSupplyHistory->{'medicsupply'} = GetMedicSupplyFromID($conn,$row2['medicsupply_id']);
					$medicSupplyHistory->{'amount'} = $row2['amount'];
					
					 if( $count ==0 ) { $TreatmentDetail->{'medicsupply_arr'} = array();}
				    array_push($TreatmentDetail->{'medicsupply_arr'},$medicSupplyHistory);
					$count++;
				}				

				
				return $TreatmentDetail;
			}
		

			return $TreatmentDetail;
}

// ------------------------ Delete Folder ------------------------------------------------
function DeleteFolder($path)
{
    if (is_dir($path) === true)
    {
        $files = array_diff(scandir($path), array('.', '..'));

        foreach ($files as $file)
        {
            DeleteFolder(realpath($path) . '/' . $file);
        }

        return rmdir($path);
    }

    else if (is_file($path) === true)
    {
        return unlink($path);
    }

    return false;
}

// Upload and Rename File
function UploadandRenameImgFile($savepath,$fname,$func)
{
	//  type="file" name="fileToUpload" *****************
	
	$filename = $_FILES["fileToUpload"]["name"];
	$file_basename = substr($filename, 0, strripos($filename, '.')); // get file extention
	$file_ext = substr($filename, strripos($filename, '.')); // get file name
	$filesize = $_FILES["fileToUpload"]["size"];
	$allowed_file_types = array('.png','.jpg','.gif');	
	$erruoload = 1;
	if (in_array($file_ext,$allowed_file_types) && ($filesize < 2000000))
	{	
		// Rename file
		
		
			move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $savepath."/" . $fname);
			echo "File uploaded successfully.";		
		
		
		$erruoload = 0;
	}
	elseif (empty($file_basename))
	{	
		// file selection error
		echo "Please select a file to upload.";
	} 
	elseif ($filesize > 2000000)
	{	
		// file size error
		echo "The file you are trying to upload is too large.";
	}
	else
	{
		// file type error
		echo "Only these file typs are allowed for upload: " . implode(', ',$allowed_file_types);
		unlink($_FILES["fileToUpload"]["tmp_name"]);
	}
	
	if($func == "patient" ){ if($erruoload == 1){ copy("patient/useravata.jpg", $savepath."/".$fname.""); } }
	else if($func == "medicrecord" ){ if($erruoload == 1){ copy("patient/no_image.jpg", $savepath."/".$fname.""); } }
	else if($func == "medicsupply" ){ if($erruoload == 1){ copy("medicsupply/no_image.jpg", $savepath."/".$fname.""); } }
	else if($func == "employee" ){ if($erruoload == 1){ copy("employee/useravata.jpg", $savepath."/".$fname.""); } }

}

// print id format
function printid($id)
{
		
	if($id < 10) {$id = "00000".$id;}  		// 000009
	else if($id < 100) {$id = "0000".$id;}  // 000099
	else if($id < 1000) {$id = "000".$id;}  // 000999
	else if($id < 1000) {$id = "000".$id;}  // 000999
	else if($id < 10000) {$id = "00".$id;}  // 009999
	else if($id < 100000 ) {$id = "0".$id;}// 099999
	
return $id;
}

function ConvertTexttoDate($text_in)
{
	
	$text_arr = explode("-", $text_in);
	$date = $text_arr[2]."-".$text_arr[1]."-".$text_arr[0];
	return $date;
}

function ConvertDatetoText($date_in)
{
	
	$date_arr = explode("-", $date_in);
	$text = $date_arr[2]."-".$date_arr[1]."-".$date_arr[0];
	return $text;
}

function GenIDinTable ($conn,$tb_name)
{
	$id = 1;
	
	$query = "SELECT * FROM ".$tb_name." ORDER BY id";
	$result = mysqli_query($conn,$query); 
				 while($row = mysqli_fetch_array($result)) 
				 {
					 if( $id == $row['id'])
					 {
					    $id++;
					 }
					 
				 }
	return $id;
}
?>


	
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" integrity="sha384-AysaV+vQoT3kOAXZkl02PThvDr8HYKPZhNT5h/CXfBThSRXQ6jW5DO2ekP5ViFdi" crossorigin="anonymous">
    <link href="css/font-awesome.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="css/styles.css" />
	
	<script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
	<script src="js/scripts.js"></script>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
<script>

function Checkformaddpatient(){
	
	var formcheck = true;
	var ssn = document.getElementById("ssn").value;
	var name = document.getElementById("name").value;
	var lastname = document.getElementById("lastname").value;
	var phone = document.getElementById("phone").value;
	
	var isnum = /^\d+$/.test(ssn);
	if(isnum == false){ // is not number
		formcheck = false;
	}
	if(ssn.length != "13" )
	{
		formcheck = false;
	}
	
	if( phone[0] != "0")
	{
		formcheck = false;
	}
	if( phone.length != "10" && phone.length != "9")
	{
		formcheck = false;
	}
	
	var isnum = /^\d+$/.test(phone);
	if(isnum == false){ // is not number
		formcheck = false;
	}
	
	if(name == "" || lastname == ""  || phone == "" || ssn == "")
	{
		formcheck = false;
	}

	//alert(formcheck);
	
	
	if(formcheck == true){ return true; }
	else{ $('#CheckFormModal').modal();
		  return false; }
	
}

function backpage()
{
	var url_txt = window.location.href;
	var url_redirect = "index.php";
	
	
    if(url_txt.includes("Patient")){ url_redirect = 'PatientPage.php';}
	else if(url_txt.includes("MedicSupply")){ url_redirect = 'MedicSupplyPage.php';}
	else if(url_txt.includes("CureSubject")){ url_redirect = 'CureSubjectPage.php';}
	else if(url_txt.includes("TreatmentHistory")){ url_redirect = 'TreatmentHistoryPage.php';}
	else if(url_txt.includes("Employee")){ url_redirect = 'EmployeePage.php';}
	else if(url_txt.includes("Schedule")){ url_redirect = 'SchedulePage.php';}
	else if(url_txt.includes("Report")){ url_redirect = 'ReportPage.php';}
	
	window.location.href = url_redirect;
}
</script>