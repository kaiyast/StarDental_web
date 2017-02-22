<?php
session_start();
include('config.php'); 

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
					

					
					  <form action="EmployeeController.php?action=add" method="post" enctype="multipart/form-data">
					  
					   <div class="col-sm-9">

							  <div class="col-md-12">
								<br><br><b>ข้อมูลส่วนตัว</b><hr>	
							  </div>
							  
							  <div class="col-md-6">
								<br>ชื่อ    <input type="text"  class="form-control" placeholder="" name="name" />
							  </div>
							  <div class="col-md-6">
								<br>นามสกุล    <input type="text"  class="form-control" placeholder="" name="lastname" />
							  </div>							   
							   
							    <div class="col-md-12">
								<br>รหัสบัตรประชาชน	<input   type="text" class="form-control"  name="ssn" maxlength="13"/>
							   </div><br>
							   
							   <div class="col-md-6">
								<br>อีเมล 	<input type="text" class="form-control"  name="email" />
							   </div>				
			
							  <div class="col-md-6">
								<br>เบอร์โทร	<input   type="text" class="form-control"  name="phone" maxlength="10"/>
							   </div><br>


							  
							   <div class="col-md-12">
								<br>ที่อยู่	<input   type="text" class="form-control"  name="address" />
							   </div><br>

							   <div class="col-md-6">
									<br> เงินเดือน	<input   type="text" class="form-control"  name="salary" />
							   </div><div class="col-md-6"></div><br>
							   
							   <div class="col-md-6">
								<br>ตำแหน่ง	
										<select class="form-control" name="status" >
											<option value="แพทย์" >แพทย์</option>
											<option value="พยาบาล" >พยาบาล</option>
											<option value="พนักงานเคาน์เตอร์" >พนักงานเคาน์เตอร์</option>
										</select>
							   </div><div class="col-md-6"></div><br>	
							  
							   <div class="col-md-12">
									<br><h5><input style="width:30px; height:30px; " type="checkbox" id="allowaccount" name="allowaccount" onchange="oncheckaccount()" value="true"> ระบบจัดการคลีนิค</h5>
							   </div>
								 
							
							<div id="accountsystem" >		
								  <div class="col-md-12">
									<br><b>ข้อมูลทางระบบ</b><hr>	
								  </div>	
								  
									
								  <div class="col-md-6">
									<br>Username    <input type="text"  class="form-control" placeholder="" name="username" />
								  </div>
								  
								  <div class="col-md-6">
									<br>Password    <input type="text"  class="form-control" placeholder="" name="password" />
								  </div><br>

								   <div class="col-md-12">
										<br>เปิดระบบที่เข้าใช้งานได้
										<br><input  type="checkbox"  name="systemaccount[]"  value="1"> จัดการคนไข้ประจำวัน
										<br><input  type="checkbox"  name="systemaccount[]"  value="2"> ทะเบียนผู้ป่วย
										<br><input  type="checkbox"  name="systemaccount[]"  value="3"> คลังเวชภัณฑ์
										<br><input  type="checkbox"  name="systemaccount[]"  value="4"> รูปแบบการรักษา
										<br><input  type="checkbox"  name="systemaccount[]"  value="5"> ประวัติการรักษา
										<br><input  type="checkbox"  name="systemaccount[]"  value="6"> จัดการบุคาลากร
										<br><input  type="checkbox"  name="systemaccount[]"  value="7"> ตารางนัดหมาย
										<br><input  type="checkbox"  name="systemaccount[]"  value="8"> รายงานข้อมูล
										
								   </div>
							   
							</div>
							   
							   	<div class="col-md-12">	
									<br><button class="col-md-3 btn btn-success" type="submit">บันทึก</button>
								</div><div class="col-md-12"><br></div>	<br>
						
						</div>
						
						<div class="col-sm-3" align="right">
								<br><br><br><br><br><br>	
							<img style="width:100%;" src="employee/useravata.jpg" class="pull-right img-responsive img-rounded">
							<input class="form-control" type="file" name="fileToUpload" id="fileToUpload">
							
						</div>

					   
					   	
					   


								
					  </form>
             
                </div>
            </div>
            <!--/row-->
			

        

        

        </div>
        <!--/main col-->
    </div>

</div>
	
	      <script>
          
			$("#accountsystem").hide();
			
         
		  
		  function oncheckaccount()
		  {
			  var checkval =   document.getElementById("allowaccount").checked;
			
			  if(checkval)
			  {
				  $("#accountsystem").show();
			  }
			  else
			  {
				  $("#accountsystem").hide();
			  }
		  }
	  
			</script>
			
  </body>
</html>