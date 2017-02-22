<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["schedule"]) == 0 )
	{  $id = -1; }
else
	{ $id = $_GET["schedule"]; }

if(isset($_GET["patient"]) == 0 )
	{  $patient = ""; }
else
	{ $patient = $_GET["patient"]; }

// get schedule val
 $scheduledetail = GetscheduleDetailFromID($conn,$id);
 $patient = $scheduledetail['HN'];
 
//get patientval
if($patient != "")
	{   
		$patient_detail = GetpatientDetailFromID($conn,$patient);  
		$patient_text =  ' '.printid($patient_detail['HN']).' : '.$patient_detail['title'].' '.$patient_detail['name'].' '.$patient_detail['lastname'];
	}
	
if(isset($_GET["redirect"]) == 0 )
	{ 	$redirect = ""; }
else
	{ 
		$redirect = $_GET["redirect"]; 
	}

		// Search Patient 
if(isset($_GET["search_output"]) == 0)
{
	$checksearch = 0;
}
else
{
	$patient = $_GET["search_output"];
	$checksearch = 1;
	$patient_detail = GetpatientDetailFromID($conn,$patient);  
	$patient_text =  ' '.printid($patient_detail['HN']).' : '.$patient_detail['title'].' '.$patient_detail['name'].' '.$patient_detail['lastname'];
}

// convert 
$date = ConvertDatetoText($scheduledetail['date']);

?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ตารางนัดหมาย</title>
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
					
					<div class="col-md-12">
					
					<center><h1 >แก้ไขการนัดหมาย</h1></center>
					</div>
					
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
					</div>
					
					  <form action="ScheduleController.php?redirect=<?php echo $redirect; ?>&action=edit&schedule=<?php echo $id;?>" method="post" enctype="multipart/form-data">
					  
					  <div class="col-md-6">
						<br>วันที่นัดหมาย    <input type="text" id="datepicker" class="form-control" value="<?php echo $date; ?>" name="date" />
					  </div><div class="col-md-12"></div>	

					   
						<div class="col-md-3"><br> เริ่มต้นนัดหมาย <input id="start" placeholder="09.00" type="text" class="form-control"  name="start" value="<?php echo $scheduledetail['start']; ?>"/></div>					
						<div class="col-md-3"><br>สิ้นสุดนัดหมาย<br><input id="end" placeholder="10.00" type="text" class="form-control"  name="end" value="<?php echo $scheduledetail['end']; ?>"/></div>
							<div class="col-md-12"></div>
					   
					   <div class="col-md-6">
						<br>รายละเอียด 	<input  placeholder="นัดตรวจประจำวัน" id="detail" type="text" class="form-control"  name="detail" value="<?php echo $scheduledetail['detail']; ?>"/>
					   </div><div class="col-md-12"></div>
					   
					   <div class="col-md-6">
					   <br>คนไข้ที่นัดหมาย
					   
						<div class="input-group">
					   		<?php 
									if($patient != "" || $checksearch == 1)
									{
										echo '<input style=""  type="text" class="form-control"  name="patient_sh" value="'.$patient_text.'" disabled/> ';
										echo ' <input style="width:50%;"  type="hidden" class="form-control"  name="patient" value="'.$patient.'" /><br> ';
										if($checksearch == 1)
										{
										echo '<span class="input-group-btn">
													<a href="PatientSearch.php?redirect=ScheduleAdd"><button  class="btn btn-default" type="button"><span class="fa fa-search"></span></button></a>
												</span> ';
										}

									}
									else
									{
										
										echo ' <div class="input-group">
												<input type="text" placeholder="ป้อน รายชื่อคนไข้ต้องการจัดการ" class="form-control" name="patient" value="" >
												<span class="input-group-btn">
													<a href="PatientSearch.php?redirect=ScheduleAdd"><button  class="btn btn-default" type="button"><span class="fa fa-search"></span></button></a>
												</span>
												';
									}
							?>
							</div><br> 
							
							
						
						
					   </div><div class="col-md-12"></div>
					   
					   	<div class="col-md-12">	
							<button class="col-md-2 btn btn-success" type="submit">บันทึก</button>
						</div>
										
					  </form>
             
                </div>
            </div>
            <!--/row-->
			

        

        					<!-- Modal 1------>
								<div class="modal fade" id="DelCheckModal" role="dialog">
								<div class="modal-dialog">
								
								  <!-- Modal content-->
								  <div class="modal-content">
									<div class="modal-header">
									  <button type="button" class="close" data-dismiss="modal">&times;</button>
									  <h4 class="modal-title">แจ้งเตือน</h4>
									</div>
									
									
									<div class="modal-body">
									  <p>ผลการค้นหา : </p>
									</div>
									
									<div id="responsecontainer" align="center"></div>
									
									<div class="modal-footer">
									  <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
									</div>
								  </div>	  
									  
									</div>
									<!--/main col-->
								</div>
          
          
          
          
        </div>
        <!--/main col-->
    </div>

</div>



	   <script>
						$( function() {
								$( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
						} );

		
		</script>
					  
  </body>
</html>