<?php
session_start();
include('config.php'); 


// Check var form Get method
if(isset($_GET["medicrecord"]) == 0 )
	{  $id = -1; }
else
	{ $id = $_GET["medicrecord"]; }

// Get Medicdetail
$medicrecordDetail = GetmedicrecordDetailFromID($conn,$id);
$fname = $medicrecordDetail['id']."-".$medicrecordDetail['date'].".jpg";

// Get Patientdetail
$patient= $medicrecordDetail['HN'];
$patient_detail = GetpatientDetailFromID($conn,$patient);  
$patient_text =  ' '.printid($patient_detail['HN']).' : '.$patient_detail['title'].' '.$patient_detail['name'].' '.$patient_detail['lastname'];



// convert 
$date = ConvertDatetoText($medicrecordDetail['date']);

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
				
				
					 <div class="card card-default card-block">
                        <ul id="tabsJustified" class="nav nav-tabs nav-justified">
                            <li class="nav-item">
                                <a class="nav-link active" href="" data-target="#tab1" data-toggle="tab">ข้อมูลระเบียนเวช</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="" data-target="#tab2" data-toggle="tab">รูปภาพระเบียนเวช</a>
                            </li>

                        </ul>
                        <!--/tabs-->
                        <br>
                        <div id="tabsJustifiedContent" class="tab-content">
						
							<div class="tab-pane fade active in" id="tab1">
							
									<h1 >
									แก้ไขเอกสารเวชระเบียน
									</h1><hr><br>
									
									 <form action="MedicRecordController.php?action=edit&medicrecord=<?php echo $medicrecordDetail['id']; ?>&srcname=<?php echo $fname; ?>" method="post" enctype="multipart/form-data">
											

											<div class="col-md-12">
												อัปโหลดเอกสารเวชระเบียน
												<br><input  type="file" name="fileToUpload" id="fileToUpload">
											</div>

											<div class="col-md-12">
												<br>เลขที่คนไข้	<input style="width:50%;"  type="text" class="form-control"  name="patient_sh" value="<?php echo $patient_text ?>" disabled/>
												<input style="width:50%;"  type="hidden" class="form-control"  name="patient" value="<?php echo $patient ?>" />
											</div>
											
					
										
											<div class="col-md-12">
												<br>วันที่ทำการบันทึก 	<input style="width:50%;"  type="text" class="form-control" name="date" id="datepicker" value="<?php echo $date; ?>"/>
											</div>
												
											<div class="col-md-12">
												<br><button type="submit" class="col-md-2 btn btn-success" type="submit">บันทึก</button>
											</div>								
									  </form>
			
							 </div>
							 
							 <div class="tab-pane fade" id="tab2">
									<div class="col-md-12">
										<img style="width:100%; " src="patient/<?php echo $medicrecordDetail['HN']; ?>/medic_record/<?php echo $fname; ?>" 
										class="pull-right img-responsive img-rounded">
									</div>
							 </div>
							<!--/tabs content-->
						</div>
					</div><!--/card-->
						
				
            </div>
            <!--/row-->
			

            <hr>

        
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
					  <p>แก้ไขข้อมูลเวชระเบียนเสร็จสิ้น</p>
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
if(isset($_GET["suc"]) == 1 )   // del
{ 
    
		echo "$('#CheckModal').modal();";
		
}
?>

function Reloadthispage()
{
	window.location.href = "MedicRecordDetail.php?medicrecord=<?php echo $id;?>";
}
</script >

	   <script>
						$( function() {
								$( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
						} );

		
		</script>
  </body>
</html>