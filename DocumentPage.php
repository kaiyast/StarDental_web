<?php
session_start();
include('config.php'); 


// Check var form Get method
if(isset($_GET["suc"]) == 1 )  
{
	$suc = $_GET["suc"];
	if($suc == 1) // del
	{
		
		$modalsuccess_txt = "ทำการลบข้อมูลเสร็จสิ้น";
	}
	else if($suc == 2)  // add
	{
		
		$modalsuccess_txt = "ทำการเพิ่มเอกสารเสร็จสิ้น";
	}
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
				
						
					<div class="col-md-6">
					
					<h1 >จัดการเอกสาร</h1>
					</div>
					
					<div class="col-md-6 " style="margin-top:10px;"  align="right" >
						<a href="MedicRecordAdd.php"><button class="btn btn-info tablebtn" type="button"><span class="fa fa-plus"></span> เวชระเบียน</button></a>
					</div>
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
					<div class="col-md-7" ></div>
					<div class="col-md-5" >
					
					<div class="input-group">
					
						<input type="hidden" name="search_param" value="all" id="search_param">         
						<input type="text" class="form-control" name="x" placeholder="ค้นหา จากชื่อ-นามสกุล , ชนิดของเอกสาร">
						<span class="input-group-btn">
							<button class="btn btn-default" type="button"><span class="fa fa-search"></span></button>
						</span>
					</div><br>
			
					</div>
					
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="thead-inverse">
                                <tr>
                                    <th style="width:15%;">เลขที่เอกสาร </th>
                                    <th style="width:25%;">ชนิดเอกสาร</th>
									<th style="width:25%;">ชื่อ นามสกุล</th>
                                    <th style="width:15%;">วันที่ออกเอกสาร</th>
									
                                    <th style="width:20%;"></th>
                                </tr>
                            </thead>
                            <tbody>
							
							<?php 
							
							
							$query  = "SELECT * FROM medicrecord_tb ORDER BY id"; 
								$result = mysqli_query($conn,$query); 
								while($row = mysqli_fetch_array($result)) {
									
									$patientDetail = GetpatientDetailFromID($conn,$row['HN']);
									echo 
									'
									<tr>
										<td>'.$row['id'].'</td>
										<td>เวชระเบียน</td>
										<td>'.$patientDetail['name'].' '.$patientDetail['lastname'].'</td>
										<td>'.$row['date'].'</td>
										<td>
										<a href="MedicRecordDetail.php?medicrecord='.$row['id'].'"><button class="btn btn-success tablebtn" type="button">ดูข้อมูล</button></a>
										<button onclick="SetMedicrecordid('.$row['id'].')"  data-toggle="modal" data-target="#DelCheckModal"  class="btn btn-danger tablebtn" type="button">ลบข้อมูล</button>
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
            <!--/row-->
			

            <hr>

        
          
				<!-- Modal -->
				<div class="modal fade" id="DelCheckModal" role="dialog">
				<div class="modal-dialog">
				
				  <!-- Modal content-->
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal">&times;</button>
					  <h4 class="modal-title">แจ้งเตือน</h4>
					</div>
					<div class="modal-body">
					  <p>คุณแน่ใจนะ ว่าจะทำการลบข้อมูลคนไข้ ?</p>
					</div>
					<div class="modal-footer">
					  <button  onclick="GotoDel()" type="button" class="btn btn-default" data-dismiss="modal">ตกลง</button>
					  <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
					</div>
				  </div>
					  
					  
					  
					</div>
					<!--/main col-->
				</div>
 
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
var Medicrecordid = "123";


<?php 

// Check var form Get method
if(isset($_GET["suc"]) == 1 )   // del
	{ 
    
		echo "$('#DelComModal').modal();";
		
	


}


?>

function SetMedicrecordid(id)
{
	Medicrecordid = id;

}

function GotoDel()
{
	alert(patientid);
	window.location.href = "MedicRecordController.php?action=del&medicrecord="+Medicrecordid;
	
}

function Reloadthispage()
{
	window.location.href = "DocumentPage.php";
}
</script>

  </body>
</html>