<?php
session_start();
include('config.php'); 



// Check var form Get method
if(isset($_GET["treatment_history"]) == 0 )
	{  $id = -1; }
else
	{ $id = $_GET["treatment_history"]; }

// save session
$_SESSION["treatmenthistory_id"] = $id;
	
// Getpatientdetail
$TreatmentDetail = GetTreatmentHistoryFromID($conn,$id);
$patient = $TreatmentDetail->{'patient'};
$employee = $TreatmentDetail->{'employee'};
$curesubject_arr = $TreatmentDetail->{'curesubject_arr'};
$medicsupply_arr = $TreatmentDetail->{'medicsupply_arr'};

$treatment_date = ConvertDatetoText($TreatmentDetail->{'date'});
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ประวัติการรักษา</title>
    <meta name="description" content="A admin dashboard theme that will get you started with Bootstrap 4. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">



	
	<style>
	.tablebtn{
		
		font-size:100%;
	}
		th{
		text-align:center;
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
					
					<center><h1 >ประวัติการรักษา</h1></center>
					</div>
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
				
					
					  <form action="TreatmentHistoryController.php?action=edit&treatment_history=<?php echo $id; ?>" method="post" enctype="multipart/form-data">
					  
					   <div class="col-sm-12">
					   
					   

							   <div class="col-md-10">
							   
									<div class="col-md-12">
										<br><b>รายละเอียดคนไข้</b><hr>
									</div>
										 
							       	<div class="col-sm-3" >
										<img style="height:165px; width:100%;" src="patient/<?php echo $patient['HN']; ?>/useravata.jpg" class="pull-right img-responsive img-rounded">
									</div>
									
									<div class="col-sm-9" >
									

										<?php
										
										$medical_history = $patient['medical_history'];
										$disease = $patient['disease'];
										
										if( $medical_history == ""){$medical_history = "ไม่มี";}
										if( $disease == ""){$disease = "ไม่มี";}
									
										  echo '
												<p> HN-'.printid($patient['HN']).' : '.$patient['title'].' '.$patient['name'].' '.$patient['lastname'].'</p>
												<p> ประวัติการแพ้ยา : '.$medical_history.' </p>
												<p> โรคประจำตัว : '.$disease.' </p>
												<a href="PatientSearch.php?redirect=TreatmentHistoryDetail"><button class="btn btn-success tablebtn" type="button">เปลี่ยนผู้ป่วย</button></a>
										  ';
										?>
										
									</div>
									
							   </div>
							  
							  <div class="col-md-2">
							  
								<div style="text-align:right; padding:10px; ">
								<br><h4>TH-<?php echo printid($id); ?></h4>
								<p>เลขที่เอกสาร</p>
								<p>  <input type="text" onchange="Editdate(<?php echo $id; ?>)" id="datepicker" class="form-control" value="<?php echo $treatment_date; ?>"  /></p>
								</div>
								
							  </div>
							   
							   <div class="col-md-12">
							   
									<div class="col-md-12">
										<br><b>รายละเอียดการรักษา</b><hr>
									</div>
									
									
									<div class="table-responsive">
										<table class="table table-striped" style="text-align:center">
											
											<thead class="thead-inverse">
												<tr >
													<th  style="width:10%;">#</th>
													<th  style="width:35%;">รายการ</th>
													 <th  style="width:35%;">ค่าใช้จ่าย</th>
													 <th style="width:20%;"></th>
												</tr>
											</thead>
											
											<tbody>
												<?php
												     $count = 1;
													if($curesubject_arr[0] != "ไม่มีรายการรักษา")
													{
														foreach($curesubject_arr as  $curesubject)
														{	
															echo '
																	<tr>
																		<td> '.$count.'</td>
																		<td> '.$curesubject['name'].'</td>
																		<td> '.$curesubject['min'].' - '.$curesubject['max'].' บาท </td>
																		<td> <a href="TreatmentHistoryController.php?action=delcuresubject&treatment_history='.$id.'&curesubject='.$curesubject['id'].'"><button class="btn btn-danger tablebtn" type="button">ลบรายการ</button></a> </td>
																	</tr>
																 ';
															$count++;
														}														
													}


												?>
													<tr>
																    <td></td>
																	<td></td>
																	<td></td>
																	<td> <a href="CureSubjectSearch.php?redirect=TreatmentHistoryDetail"><button class="btn btn-info tablebtn" type="button"><span class="fa fa-plus"></span> รายการ</button></a> </td>
													</tr>
											</tbody>
											
										</table>
									</div>
					
									
								 </div>
							
								
							   <div class="col-md-12" >
							   
									<div class="col-md-12">
										<br><b>รายละเอียดเวชภัณฑ์</b><hr>
									</div>
									
									
									<div class="table-responsive"  name="madicsupply_table">
										<table class="table table-striped" style="text-align:center">
											
											<thead class="thead-inverse">
												<tr >
													<th  style="width:10%;">#</th>
													<th  style="width:35%;">รายการ</th>
													 <th  style="width:35%;">จำนวนที่ใช้</th>
													 <th style="width:20%;"></th>
												</tr>
											</thead>
											
											<tbody>
												<?php
												     $count = 1;
													 if($medicsupply_arr[0] != "ไม่มีรายการยา")
													{
														foreach($medicsupply_arr as  $medicsupply)
														{	
														$medic_id = $medicsupply->{'medicsupply'}['id'];
														
															echo '
																	<tr>
																		<td> '.$count.'</td>
																		<td> '.$medicsupply->{'medicsupply'}['name'].'</td>
																		<td> <input id="medicsupplylist'.$medic_id.'" onchange="Chancemedicsupply('.$id.','.$medic_id.',\'medicsupplylist'.$medic_id.'\','.$medicsupply->{'amount'}.')" type="number" class="form-control "  name="amount" value="'.$medicsupply->{'amount'}.'"> </td>
																		<td> <a href="TreatmentHistoryController.php?action=delmedicsupply&treatment_history='.$id.'&medicsupply='.$medicsupply->{'medicsupply'}['id'].'&medicsupply_value='.$medicsupply->{'amount'}.'"><button class="btn btn-danger tablebtn" type="button">ลบรายการ</button></a> </td>
																	</tr>
																 ';
															$count++;
														}														
													}

													
												?>
													<tr>
																    <td></td>
																	<td></td>
																	<td></td>
																	<td> <a href="MedicSupplySearch.php?redirect=TreatmentHistoryDetail"><button class="btn btn-info tablebtn" type="button"><span class="fa fa-plus"></span> เวชภัณฑ์</button></a> </td>
													</tr>
											</tbody>
											
										</table>
									</div>
					
									
								 </div>								
							   				
											
							     <div class="col-md-10">
								 
									<div class="col-md-12">
										<br><b>รายละเอียดแพทย์ที่รักษา</b><hr>
									</div>
									
									<div class="col-sm-3" >
										<img style="height:165px; width:100%;" src="employee/<?php echo $employee['id']; ?>/useravata.jpg" class="pull-right img-responsive img-rounded">
									</div>
									
									<div class="col-sm-9" >
									

										<?php
										  echo '
												<div class="col-md-12">
													<p> EM-'.printid($employee['id']).' : '.$employee['name'].' '.$employee['lastname'].'</p>
												</div>
	
												<div class="col-md-6"> ค่ารักษาจริง <br> 
													<input  type="number" class="form-control "  name="payment" value="'.$TreatmentDetail->{'payment'}.'"> 
												</div>
												
												<div class="col-md-6"> ส่วนแบ่งให้แพทย์ <br> 
													<input  type="number" class="form-control "  name="employee_earn" value="'.$TreatmentDetail->{'employee_earn'}.'"> 
												</div>

												<div class="col-md-12">
													<br><a href="EmployeeSearch.php?redirect=TreatmentHistoryDetail"><button class="btn btn-success tablebtn" type="button">เปลี่ยนแพทย์</button></a>
												</div>
												
										  ';
										?>
										
									</div>
									
									
									
								 </div>
							   
							  <div class="col-md-9"></div>
							   	<div class="col-md-3" align="left">	
									
								<br><button class="col-md-12 btn btn-success" type="submit">บันทึก</button> 
								</div><div class="col-md-12"><br></div>	<br>
						
						
						

						
								
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
					  <p>บันทึกข้อมูลเสร็จสิ้น</p>
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
?>

$( function() {
$( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
} );

function Chancemedicsupply(id,id2,elementID,oldval)
{
	
	var val = document.getElementById(elementID).value;
	
	window.location.href = "TreatmentHistoryController.php?action=addmedic&treatment_history="+id+"&medicsupply="+id2+"&value="+val+"&oldvalue="+oldval;
}

function Editdate(id)
{
	var date = document.getElementById("datepicker").value;
	
	window.location.href = "TreatmentHistoryController.php?action=editdate&treatment_history="+id+"&date="+date;
}

function Reloadthispage()
{
	window.location.href = "TreatmentHistoryDetail.php?treatment_history=<?php echo $id;?>";
}
</script >
  </body>
</html>