<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["employee"]) == 0 )
	{  $id = -1; }
else
	{ $id = $_GET["employee"]; }

// Getpatientdetail
$employeeDetail = GetEmployeeFromID($conn,$id);





?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>บุคลากร</title>
    <meta name="description" content="A admin dashboard theme that will get you started with Bootstrap 4. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">



	
	<style>
	.tablebtn{
		
		font-size:100%;
	}
	</style>
	
  </head>
  <body >

  
<?php  include('header.php'); 	 ?>
 
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
	
	<br><br>
	
       <?php  include('menubar.php'); 	 ?>
	   
        <!--/col-->

        <div class="col-md-9 col-lg-10 main">





				<div class="col-md-12">
				
					<div >
						<button onclick="backpage()" class="btn btn-info tablebtn" type="button"><span class="fa fa-arrow-left"></span> ย้อนกลับ</button>
					</div>
					

					
				
					
					  <form action="EmployeeController.php?action=edit&employee=<?php echo $employeeDetail['id']; ?>" method="post" enctype="multipart/form-data">
					  
					   <div class="col-sm-9">

							  <div class="col-md-12">
								<br><br><b>ข้อมูลส่วนตัว</b><hr>	
							  </div>
							  
							  <div class="col-md-6">
								<br>ชื่อ    <input type="text"  class="form-control"  name="name" value="<?php echo $employeeDetail['name']; ?>"/>
							  </div>
							  <div class="col-md-6">
								<br>นามสกุล    <input type="text"  class="form-control" name="lastname" value="<?php echo $employeeDetail['lastname']; ?>" />
							  </div>							   
							   
							    <div class="col-md-12">
								<br>รหัสบัตรประชาชน	<input   type="text" class="form-control"  name="ssn" maxlength="13" value="<?php echo $employeeDetail['ssn']; ?>"/>
							   </div><br>
							   
							   <div class="col-md-6">
								<br>อีเมล 	<input type="text" class="form-control"  name="email" value="<?php echo $employeeDetail['email']; ?>"/>
							   </div>				
			
							  <div class="col-md-6">
								<br>เบอร์โทร	<input   type="text" class="form-control"  name="phone" maxlength="10" value="<?php echo $employeeDetail['phone']; ?>"/>
							   </div><br>


							  
							   <div class="col-md-12">
								<br>ที่อยู่	<input   type="text" class="form-control"  name="address" value="<?php echo $employeeDetail['address']; ?>"/>
							   </div><br>

							   <div class="col-md-6">
									<br> เงินเดือน	<input   type="text" class="form-control"  name="salary" value="<?php echo $employeeDetail['salary']; ?>"/>
							   </div><div class="col-md-6"></div><br>
							   
							   <div class="col-md-6">
								<br>ตำแหน่ง	
										<select class="form-control" name="status" >
											<?php
												if($employeeDetail['status'] == "แพทย์")
													{echo '<option value="แพทย์" selected>แพทย์</option>';}
												else 
													{echo '<option value="แพทย์" >แพทย์</option>';}
												
												if($employeeDetail['status'] == "พยาบาล")
													{echo '<option value="พยาบาล" selected>พยาบาล</option>';}
												else 
													{echo '<option value="พยาบาล" >พยาบาล</option>';}
												
												if($employeeDetail['status'] == "พนักงานเคาน์เตอร์")
													{echo '<option value="พนักงานเคาน์เตอร์" selected>พนักงานเคาน์เตอร์</option>';}
												else 
													{echo '<option value="พนักงานเคาน์เตอร์" >พนักงานเคาน์เตอร์</option>';}
												
											?>					
										</select>
							   </div><div class="col-md-6"></div><br>	
							  
							   <div class="col-md-12">
									<br><h5><input style="width:30px; height:30px; " type="checkbox" id="allowaccount" name="allowaccount" onchange="oncheckaccount()" value="true" 
									<?php if($employeeDetail['username'] != "nodata" && $employeeDetail['password'] != "nodata" ){ echo "checked";}?>>
									 เปิดระบบจัดการคลีนิค</h5>
							   </div>
								 
							
							<div id="accountsystem" >		
								  <div class="col-md-12">
									<br><b>ข้อมูลทางระบบ</b><hr>	
								  </div>	
								  
									
								  <div class="col-md-6">
									<br>Username    <input type="text" id="username" class="form-control" placeholder="" name="username" value="<?php echo $employeeDetail['username']; ?>"/>
								  </div>
								  
								  <div class="col-md-6">
									<br>Password    <input type="text" id="password"  class="form-control" placeholder="" name="password" value="<?php echo $employeeDetail['password']; ?>"/>
								  </div><br>

								   <div class="col-md-12">
										<br>ระบบที่เข้าใช้งานได้
										<br><input  type="checkbox"  name="systemaccount[]"  value="1" <?php if(strpos($employeeDetail['systemaccount'],'1') !== false){echo "checked";}?> > จัดการคนไข้ประจำวัน
										<br><input  type="checkbox"  name="systemaccount[]"  value="2" <?php if(strpos($employeeDetail['systemaccount'],'2') !== false){echo "checked";}?> > ทะเบียนผู้ป่วย
										<br><input  type="checkbox"  name="systemaccount[]"  value="3" <?php if(strpos($employeeDetail['systemaccount'],'3') !== false){echo "checked";}?> > คลังเวชภัณฑ์
										<br><input  type="checkbox"  name="systemaccount[]"  value="4" <?php if(strpos($employeeDetail['systemaccount'],'4') !== false){echo "checked";}?> > รูปแบบการรักษา
										<br><input  type="checkbox"  name="systemaccount[]"  value="5" <?php if(strpos($employeeDetail['systemaccount'],'5') !== false){echo "checked";}?> > ประวัติการรักษา
										<br><input  type="checkbox"  name="systemaccount[]"  value="6" <?php if(strpos($employeeDetail['systemaccount'],'6') !== false){echo "checked";}?> > จัดการบุคาลากร
										<br><input  type="checkbox"  name="systemaccount[]"  value="7" <?php if(strpos($employeeDetail['systemaccount'],'7') !== false){echo "checked";}?> > ตารางนัดหมาย
										<br><input  type="checkbox"  name="systemaccount[]"  value="8" <?php if(strpos($employeeDetail['systemaccount'],'8') !== false){echo "checked";}?> > รายงานข้อมูล
										
								   </div>
							   
							  </div>

							   
							   	<div class="col-md-12">	
									<br><button class="col-md-3 btn btn-success" type="submit">บันทึก</button>
								</div><div class="col-md-12"><br></div>	<br>
						
						</div>
						
						<div class="col-sm-3" align="right">
									<br><br><br><br><br><br>	
							<img style="width:100%;" src="employee/<?php echo $employeeDetail['id']; ?>/useravata.jpg" class="pull-right img-responsive img-rounded">
							<input class="form-control" type="file" name="fileToUpload" id="fileToUpload">
							
						</div>

								
					  </form>
             
			 
			 
			 
                </div>
            </div>
            <!--/row-->
			

        

                  		<!-- Modal -->
				<div class="modal fade" id="CheckModal" role="dialog">
				<div class="modal-dialog">
				
				  <!-- Modal content-->
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">แจ้งเตือน</h4>
					</div>
					<div class="modal-body">
					  <p>แก้ไขขบุคลากรเสร็จสิ้น</p>
					</div>
					<div class="modal-footer">
					  <button onclick="Reloadthispage()" type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
					</div>
				  </div>
					  
					  
					  
					</div>
					<!--/main col-->
				</div>
          
          
          
          
        </div>
        <!--/main col-->
    </div>

</div>

<script >
<?php


// Check var form Get method
if(isset($_GET["suc"]) == 1 )   
{ 
    
		echo "$('#CheckModal').modal();";
		
}

if($employeeDetail['username'] != "nodata" && $employeeDetail['password'] != "nodata" ){ echo '$("#accountsystem").show();';}
else{ echo '$("#accountsystem").hide();';}
?>

function Reloadthispage()
{
	window.location.href = "EmployeeDetail.php?employee=<?php echo $id;?>";
}
		  
		  function oncheckaccount()
		  {
			  var checkval =   document.getElementById("allowaccount").checked;
			
			  if(checkval)
			  {
				  document.getElementById("username").value = "";
				  document.getElementById("password").value = "";
				  $("#accountsystem").show();
			  }
			  else
			  {
				  $("#accountsystem").hide();
			  }
		  }
		  
</script >
  </body>
</html>