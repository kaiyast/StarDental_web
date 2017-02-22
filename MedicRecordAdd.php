<?php
session_start();
include('config.php'); 

if(isset($_GET["patient"]) == 0 )
	{ 	$patient = ""; }
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

?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>จัดการเอกสาร</title>
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
				
					<h1 >
					เพิ่มเอกสารเวชระเบียน
					</h1><hr><br>
					
					 <form action="MedicRecordController.php?action=add&redirect=<?php echo $redirect; ?>" method="post" enctype="multipart/form-data">
							
							<div class="col-md-12">
								อัปโหลดเอกสารเวชระเบียน
								<br><input  type="file" name="fileToUpload" id="fileToUpload">
							</div>

							<div class="col-md-12">
							<?php 
									if($patient != "")
									{
										echo ' <br>เลขที่คนไข้	<input style="width:50%;"  type="text" class="form-control"  name="patient_sh" value="'.$patient_text.'" disabled/> ';
										echo ' <input style="width:50%;"  type="hidden" class="form-control"  name="patient" value="'.$patient.'" /> ';
									}
									else
									{
										echo ' <br>เลขที่คนไข้	<input style="width:50%;"  type="text" class="form-control"  name="patient" value="" /> ';
									}
							?>
								
								
							</div>
							
							<div class="col-md-12">
								<br>วันที่ทำการบันทึก 	<input style="width:50%;"  type="text" class="form-control"  name="date" id="datepicker" />
							</div>
								
							<div class="col-md-12">
								<br><button type="submit" class="col-md-2 btn btn-success" type="submit">บันทึก</button>
							</div>								
					  </form>
			
            </div>
            <!--/row-->
			

            <hr>

        
          
          
          
          
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