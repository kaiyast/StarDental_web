<?php
session_start();
include('config.php'); 

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
					</div><br><br>
				
					<div class="col-md-12">
					
					<center><h1 >เพิ่มทะเบียนเวชภัณฑ์</h1></center>
					</div>
					
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
				
					
					  <form action="MedicSupplyController.php?action=add" method="post" enctype="multipart/form-data">
					  
					   <div class="col-sm-9">
					  
							  <div class="col-md-12">
								<br>ชื่อเวชภัณฑ์    <input type="text"  class="form-control" placeholder="ยาเคลือบฟัน" name="name" />
							  </div><div class="col-md-12"></div>	
							   
							   <div class="col-md-12">
								<br>รายละเอียด 	<input  placeholder="ยาใช้สำหรับเคลือบฟัน"  type="text" class="form-control"  name="detail" />
							   </div><div class="col-md-12"></div>
							   
							   <div class="col-md-4">
								<br>จำนวนเวชภัณฑ์ 	<input value="0"  type="text" class="form-control"  name="amount" />
							   </div>				
			
							  <div class="col-md-4">
								<br>จำนวนที่จำเป็นต้องเติม	<input  value="0" type="text" class="form-control"  name="sh_amount" />
							   </div>
								
							    <div class="col-md-4">
								<br>หน่วย  <input  placeholder="ชิ้น"  type="text" class="form-control"  name="unit" />
							   </div><div class="col-md-12"><br></div>	
							   
							   	<div class="col-md-12">	
									<button class="col-md-3 btn btn-success" type="submit">บันทึก</button>
								</div><div class="col-md-12"><br></div>	<br>
						
						</div>
						
						<div class="col-sm-3">
						
								<img style="width:90%;" src="medicsupply/no_image.jpg" class="pull-right img-responsive img-rounded">
								<input class="form-control" type="file" name="fileToUpload" id="fileToUpload">
						
						</div>
						

					   
					   	
					   


								
					  </form>
             
                </div>
            </div>
            <!--/row-->
			

        

        
          
          
          
          
        </div>
        <!--/main col-->
    </div>

</div>

  </body>
</html>