<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["suc"]) == 1 )  
{
	$suc = $_GET["suc"];
	if($suc == 1) // del
	{
		
		$modalsuccess_txt = "ทำการยกเลิกนัดเสร็จสิ้น";
	}
	else if($suc == 2)  // add
	{
		
		$modalsuccess_txt = "ทำการเพิ่มรายการนัดหมายเสร็จสิ้น";
	}
	else if($suc == 3)  // add
	{
		
		$modalsuccess_txt = "ทำการแก้ไขรายการนัดหมายเสร็จสิ้น";
	}
}

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
    <title>ตารางนัดหมาย</title>
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
					
					<h1 >ตารางนัดหมาย</h1>
					</div>
					
					<div class="col-md-6 " style="margin-top:10px;"  align="right" >
						<a href="ScheduleAdd.php"><button class="btn btn-info tablebtn" type="button"><span class="fa fa-plus"></span> นัดหมาย</button></a>
					</div>
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
					<div class="col-md-7" ></div>
					<div class="col-md-5" >
					
					<form action="SchedulePage.php" method="post" enctype="multipart/form-data" >
						<div class="input-group">
						
							<input type="hidden" name="search_param" value="all" id="search_param">         
							<input type="text" class="form-control" name="search_txt" placeholder="ค้นหา จากชื่อ-นามสกุล  , รายการนัดหมาย , เบอร์โทร">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit"><span class="fa fa-search"></span></button>
							</span>
						</div>
					</form>
			
					</div>
					
               
				<div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="thead-inverse">
                                <tr>
                                    <th style="width:25%;">วันที่ </th>
                                    
									<th style="width:75%;">รายละเอียด</th>
									
                                   
                                </tr>
                            </thead>
                            <tbody>
								<?php 
								
								
								if($checksearch == 1)
									{$query  = "SELECT * FROM schedule_tb as sc , patient_tb as pa
									WHERE sc.HN = pa.HN AND (sc.detail LIKE '%".$search_txt."%'  OR pa.name LIKE '%".$search_txt."%' OR pa.lastname LIKE '%".$search_txt."%' OR pa.phone LIKE '%".$search_txt."%'  )
									ORDER BY date ASC ,start DESC";  }
								else{ 	$query  = "SELECT * FROM schedule_tb as sc , patient_tb as pa 
								WHERE sc.HN = pa.HN 
								ORDER BY date ASC ,start DESC";  }
								
							
								$result = mysqli_query($conn,$query); 
								
								$FindDate = "";
								while($row = mysqli_fetch_array($result)) {
									
									if($FindDate == "")
									{
										
										$FindDate = $row['date'];
										$dateoutput =  GetdayFromDate($FindDate);
										
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
									else if($FindDate != "" && $FindDate != $row['date'])
									{
										echo '</tbody></table>										
											</td>
										</tr>';
										
										$FindDate = $row['date'];
										$dateoutput =  GetdayFromDate($FindDate);
										
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
									
									$patientdetail =  GetpatientDetailFromID($conn,$row['HN']);
									
									echo '
									
												<tr>
													<td>
														<div class="col-md-2"> '.$row['start'].' - '.$row['end'].' </div>
														<div class="col-md-2"> '.$row['detail'].'</div>
														<div class="col-md-3"> '.$patientdetail['name'].' '. $patientdetail['lastname'].'</div>
														<div class="col-md-2"> '.$patientdetail['phone'].'</div>
														<div class="col-md-3" style="font-size:80%;"> 
															<a href="ScheduleDetail.php?schedule='.$row['schedule_id'].'"><button class="btn btn-success tablebtn" type="button">แก้ไข</button></a>
															<button onclick="SetScheduleid('.$row['schedule_id'].')" data-toggle="modal" data-target="#myModal" class="btn btn-danger tablebtn" type="button">ยกเลิกนัด</button>
														</div>
													</td>
												</tr>
									
										';
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

			
			           <!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">แจ้งเตือน</h4>
        </div>
        <div class="modal-body">
          <p>คุณแน่ใจนะ ว่าจะทำการยกเลิกนัด ?</p>
        </div>
        <div class="modal-footer">
          <button  onclick="GotoDel()" type="button" class="btn btn-default" data-dismiss="modal">ตกลง</button>
		  <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
        </div>
      </div>
          
          
          
        </div>
        <!--/main col-->
    </div>
	
 			           <!-- Modal -->
	<div class="modal fade" id="DelComModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">แจ้งเตือน</h4>
        </div>
        <div class="modal-body">
          <p><?php echo $modalsuccess_txt; ?></p>
        </div>
        <div class="modal-footer">
          <button  onclick="Reloadthispage()" type="button" class="btn btn-default" data-dismiss="modal">ปิด</button>
        </div>
      </div>
          
          
          
        </div>
        <!--/main col-->
    </div>       

</div>

<script >
var Scheduleid = "123";

<?php
// Check var form Get method
if(isset($_GET["suc"]) == 1 )   // del
	{ 
    
		echo "$('#DelComModal').modal();";
		
}
?>

function SetScheduleid(id)
{
	Scheduleid = id;
	
}

function GotoDel()
{
	window.location.href = "ScheduleController.php?action=del&schedule="+Scheduleid;
	
}

function Reloadthispage()
{
	window.location.href = "SchedulePage.php";
}
</script>


  </body>
</html>