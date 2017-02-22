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
		
		$modalsuccess_txt = "ทำการเพิ่มรายการเสร็จสิ้น";
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
    <title>ทะเบียนเวชภัณฑ์</title>
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
						<h1 >ทะเบียนเวชภัณฑ์</h1>
					</div>
					
					<div class="col-md-6 " style="margin-top:10px;"  align="right" >
						<a href="MedicSupplyAdd.php"><button  class="btn btn-info " type="button"><span class="fa fa-plus"></span> เวชภัณฑ์</button></a>
					</div>
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
				
					<div class="col-md-7" >
				
					</div>
					<div class="col-md-5" >
					
					<form action="MedicSupplyPage.php" method="post" enctype="multipart/form-data" >
					
						<div class="input-group">
						
							<input type="hidden" name="search_param" value="all" id="search_param">         
							<input type="text" class="form-control" name="search_txt" placeholder="ค้นหา จากชื่อเวชภัณฑ์">
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit" ><span class="fa fa-search"></span></button>
							</span>
						</div><br>
					
					</form>

			
					</div>
					
                    <div class="table-responsive">
                        <table class="table table-striped" style="text-align:center">
                            <thead class="thead-inverse">
                                <tr >
                                    <th  style="width:15%;">รหัสเวชภัณฑ์</th>
                                    <th  style="width:15%;">ชื่อเวชภัณฑ์</th>
									 <th  style="width:20%;">คงเหลือ</th>
                                    <th   style="width:20%;">รายละเอียด</th>
									
                                    <th style="width:30%;"></th>
                                </tr>
                            </thead>
                            <tbody>
							<?php
							
							if($checksearch == 1)
								{$query  = "SELECT * FROM medicsupply_tb 
								WHERE  name LIKE '%".$search_txt."%' 
								ORDER BY id"; }
							else{ $query  = "SELECT * FROM medicsupply_tb ORDER BY id"; }
							
								$result = mysqli_query($conn,$query); 
								while($row = mysqli_fetch_array($result)) {
									$table_color = "";
									if($row['amount'] <= $row['sh_amount'])
									{
										$table_color = "table-danger";
									}
									else if($row['amount'] <= ($row['sh_amount']*1.5))
									{
										
										$table_color = "table-warning";
									}
									echo 
									'
									   <tr class="'.$table_color.'">
											<td> MS-'.printid($row['id']).'</td>
											<td>'.$row['name'].'</td>
											<td>
												<center>
													<div class="col-md-5" ><h1>'.$row['amount'].'</h1></div>
													<div class="col-md-7" style="margin-top:10px;"> ( '.$row['unit'].' ) </div>
												<center>
											</td>
											<td>'.$row['detail'].'</td>
											<td>
											<button onclick="SetMedicSupplyid('.$row['id'].')" data-toggle="modal" data-target="#AddSubModal" class="btn btn-info tablebtn" type="button">เพิ่ม/ลด</button>
											<a href="MedicSupplyDetail.php?medicsupply='.$row['id'].'"><button class="btn btn-success tablebtn" type="button">แก้ไข</button></a>
											<button onclick="SetMedicSupplyid('.$row['id'].')" data-toggle="modal" data-target="#DelCheckModal"  class="btn btn-danger tablebtn" type="button">ลบข้อมูล</button>
											</td>
                                     </tr>
									
									
									';
							}
							
							?>
 
                            </tbody>
                        </table>
                    </div>
					
						      <button class="btn btn-danger"></button> คงเหลือน้อยมาก  <br>  <button class="btn btn-warning"></button> คงเหลือน้อย
							
                </div>
            </div>
            <!--/row-->
			

            <hr>

        

        <!-- Modal -->
	<div class="modal fade" id="AddSubModal" role="dialog">
		<div class="modal-dialog">
		
		  <!-- Modal content-->
		  <div class="modal-content">
			<div class="modal-header">
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			  <h4 class="modal-title">เวชภัณฑ์</h4>
			</div>
			<div class="modal-body">
				
				
				
					 <div class="col-md-8">
							<input    type="number" class="form-control"  id="Num" value="0" /> 
					 </div>
					 
					  <div class="col-md-4">
							
							<select class="form-control" id="Func" >
								<option value="add" selected>เพิ่ม</option>
								<option value="sub" >ลด</option>
							</select>
							
					  </div><div class="col-md-12"></div>
					 <br><br> 

						
				
				
			</div>
			<div class="modal-footer">
			   <button onclick="GotoAddSub()"  type="submit" class="btn btn-default" >ยืนยัน</button>
			  <button type="button" class="btn btn-default" data-dismiss="modal">ยกเลิก</button>
			</div>
		  </div>
			  
			  
			  
			</div>
			<!--/main col-->
    </div>
	
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
          <p>คุณแน่ใจนะ ว่าจะทำการลบเวชภัณฑ์ ?</p>
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
var MedicSupplyid = "123";


<?php 

// Check var form Get method
if(isset($_GET["suc"]) == 1 )   // del
	{ 
    
		echo "$('#DelComModal').modal();";
		
	


}


?>

function SetMedicSupplyid(id)
{
	
	MedicSupplyid = id;
	
}

function GotoDel()
{
	window.location.href = "MedicSupplyController.php?action=del&medicsupply="+MedicSupplyid;
	
}

function GotoAddSub()
{
	
	var Func = document.getElementById("Func").value;
	var Num = document.getElementById("Num").value;
	window.location.href = "MedicSupplyController.php?action=addsub&medicsupply="+MedicSupplyid+"&func="+Func+"&num="+Num;
}

function Reloadthispage()
{
	window.location.href = "MedicSupplyPage.php";
}
</script>
    

    
    
  </body>
</html>