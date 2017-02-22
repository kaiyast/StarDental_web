<?php
session_start();
include('config.php'); 

// Check var form Get method
if(isset($_GET["medicsupply"]) == 0 )
	{  $id = -1; }
else
	{ $id = $_GET["medicsupply"]; }

// Getpatientdetail
$medicsuppyDetail = GetMedicSupplyFromID($conn,$id);

// convert 
$date = ConvertDatetoText($medicsuppyDetail['redate']);



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
				
				
					
					<div >
						<button onclick="backpage()" class="btn btn-info tablebtn" type="button"><span class="fa fa-arrow-left"></span> ย้อนกลับ</button>
					</div>
					
					<div class="col-md-12">
					
					<center><h1 >แก้ไขทะเบียนเวชภัณฑ์</h1></center>
					</div>
					

					
					<div class="col-md-12"  >
						<hr>
					</div>
					
				
					
					  <form action="MedicSupplyController.php?action=edit&medicsupply=<?php echo $medicsuppyDetail['id']; ?>" method="post" enctype="multipart/form-data">
					  
					   <div class="col-sm-9">
					  
							  <div class="col-md-12">
								<br>ชื่อเวชภัณฑ์    <input type="text"  class="form-control" placeholder="ยาเคลือบฟัน" name="name" value="<?php echo $medicsuppyDetail['name']; ?>" />
							  </div><div class="col-md-12"></div>	
							   
							   <div class="col-md-12">
								<br>รายละเอียด 	<input  placeholder="ยาใช้สำหรับเคลือบฟัน"  type="text" class="form-control"  name="detail" value="<?php echo $medicsuppyDetail['detail'];?>" />
							   </div><div class="col-md-12"></div>
							   		
							  <div class="col-md-6">
								<br>จำนวนที่จำเป็นต้องเติม	<input   type="text" class="form-control"  name="sh_amount" value="<?php echo $medicsuppyDetail['sh_amount'];?>"/>
							   </div>
								
							    <div class="col-md-6">
								<br>หน่วย  <input  placeholder="ชิ้น"  type="text" class="form-control"  name="unit" value="<?php echo $medicsuppyDetail['unit'];?>" />
							   </div><div class="col-md-12"><br></div>	
							   
							   	<div class="col-md-12">	
									<button class="col-md-3 btn btn-success" type="submit">บันทึก</button>
								</div><div class="col-md-12"><br></div>	<br>
						
						</div>
						
						<div class="col-sm-3">
						
								<img style="width:100%; height:220px;" src="medicsupply/<?php echo $medicsuppyDetail['id'];?>/supply.jpg" class="pull-right img-responsive img-rounded">
								<input class="form-control" type="file" name="fileToUpload" id="fileToUpload">
						
						</div>
						
								
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
					  <p>แก้ไขข้อมูลเวชภัณฑ์เสร็จสิ้น</p>
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

function Reloadthispage()
{
	window.location.href = "MedicSupplyDetail.php?medicsupply=<?php echo $id;?>";
}
</script >
  </body>
</html>