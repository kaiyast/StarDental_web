<?php
session_start();
include('config.php'); 

// search post
if(isset($_POST["search_txt"]) == 1 )  
{
	$checksearch = 1;
	$search_txt = $_POST["search_txt"];
}
else
{
	$checksearch = 0;
}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>นัดหมายประจำวัน</title>
    <meta name="description" content="A admin dashboard theme that will get you started with Bootstrap 4. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">



	
	<style>
			th{
		text-align:center;
	}
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
				
					<div class="col-md-6">
					
					<h1 >คนไข้ประจำวัน</h1>
					</div>
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
					<div class="col-md-7" ></div>
					<div class="col-md-5" >
					
					<form action="DailyPatientPage.php" method="post" enctype="multipart/form-data" >
						<div class="input-group">
						
							<input type="hidden" name="search_param" value="all" id="search_param">         
							<input type="text" class="form-control" name="search_txt" placeholder="ค้นหา จากชื่อ-นามสกุล  , รายการนัดหมาย , เบอร์โทร">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit"><span class="fa fa-search"></span></button>
							</span>
						</div><br>
					</form>
					
					</div>
					
					
						<div class="table-responsive">
                        <table class="table table-striped" style="">
                            <thead class="thead-inverse">
                                <tr>
                                    <th style="width:25%; text-align:center;">วันที่ </th>
                                    
									<th style="width:75%; text-align:center;">รายละเอียด</th>
									
                                   
                                </tr>
                            </thead>
                            <tbody>
								<?php 
								
								
								if($checksearch == 1)
									{
										
									$query  = "SELECT * FROM schedule_tb as sc , patient_tb as pa
									WHERE sc.HN = pa.HN AND sc.detail LIKE '%".$search_txt."%' OR pa.name LIKE '%".$search_txt."%' OR pa.lastname LIKE '%".$search_txt."%' OR pa.phone LIKE '%".$search_txt."%' 
									ORDER BY date ASC ,start DESC"; }
								else{ 	$query  = "SELECT * FROM schedule_tb ORDER BY date ASC ,start DESC";  }
								
							
								$result = mysqli_query($conn,$query); 
								
								$FindDate = "";
								$today = date("Y-m-d");  
								
								while($row = mysqli_fetch_array($result)) {
									

									if($FindDate == "" && $row['date'] == $today)
									{
										$FindDate = $today;
										$dateoutput = GetdayFromDate($FindDate);
										
										echo 
										'
										 <tr>
											<td>
											<div class="col-md-4"><center><h1>'.$dateoutput['day'].'</h1></center></div>
											<div class="col-md-8">'.$dateoutput['dayname'].' <br> '.$dateoutput['month'].' '.$dateoutput['year'].'</div>
											</td>
											
											<td>
												<table class="table"><tbody>
										';
										
										
									}
									if( $FindDate != "" &&$row['date'] == $today )
									{
										$patientdetail =  GetpatientDetailFromID($conn,$row['HN']);
									
									echo '
									
												<tr style="text-align:center;">
													<td>
														<div class="col-md-2"> '.$row['start'].' - '.$row['end'].' </div>
														<div class="col-md-3"> '.$row['detail'].'</div>
														<div class="col-md-3"> '.$patientdetail['name'].' '. $patientdetail['lastname'].'</div>
														<div class="col-md-2"> '.$patientdetail['phone'].'</div>
														<div class="col-md-2" style="font-size:80%;"> 
														<button onclick="SetPatientid('.$row['HN'].')" class="btn btn-success " style="width:100%; type="button" data-toggle="modal" data-target="#DailyModal">จัดการ</button>
														</div>
													</td>
												</tr>
									
										';
										
									}
									
									
								}
								
								
								?>
                               
									</tbody></table>										
									</td>
                                </tr>			
											
                              </tbody>
                        </table>
                    </div>		
					
					
              </div>
            </div>
            <!--/row-->
			

            <hr>

        
          
		  	<div class="modal fade" id="DailyModal" role="dialog">
					<div class="modal-dialog">
					
					  <!-- Modal content-->
					  <div class="modal-content">
						<div class="modal-header">
						  <button type="button" class="close" data-dismiss="modal">&times;</button>
						  <h4 class="modal-title">จัดการคนไข้ประจำวัน</h4>
						</div>
						<div class="modal-body">
						  
						<button class="btn btn-info tablebtn" onclick="GotoMedicRecord()" type="button"><span class="fa fa-plus"></span> เวชระเบียน</button>
						<button class="btn btn-info tablebtn" onclick="GotoTreatmentHistory()" type="button"><span class="fa fa-plus"></span>ชำระเงิน</button>
						
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

<script>

var Patientid = "123";

<?php 

// Check var form Get method
if(isset($_GET["suc"]) == 1 )   // del
	{ 
    
		echo "$('#DelComModal').modal();";
}


?>

function SetPatientid(id)
{

	Patientid = id;
	
}

function GotoMedicRecord()
{
	window.location.href = "MedicRecordAdd.php?patient="+Patientid+"&redirect=DailyPatientPage";
	
}

function Reloadthispage()
{
	window.location.href = "DailyPatientPage.php";
}

function GotoTreatmentHistory()
{
	window.location.href = "TreatmentHistoryController.php?action=adddaily&patient="+Patientid; 	
}

</script>	

  </body>
</html>