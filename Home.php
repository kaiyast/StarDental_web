<?php
session_start();
include('config.php'); 





	$count_patient = 0;
	
		$query  = "SELECT * FROM patient_tb  "; 
		$result = mysqli_query($conn,$query); 
		while($row = mysqli_fetch_array($result)) {$count_patient++;}

	$count_schedule = 0;
	$today = date("Y-m-d");  
		$query  = "SELECT * FROM schedule_tb WHERE date Like '".$today."'  "; 
		$result = mysqli_query($conn,$query); 
		while($row = mysqli_fetch_array($result)) {$count_schedule++;}
	
	$count_medicsupply = 0;
	
		$query  = "SELECT * FROM medicsupply_tb  "; 
		$result = mysqli_query($conn,$query); 
		while($row = mysqli_fetch_array($result)) {$count_medicsupply++;}
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>หน้าหลัก</title>
    <meta name="description" content="A admin dashboard theme that will get you started with Bootstrap 4. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">




  </head>
  <body >

  
<?php  include('header.php'); 	 ?>
 
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">
	
	<br><br>
	
       <?php  include('menubar.php'); 	 ?>
	   
        <!--/col-->

        <div class="col-md-9 col-lg-10 main">



       


            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="card card-inverse card-success " style="height:30%;">
                        <div class="card-block bg-success">
                            <div class="rotate">
                                <i class="fa fa-user fa-5x"></i>
                            </div>
                            <h6 class="text-uppercase">ผู้ป่วย</h6>
                            <h1 class="display-1"><?php echo $count_patient; ?></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card card-inverse card-danger" style="height:30%;">
                        <div class="card-block bg-danger">
                            <div class="rotate">
                                <i class="fa fa-list fa-4x"></i>
                            </div>
                            <h6 class="text-uppercase">เวชภัณฑ์</h6>
                            <h1 class="display-1"><?php echo $count_medicsupply; ?></h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="card card-inverse card-info" style="height:30%;">
                        <div class="card-block bg-info">
                            <div class="rotate">
                                <i class="fa fa-twitter fa-5x"></i>
                            </div>
                            <h6 class="text-uppercase">รายการนัดหมายประจำวัน</h6>
                            <h1 class="display-1"><?php echo $count_schedule; ?></h1>
                        </div>
                    </div>
                </div>
            </div>
            <!--/row-->

            <hr>

        
          
          
          
          
        </div>
        <!--/main col-->
    </div>

</div>



 
  </body>
</html>