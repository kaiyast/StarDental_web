<?php
session_start();
include('config.php'); 

$search = 0;
if(isset($_GET['action'])== 1){ $search = 1;}

if($search == 1)
{
	$input_date = $_POST['date'];
	$date = ConvertTexttoDate($_POST['date']);
	
}
else
{
	$input_date = ConvertDatetoText(GetNowDate());
	$date = GetNowDate();		
}

	$date = GetdayFromDate($date);
	$month = $date['date']->format('m');;
	$year = $date['year'];
	$day = $date['day'];
	
	$day_txt = $date['dayname'];
	$month_txt = $date['month'];
	$year_txt = $date['year'];
?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>บันทึกรายรับ</title>
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
				
					<div >
						<button onclick="backpage()" class="btn btn-info tablebtn" type="button"><span class="fa fa-arrow-left"></span> ย้อนกลับ</button>
					</div><br>
					
					<div class="col-md-12">
					
					<h1 >บันทึกรายรับ </h1>
					</p><?php echo $day_txt." ที่ ".$day." ".$month_txt." ".$year_txt;  ?></p>
					</div>
					
		
					<div class="col-md-12"  >
						<hr>
					</div>
					
					<div class="col-md-7" >
					
					</div>
					<div class="col-md-5" >
					
					<form action="Report_Income_Page.php?action=searchdate" method="post" enctype="multipart/form-data" >
						<div class="input-group">
						
							<input type="text"  id="datepicker" class="form-control" name="date" value="<?php echo $input_date; ?>"  />
						
							<span class="input-group-btn">
								<button class="btn btn-default" type="submit"><span class="fa fa-search"></span></button>
							</span>
						</div><br>
					</form>
					
					</div>
					
					<div class="col-md-12"  >
					
							<div class="table-responsive">
								<table class="table table-striped" style=" text-align:center;">
									<thead class="thead-inverse">
										<tr>
											<th style="width:10%; text-align:center;">รายการ </th>
											<th style="width:30%; text-align:center;">รายละเอียด</th>
											<th style="width:30%; text-align:center;">คนไข้</th>
											<th style="width:30%; text-align:center;">รายได้</th>

										   
										</tr>
									</thead>
									<tbody>
										<?php 
										
										$income_all = 0;
										$count = 1;
										
										
											$query  = "SELECT * FROM treatment_history_tb 
											WHERE date Like '".($year-543)."-".$month."-".$day."' 
											ORDER BY date ASC "; 
									
											
									
										$result = mysqli_query($conn,$query); 
										
										while($row = mysqli_fetch_array($result)) {
											
											$patient = GetpatientDetailFromID($conn,$row['patient_id']);
											$income = ($row['payment']-$row['employee_earn']);
											$date = GetdayFromDate($row['date']);
											
											echo ' <tr >
														<td>'.$count.'</td>

														<td><a target="_blank" href="TreatmentHistoryDetail.php?treatment_history='.$row['id'].'">เงินค่ารักษาพยาบาล</a></td>
														<td><a target="_blank" href="PatientDetail.php?patient='.$row['patient_id'].'">'.$patient['title'].' '.$patient['name'].' '.$patient['lastname'].'</a></td>
														<td>'.number_format($income,2).'</td>
														
													</tr> ';
													
													$income_all += $income;
													$count++;
										}
										echo ' <tr >
										<td></td>
										<td></td>
										<td></td>
										<td></td>
												</tr >';

										?>
									   
											</tbody></table>										
											</td>
										</tr>			
													
									  </tbody>
								</table>
							</div>	
							
							
							
					</div>	
					
					<div class="col-md-8"  ></div>
					<div class="col-md-4"  > รวมรายได้สุทธิ <font style="font-size:250%;"><?php echo number_format($income_all,2);?> </font> </div>
						
                </div>
            </div>
            <!--/row-->
		

	</div>


<script>
$( function() {
$( "#datepicker" ).datepicker({ dateFormat: 'dd-mm-yy' });
} );
</script >


  </body>
</html>