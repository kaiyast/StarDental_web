<?php
session_start();
include('config.php'); 

 if(isset($_SESSION["checklogin"]) == 1)
  {
	  if ( $_SESSION["checklogin"] == 1 ){ header( "Location: Home.php" );	}
  }
 

?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Bootstrap 4 Dashboard</title>
    <meta name="description" content="A admin dashboard theme that will get you started with Bootstrap 4. The sidebar toggles off-canvas on smaller screens. This example also include large stat blocks, modal and cards" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="generator" content="Codeply">



  </head>
  <body >
   
<div class="container-fluid" id="main">
    <div class="row row-offcanvas row-offcanvas-left">

        <!--/col-->

        <div class="col-md-12 col-lg-12 main">

            <!--toggle sidebar button-->
            <p class="hidden-md-up">
                <button type="button" class="btn btn-primary-outline btn-sm" data-toggle="offcanvas"><i class="fa fa-chevron-left"></i> Menu</button>
            </p>

           <center> <h1 class="display-1">
					Star Dental Care 
					</h1>
				  <h2>ระบบจัดการคลีนิค</h2>
			</center>
		  
		     <form action="login.php" method="post" enctype="multipart/form-data">
			   <div align="center" >
					<br>Username 			<input  style="width:60%" type="text" class="form-control"  name="username" />
					<br>Password 		<input  style="width:60%" type="password" class="form-control"  name="password" />
				</div>	
				<br>
				<center><button style="height:40px; width:30%; font-size:100%; color:white; background-color:#3399FF;" 
				type="submit" class="btn" >SUBMIT</button></center>
				
			</form>
				
        </div>
        <!--/main col-->
    </div>

</div>






  </body>
</html>