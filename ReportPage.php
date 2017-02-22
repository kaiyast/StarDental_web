<?php
session_start();
include('config.php'); 


?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>รายงานข้อมูล</title>
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
				
					<div class="col-md-12">
					
					<h1 >รายงานข้อมูล</h1>
					</div>
					
		
					<div class="col-md-12"  >
						<hr>
					</div>
					
						<a href="Report_Income_Page.php"><button class="btn btn-default" >บันทึกรายรับ</button></a><br><br>
					    <button class="btn btn-default">บันทึกรายจ่าย</button><br><br>
						<button class="btn btn-default" >บันทึกเวชภัณฑ์</button><br><br>
					
			
					
                </div>
            </div>
            <!--/row-->
		

	</div>

  </body>
</html>