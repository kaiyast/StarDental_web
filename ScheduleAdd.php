<?php
session_start();
include('config.php'); 



if(isset($_GET["patient"]) == 0 )
	{  $patient = ""; }
else
	{ $patient = $_GET["patient"]; }

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
					
					<center><h1 >เพิ่มการนัดหมาย</h1></center>
					</div>
					

					
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
					</div>
					
					  <form action="ScheduleController.php?redirect=<?php echo $redirect; ?>&action=add" method="post" enctype="multipart/form-data">
					  
					  <div class="col-md-6">
						<br>วันที่นัดหมาย    <input type="text" id="datepicker" class="form-control" value="" name="date" />
					  </div><div class="col-md-12"></div>	

					   
						<div class="col-md-3"><br> เริ่มต้นนัดหมาย <input  id="start" placeholder="09.00" type="text" class="form-control"  name="start" /></div>					
						<div class="col-md-3"><br>สิ้นสุดนัดหมาย<br><input id="end" placeholder="10.00" type="text" class="form-control"  name="end" /></div>
							<div class="col-md-12"></div>
					   
					   <div class="col-md-6">
						<br>รายละเอียด 	<input  id="detail" placeholder="นัดตรวจประจำวัน"  type="text" class="form-control"  name="detail" />
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
													<a href="PatientSearch.php?redirect=ScheduleAdd"><button onclick="SaveValAndSearch()" class="btn btn-default" type="button"><span class="fa fa-search"></span></button></a>
												</span> ';
										}

									}
									else
									{
										
										echo ' <div class="input-group">
												<input type="text" placeholder="ป้อน รายชื่อคนไข้ต้องการจัดการ" class="form-control" name="patient" value="" >
												<span class="input-group-btn">
													<a href="PatientSearch.php?redirect=ScheduleAdd"><button onclick="SaveValAndSearch()" class="btn btn-default" type="button"><span class="fa fa-search"></span></button></a>
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
			

        

        
          
          
          
          
        </div>
        <!--/main col-->
    </div>

</div>

		<script>
			$( function() {
								$( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
			} );
			
			function SaveValAndSearch()
			{
				var date = document.getElementById("datepicker").value ;
				var start = document.getElementById("start").value ;
				var end = document.getElementById("end").value ;
				var detail = document.getElementById("detail").value ;
				
				localStorage.setItem("date", date);
				localStorage.setItem("start", start);
				localStorage.setItem("end", end);
				localStorage.setItem("lastname", detail);
				
				
			}

			function GetValAndSearch()
			{
				document.getElementById("datepicker").value = localStorage.getItem("date");
				document.getElementById("start").value = localStorage.getItem("start");
				document.getElementById("end").value = localStorage.getItem("end");
				document.getElementById("detail").value = localStorage.getItem("lastname");
				
				
				
			}

				<?php
				if(isset($_GET["searchsuccess"]) == 1)
				{
					echo "GetValAndSearch();";
				}
				?>
				
		</script>

  </body>
</html>