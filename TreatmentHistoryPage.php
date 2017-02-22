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
		
		$modalsuccess_txt = "ทำการเพิ่มรายการประวัติการรักษาเสร็จสิ้น";
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
    <title>ประวัติการรักษา</title>
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
				
					<div class="col-md-6"  >
						<h1 >ประวัติการรักษา</h1>
					</div>
					
					<div class="col-md-6 " style="margin-top:10px;"  align="right" >
						<a href="TreatmentHistoryController.php?action=add"><button  class="btn btn-info " type="button"><span class="fa fa-plus"></span> ประวัติการรักษา</button></a>
					</div>
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
				
					<div class="col-md-7" >
				
					</div>
					<div class="col-md-5" >
					
					<form action="TreatmentHistoryPage.php" method="post" enctype="multipart/form-data" >
					
						<div class="input-group">
						
							<input type="hidden" name="search_param" value="all" id="search_param">         
							<input type="text" class="form-control" name="search_txt" placeholder="ค้นหา จากชื่อคนไข้ หรือ แพทย์ ">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit" ><span class="fa fa-search"></span></button>
							</span>
						</div>
					
					</form>

			
					</div>
					
                    <div class="table-responsive">
                        <table class="table table-striped" style="text-align:center">
                            <thead class="thead-inverse">
                                <tr >
                                    <th  style="width:15%;">รหัสการรักษา</th>
									 <th  style="width:15%;">รูปแบบการรักษา</th>
                                    <th  style="width:25%;">ชื่อผู้ป่วย</th>
									 <th  style="width:25%;">ชื่อแพทย์</th>
                                     <th style="width:20%;"></th>
                                </tr>
                            </thead>
                            <tbody>
							<?php
							
							if($checksearch == 1)
								{$query  = "SELECT * FROM treatment_history_tb ORDER BY id"; }
							else{$query  = "SELECT * FROM treatment_history_tb ORDER BY id";  }
							
								$result = mysqli_query($conn,$query); 
								while($row = mysqli_fetch_array($result)) {
									
									$TreatmentDetail = GetTreatmentHistoryFromID($conn,$row['id']);
									$patientFullname = $TreatmentDetail->{'patient'}['name'].' '.$TreatmentDetail->{'patient'}['lastname'];
									$employeeFullname = $TreatmentDetail->{'employee'}['name'].' '.$TreatmentDetail->{'employee'}['lastname'];
									
									$curesubject = "ไม่มีรายการรักษา" ;
									if( $TreatmentDetail->{'curesubject_arr'}[0] != "ไม่มีรายการรักษา"){ $curesubject = $TreatmentDetail->{'curesubject_arr'}[0]['name']; }
									echo 
									'
									   <tr >
											<td> TH-'.printid($TreatmentDetail->{'id'}).'</td>
											<td>'.$curesubject.'</td>
											<td>'.$patientFullname.'</td>
											<td>'.$employeeFullname.'</td>
											<td>
											<a href="TreatmentHistoryDetail.php?treatment_history='.$row['id'].'"><button class="btn btn-success tablebtn" type="button">จัดการ</button></a>
											<button onclick="SetTreatmentid('.$row['id'].')" data-toggle="modal" data-target="#DelCheckModal"  class="btn btn-danger tablebtn" type="button">ลบข้อมูล</button>
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
          <p>คุณแน่ใจนะ ว่าจะทำการลบรายการการรักษา ?</p>
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
var Treatmentid = "123";


<?php 

// Check var form Get method
if(isset($_GET["suc"]) == 1 )   // del
	{ 
		echo "$('#DelComModal').modal();";
	}

?>

function SetTreatmentid(id)
{
	Treatmentid = id;
}

function GotoDel()
{
	window.location.href = "TreatmentHistoryController.php?action=del&treatment_history="+Treatmentid;
}

function Reloadthispage()
{
	window.location.href = "TreatmentHistoryPage.php";
}
</script>
    

    
    
  </body>
</html>