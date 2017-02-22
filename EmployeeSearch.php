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

// redirect get
if(isset($_GET["redirect"]) == 1 )  
{
	
	$redirect = $_GET["redirect"];
}
else
{
	$redirect = "TreatmentHistoryDetail";
}
?>



<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>ค้นหาบุคลากร</title>
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
				
					<div class="col-md-6"  >
						<h1 >ค้นหาบุคลากร</h1>
					</div>
					
					
					
				
					<div class="col-md-7" ></div>
					<div class="col-md-5" >
					
					<form action="EmployeeSearch.php?redirect=<?php echo $redirect; ?>" method="post" enctype="multipart/form-data" >
					
						<div class="input-group">
						
							<input type="hidden" name="search_param" value="all" id="search_param">         
							<input type="text" class="form-control" name="search_txt" placeholder="ค้นหา จากชื่อ-นามสกุล , เบอร์โทรศัพท์">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit" ><span class="fa fa-search"></span></button>
							</span>
						</div><br>
					
					</form>

			
					</div>
					
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="thead-inverse">
                                <tr>
                                    <th style="width:20%;">ID</th>
                                    <th style="width:80%;">รายละเอียด</th>
                                </tr>
                            </thead>
                            <tbody>
							<?php
							
							if($checksearch == 1)
								{$query  = "SELECT * FROM employee_tb 
								WHERE ( phone LIKE '%".$search_txt."%' OR name LIKE '%".$search_txt."%' OR lastname LIKE '%".$search_txt."%' ) AND status LIKE 'แพทย์'
								ORDER BY id"; }
							else{ $query  = "SELECT * FROM employee_tb WHERE status LIKE 'แพทย์' ORDER BY id"; }
							
								$result = mysqli_query($conn,$query); 
								while($row = mysqli_fetch_array($result)) {
									
									echo 
									'
									   <tr>
											<td>
												<img style="height:150px; width:100%;" src="employee/'.$row['id'].'/useravata.jpg" class="pull-right img-responsive img-rounded">
												<br><center> EM-'.printid($row['id']).'<center>
											</td>
											<td>
											
											<p style="margin-top:3px;">'.$row['name'].' '.$row['lastname'].'</p>
											<p style="margin-top:3px;"> เบอร์โทรศัพท์  : '.$row['phone'].'</p>
											
											
											
									';
										
									if($redirect != "TreatmentHistoryDetail") // normal search case
									{
										echo '	<a href="'.$redirect.'.php?search_output='.$row['id'].'&searchsuccess=1"><button class="col-md-3 btn btn-success tablebtn" type="button">เลือก</button></a> ';
									}
									else
									{
										$treatment_history = $_SESSION["treatmenthistory_id"];
										echo '	<a href="TreatmentHistoryController.php?action=changeemployee&searchoutput='.$row['id'].'&treatment_history='.$treatment_history.'"><button class="col-md-3 btn btn-success tablebtn" type="button">เลือก</button></a> ';
									}	
									
									echo 
									'		</td>
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

function GotoDel()
{
	window.location.href = "PatientController.php?action=del&patient="+Patientid;
	
}

function Reloadthispage()
{
	window.location.href = "PatientPage.php";
}
</script>
    

    
    
  </body>
</html>