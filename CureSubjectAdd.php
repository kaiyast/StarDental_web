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
					</div>
				
					<div class="col-md-12">
					
					<center><h1 >เพิ่มรายการรักษา</h1></center>
					</div>
					

					
					
					<div class="col-md-12"  >
						<hr>
					</div>
					
				
					
					  <form action="CureSubjectController.php?action=add" method="post" enctype="multipart/form-data">
					  
					   <div class="col-sm-12">
					  
							  <div class="col-md-6">
								<br>ชื่อการรักษา    <input type="text"  class="form-control" placeholder="ถอนฟัน" name="name" />
							  </div><div class="col-md-12"></div>	
							   
							   
							   <div class="col-md-3">
								<br>ราคารักษาน้อยที่สุด 	<input value="0"  type="text" class="form-control"  name="min" />
							   </div>				
			
							  <div class="col-md-3">
								<br>ราคารักษามากที่สุด	<input  value="0" type="text" class="form-control"  name="max" />
							   </div><div class="col-md-6"></div><br>
								
							   
							   	<div class="col-md-12">	
									<br><button class="col-md-3 btn btn-success" type="submit">บันทึก</button>
								</div><div class="col-md-12"><br></div>	<br>
						
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