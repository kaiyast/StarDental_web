<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["patient"]) == 0 )
	{  $id = -1; }
else
	{ $id = $_GET["patient"]; }

// Getpatientdetail
$patientDetail = GetpatientDetailFromID($conn,$id);

// convert 
$date = ConvertDatetoText($patientDetail['birthday']);

?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ทะเบียนผู้ป่วย</title>
    <meta name="description" content="A admin dashboard theme that will get you started with Bootstrap 4. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">



	
	<style>
	.tablebtn{
		
		font-size:100%;
	}
		.mustform{
		color:red;
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
				
				<button onclick="backpage()" class="btn btn-info tablebtn" type="button"><span class="fa fa-arrow-left"></span> ย้อนกลับ</button>
			
					<div align="right" >
						<font style="font-size:150%;"><?php
						
						echo " ".printid($patientDetail['HN'])." : ".$patientDetail['title']." ".$patientDetail['name']." ".$patientDetail['lastname']

						?></font>	
					</div>
					
				    <div class="card card-default card-block">
                        <ul id="tabsJustified" class="nav nav-tabs nav-justified">
                            <li class="nav-item">
                                <a class="nav-link " href="" data-target="#tab1" data-toggle="tab">ข้อมูลทั่วไป</a>
                            </li>
							<li class="nav-item">
                                <a class="nav-link " href="" data-target="#tab3" data-toggle="tab">ประวัติการนัดพบ</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="" data-target="#tab2" data-toggle="tab">ประวัติเอกสาร</a>
                            </li>
							<li class="nav-item">
                            </li>
                        </ul>
						

					

					
                        <!--/tabs-->
                        <br>
                        <div id="tabsJustifiedContent" class="tab-content">
                            <div class="tab-pane fade active in" id="tab1">
							
							
                                 <form action="PatientController.php?action=edit&patient=<?php echo $patientDetail['HN']; ?>" method="post" enctype="multipart/form-data" onsubmit="return Checkformaddpatient()">
								 
								 
								    <div class="col-sm-9">
									
										<div class="col-md-12">
											<br><b>ข้อมูลส่วนตัว</b><hr>
											</div>
										
										<div class="col-md-6">
											<br>HN 	<input   type="text" class="form-control"  name="HN" value="<?php echo printid($patientDetail['HN']); ?>" disabled/>
										</div>
										
										<div class="col-md-6">
										<br>เลขที่บัตรประชาชน <i class="mustform">*</i>	<input   type="text" id="ssn" class="form-control"  name="SSN"  value="<?php echo $patientDetail['SSN']; ?>" maxlength="13"/>
										</div>
										
										<div class="col-md-4" >
											<br>คำนำหน้าชื่อ 	<select class="form-control" name="title" >
																<?php
																	
																    if($patientDetail['title'] == "นาย")
																	{echo '<option value="นาย" selected>นาย</option>';}
																	else 
																	{echo '<option value="นาย" >นาย</option>';}
																	
																    if($patientDetail['title'] == "นางสาว")
																	{echo '<option value="นางสาว" selected>นางสาว</option>';}
																	else 
																	{echo '<option value="นางสาว" >นางสาว</option>';}

																    if($patientDetail['title'] == "นาง")
																	{echo '<option value="นาง" selected>นาง</option>';}
																	else 
																	{echo '<option value="นาง" >นาง</option>';}

																    if($patientDetail['title'] == "เด็กชาย")
																	{echo '<option value="เด็กชาย" selected>เด็กชาย</option>';}
																	else 
																	{echo '<option value="เด็กชาย" >เด็กชาย</option>';}

																    if($patientDetail['title'] == "เด็กหญิง")
																	{echo '<option value="เด็กหญิง" selected>เด็กหญิง</option>';}
																	else 
																	{echo '<option value="เด็กหญิง" >เด็กหญิง</option>';}
																
																?>
															 
															</select>
										</div>
										
										<div class="col-md-4">
											<br>เพศ 	<select class="form-control" name="gender" >
																<?php
																	
																    if($patientDetail['gender'] == "ชาย")
																	{echo '<option value="ชาย" selected>ชาย</option>';}
																	else 
																	{echo '<option value="ชาย" >ชาย</option>';}
																	
																    if($patientDetail['gender'] == "หญิง")
																	{echo '<option value="หญิง" selected>หญิง</option>';}
																	else 
																	{echo '<option value="หญิง" >หญิง</option>';}
																?>
															</select>
											</div>
											
											
									    <div class="col-md-6">
										<br>ชื่อ <i class="mustform">*</i>	<input   type="text" id="name" class="form-control"  name="name" value="<?php echo $patientDetail['name']; ?>" />
										</div>
										
									    <div class="col-md-6">
										<br>นามสกุล <i class="mustform">*</i>	<input   type="text"  id="lastname" class="form-control"  name="lastname" value="<?php echo $patientDetail['lastname']; ?>" />
										</div>


										
									</div>
                                    <br><br><br><div class="col-sm-3" align="right">
									
										<img style="width:100%; height:220px;" src="patient/<?php echo $id; ?>/useravata.jpg" class="pull-right img-responsive img-rounded">
										
										<input class="form-control" type="file" name="fileToUpload" id="fileToUpload">
									</div>
									
								 	<div class="col-md-12">	
										<div class="col-md-6">
										
									
										<br>วันเกิด <input type="text" id="datepicker" class="form-control" value="<?php echo $date; ?>" name="birthday" />
										
										</div>

										<div class="col-md-2">
										<br>อายุ 	<input   type="number" class="form-control"  name="age" value="<?php echo $patientDetail['age']; ?>"/>
										</div>


										
										<div class="col-md-2">
											<br>หมู่เลือด 	<select class="form-control" name="bloodtype" >
																<?php
																	
																    if($patientDetail['bloodtype'] == "A")
																	{echo '<option value="A" selected>A</option>';}
																	else 
																	{echo '<option value="A" >A</option>';}
																	
																    if($patientDetail['bloodtype'] == "B")
																	{echo '<option value="B" selected>B</option>';}
																	else 
																	{echo '<option value="B" >B</option>';}
																
																    if($patientDetail['bloodtype'] == "AB")
																	{echo '<option value="AB" selected>AB</option>';}
																	else 
																	{echo '<option value="AB" >AB</option>';}

																    if($patientDetail['bloodtype'] == "O")
																	{echo '<option value="O" selected>O</option>';}
																	else 
																	{echo '<option value="O" >O</option>';}																
																?>											
															</select>
										</div>
											
										<div class="col-md-2">
											<br>สถานภาพ 	<select class="form-control" name="marry" >
																<?php
																	
																    if($patientDetail['marry'] == "โสด")
																	{echo '<option value="โสด" selected>โสด</option>';}
																	else 
																	{echo '<option value="โสด" >โสด</option>';}
																	
																    if($patientDetail['marry'] == "สมรส")
																	{echo '<option value="สมรส" selected>สมรส</option>';}
																	else 
																	{echo '<option value="สมรส" >สมรส</option>';}
																															
																?>												

															</select>
										</div>

										<div class="col-md-12"></div>
										<div class="col-md-2">
											<br>สัญชาติ 	<input   type="text" class="form-control"  name="national" value="<?php echo $patientDetail['national']; ?>" />
										</div>


										
										<div class="col-md-2">
											<br>ศาสนา 	<select class="form-control" name="religion"  >
																<?php
																	
																    if($patientDetail['religion'] == "พุทธ")
																	{echo '<option value="พุทธ" selected>พุทธ</option>';}
																	else 
																	{echo '<option value="พุทธ" >พุทธ</option>';}
																	
																    if($patientDetail['religion'] == "คริสต์")
																	{echo '<option value="คริสต์" selected>คริสต์</option>';}
																	else 
																	{echo '<option value="คริสต์" >คริสต์</option>';}

																    if($patientDetail['religion'] == "อิสลาม")
																	{echo '<option value="อิสลาม" selected>อิสลาม</option>';}
																	else 
																	{echo '<option value="อิสลาม" >อิสลาม</option>';}																
																?>												
															</select>
										</div>

										<div class="col-md-4">
											<br>อาชีพ 	<input   type="text" class="form-control"  name="job" value="<?php echo $patientDetail['job']; ?>" />
										</div>
										
										<div class="col-md-4">
											<br>สถานที่ทำงาน 	<input   type="text" class="form-control"  name="addr_work" value="<?php echo $patientDetail['addr_work']; ?>" />
										</div>

										<div class="col-md-6">
											<br>เบอร์โทรติดต่อ <i class="mustform">*</i>	<input  id="phone" type="text" class="form-control"  name="phone" value="<?php echo $patientDetail['phone']; ?>" maxlength="10"/>
										</div>
										
										<div class="col-md-6">
											<br>อีเมล 	<input   type="text" class="form-control"  name="email" value="<?php echo $patientDetail['email']; ?>"/>
										</div>

										<div class="col-md-12">
										<br><b>ข้อมูลผู้ติดต่อในกรณีฉุกเฉิน</b><hr>
										</div>

										<div class="col-md-6">
											<br>ชื่อ นามสกุล 	<input   type="text" class="form-control"  name="emer1_name" value="<?php echo $patientDetail['emer1_name']; ?>"/>
										</div>
										
										<div class="col-md-6">
											<br>เบอร์โทรติดต่อ 	<input   type="text" class="form-control"  name="emer1_phone" value="<?php echo $patientDetail['emer1_phone']; ?>"/>
										</div>
										
										<div class="col-md-6">
											<br>ชื่อ นามสกุล 	<input   type="text" class="form-control"  name="emer2_name" value="<?php echo $patientDetail['emer2_name']; ?>"/>
										</div>
										
										<div class="col-md-6">
											<br>เบอร์โทรติดต่อ 	<input   type="text" class="form-control"  name="emer2_phone" value="<?php echo $patientDetail['emer2_phone'];  ?>"/>
										</div>
										
										<div class="col-md-12">
										<br><b>ข้อมูลที่อยู่</b><hr>
										</div>
										
										<div class="col-md-2">
											<br>เลขที่ 	<input   type="text" class="form-control"  name="addr_num" value="<?php echo $patientDetail['addr_num']; ?>"/>
										</div>

										<div class="col-md-2">
											<br>หมู่ 	<input   type="text" class="form-control"  name="addr_swine" value="<?php echo $patientDetail['addr_swine']; ?>"/>
										</div>

										<div class="col-md-3">
											<br>ถนน 	<input   type="text" class="form-control"  name="addr_road" value="<?php echo $patientDetail['addr_road']; ?>"/>
										</div>

										<div class="col-md-5">
											<br>ตำบล 	<input   type="text" class="form-control"  name="addr_district" value="<?php echo $patientDetail['addr_district']; ?>"/>
										</div>

										<div class="col-md-4">
											<br>อำเภอ 	<input   type="text" class="form-control"  name="addr_canton" value="<?php echo $patientDetail['addr_canton']; ?>"/>
										</div>

										<div class="col-md-5">
											<br>จังหวัด 	<input   type="text" class="form-control"  name="addr_province" value="<?php echo $patientDetail['addr_province']; ?>"/>
										</div>
										
										<div class="col-md-3">
											<br>รหัสไปรษณีย์ 	<input   type="text" class="form-control"  name="zipcode" value="<?php echo $patientDetail['zipcode']; ?>"/>
										</div>	

										<div class="col-md-12">
										<br><b>ข้อมูลด้านสุขภาพ</b><hr>
										</div>

										<div class="col-md-6">
											<br>ประวัติการแพ้ยา	<input   type="text" class="form-control"  name="medical_history" value="<?php echo $patientDetail['medical_history']; ?>"/>
										</div>
										
										<div class="col-md-6">
											<br>โรคประจำตัว 	<input   type="text" class="form-control"  name="disease" value="<?php echo $patientDetail['disease']; ?>"/>
										</div>	
										
										<div class="col-md-12">
										<br><b>ข้อมูลสิทธิการรักษา</b><hr>
										</div>

										<div class="col-md-3">
												
											  <input type="checkbox" name="treatment[]" value="เงินสด" <?php if(strpos($patientDetail['treatment'],'เงินสด') !== false){echo "checked";}?> > เงินสด<br>
											  <input type="checkbox" name="treatment[]" value="ราชการ" <?php if(strpos($patientDetail['treatment'],'ราชการ') !== false){echo "checked";}?> > ราชการ<br>
											  <input type="checkbox" name="treatment[]" value="ประกันสังคม" <?php if(strpos($patientDetail['treatment'],'ประกันสังคม')!== false){echo "checked";}?> > ประกันสังคม<br>
											  <input type="checkbox" name="treatment[]" value="ประกันสุขภาพ" <?php if(strpos($patientDetail['treatment'],'ประกันสุขภาพ') !== false){echo "checked";}?> > ประกันสุขภาพ<br>
											  <input type="checkbox" name="treatment[]" value="รัฐวิสหกิจ" <?php if(strpos($patientDetail['treatment'],'รัฐวิสหกิจ') !== false){echo "checked";}?> > รัฐวิสหกิจ<br>
								  
										</div>	
										
										<div class="col-md-12">
										<br>	
											<button class="col-md-2 btn btn-success" type="submit">บันทึก</button>
										</div>
								</div>
								
								</form>
								
								
                            </div>
							<div class="tab-pane fade " id="tab2">
											

								
                                <div class="row">
                                    <div class="col-sm-12">
                                        
												<div class="col-md-12"   align="right" >
													<a href="MedicRecordAdd.php?redirect=PatientDetail&patient=<?php echo $id; ?>"><button class="btn btn-info tablebtn" type="button"><span class="fa fa-plus"></span> เวชระเบียน</button></a>
												</div>
												<div class="col-md-12 "  ><br></div>
										
										       <div class="table-responsive" >
												<table class="table table-striped">
													<thead class="thead-inverse">
														<tr>
															<th style="width:25%;">รหัสเอกสาร</th>
															<th style="width:25%;">ชนิดเอกสาร</th>
															
															<th style="width:25%;">วันที่ออกเอกสาร</th>
															
															<th style="width:25%;"></th>
														</tr>
													</thead>
													<tbody>													
																					
							<?php 
							
							// medicrecord
							$query  = "SELECT * FROM medicrecord_tb Where HN = '".$id."' ORDER BY id  "; 
								$result = mysqli_query($conn,$query); 
								while($row = mysqli_fetch_array($result)) {
									
									echo 
									'
									<tr>
										<td>MR-'.printid($row['id']).'</td>
										<td>เวชระเบียน</td>
										<td>'.$row['date'].'</td>
										<td>
										<a href="MedicRecordDetail.php?medicrecord='.$row['id'].'"><button class="btn btn-success tablebtn" type="button">ดูข้อมูล</button></a>
										<button onclick="SetMedicrecordid('.$row['id'].','.$row['HN'].')"  data-toggle="modal" data-target="#DelCheckModal"  class="btn btn-danger tablebtn" type="button">ลบข้อมูล</button>
										</td>
									</tr>
									
									
									';
								}
								
							
							?>
													</tbody>
												</table>
											</div>
					
                                    </div>
                                   
                                </div>
                                
                                <div class="spacer5"></div>
                            </div>
                     		<div class="tab-pane fade " id="tab3">
									<div class="row">
										<div class="col-sm-12">
											
											
													<div class="col-md-12 "  align="right" >
														<a href="ScheduleAdd.php?redirect=PatientDetail&patient=<?php echo $id; ?>"><button class="btn btn-info tablebtn" type="button"><span class="fa fa-plus"></span> นัดหมาย</button></a>
													</div>
													
													<div class="col-md-12 ">	<br>  </div>
												
												   <div class="table-responsive">
													<table class="table table-striped">
														<thead class="thead-inverse">
															<tr>
																<th style="width:25%;">วันที่</th>
																<th style="width:25%;">ช่วงเวลา</th>
																<th style="width:25%;">รายละเอียด</th>
																<th style="width:25%;"></th>
															</tr>
														</thead>
														<tbody>
														<?php 
														
															$query  = "SELECT * FROM schedule_tb Where HN = '".$id."' ORDER BY date ASC ,start DESC"; 
															$result = mysqli_query($conn,$query); 
															while($row = mysqli_fetch_array($result)) {
																
																$FindDate = $row['date'];
																$date =  GetdayFromDate($FindDate);
																$dateoutput = $date['day'].' '.$date['month'].' '.$date['year'];
																echo 
																'
																		<tr>
																			<td>'.$dateoutput.'</td>
																			<td>'.$row['start'].' - '.$row['end'].'</td>
																			<td>'.$row['detail'].'</td>
																			<td>
																			<a href="ScheduleDetail.php?redirect=PatientDetail&patient='.$id.'&schedule='.$row['schedule_id'].'"><button class="btn btn-success tablebtn" type="button">แก้ไข</button></a>
																			<button onclick="SetScheduleid('.$row['schedule_id'].','.$id.')" data-toggle="modal" data-target="#DelCheckModal" class="btn btn-danger tablebtn" type="button">ยกเลิกนัด</button>
																			</td>
																		</tr>
																
																';
															}
														?>
															
														</tbody>
													</table>
												</div>
						
										</div>
									   
									</div>
									
									<div class="spacer5"></div>
								</div>
                
						</div>
                        <!--/tabs content-->
                    </div><!--/card-->
                
				
               </div>
			   
                </div>
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
					  <p>แก้ไขข้อมูลคนไข้เสร็จสิ้น</p>
					</div>
					<div class="modal-footer">
					  <button onclick="Reloadthispage()" type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
					</div>
				  </div>
					  
					  
					  
					</div>
					<!--/main col-->
				</div>
	
                <!-- Modal 2 ------------------->
				<div class="modal fade" id="CheckFormModal" role="dialog">
				<div class="modal-dialog">
				
				  <!-- Modal content-->
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">แจ้งเตือน</h4>
					</div>
					<div class="modal-body">
					  <p>เกิดปัญหาในการแก้ไขรายการคนไข้</p>
					  <p>กรุณาตรวจสอบ </p>
					  <p>- รหัสบัตรประชาชน ไม่ครบ13หลัก หรือ พิมพ์รหัสผิด </p>
					  <p>- ใส่เบอร์โทรผิด เช่น ไม่ขึ้นต้องด้วยเลข 0</p>
					  <p>- ป้อนข้อมูล <i class="mustform">*</i> ให้ครบถ้วน </p>
					  
					</div>
					<div class="modal-footer">
					  <button  type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
					</div>
				  </div>
					  
			
					</div>
					<!--/main col-->
				</div>

	
					<!-- Modal 3-------------->
								<div class="modal fade" id="DelCheckModal" role="dialog">
								<div class="modal-dialog">
								
								  <!-- Modal content-->
								  <div class="modal-content">
									<div class="modal-header">
									  <button type="button" class="close" data-dismiss="modal">&times;</button>
									  <h4 class="modal-title">แจ้งเตือน</h4>
									</div>
									<div class="modal-body">
									  <p>คุณแน่ใจนะ ว่าจะทำการลบข้อมูล ?</p>
									</div>
									<div class="modal-footer">
									  <button  onclick="GotoDel()" type="button" class="btn btn-default" data-dismiss="modal">ตกลง</button>
									  <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
									</div>
								  </div>	  
									  
									</div>
									<!--/main col-->
								</div>
								
</div>

<script >

var scheduleid = "null";
var Medicrecordid = "null";
var patientid = "null";

<?php
// Check var form Get method
if(isset($_GET["suc"]) == 1 )   
{ 
    
		echo "$('#CheckModal').modal();";
		
}
?>

function Reloadthispage()
{
	window.location.href = "PatientDetail.php?patient=<?php echo $id;?>";
}

function SetMedicrecordid(id,id2)
{
	Medicrecordid = id;
	patientid = id2;
}
function SetScheduleid(id,id2)
{
	scheduleid = id;
	patientid = id2;
}


function GotoDel()
{
	if(Medicrecordid != "null"){ 	window.location.href = "MedicRecordController.php?action=del&medicrecord="+Medicrecordid+"&patient="+patientid; }
	else if(scheduleid != "null"){ window.location.href = "ScheduleController.php?redirect=PatientDetail&action=del&schedule="+scheduleid+"&patient="+patientid;
	}

	
}

$( function() {
$( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
} );

</script >

  </body>
</html>