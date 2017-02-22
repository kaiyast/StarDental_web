<?php
session_start();
include('config.php'); 

$search = 0;
if(isset($_GET['action'])== 1){ $search = 1;}

if($search == 1)
{
	$month = $_POST['month'];
	$year = $_POST['year'];
	$year_txt = $year;

	$date = ($year-543)."-".$month."-01";

	$date = GetdayFromDate($date);
	
	
	$month_txt = $date['month'];
}
else
{
	$date = GetNowDate();
	
	$date = GetdayFromDate($date);

	$month = $date['date']->format('m');;
	$year = $date['year'];
	
	
	$month_txt = $date['month'];
	$year_txt = $date['year'];
}
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
					
					<h1 >บันทึกรายรับ  <?php echo "ประจำเดือน ".$month_txt." ".$year_txt;  ?></h1>
					</div>
					
		
					<div class="col-md-12"  >
						<hr>
					</div>
					
					<div class="col-md-7" >
					
					</div>
					<div class="col-md-5" >
					
					<form action="Report_Income_Page.php?action=searchdate" method="post" enctype="multipart/form-data" >
						<div class="input-group">
						
	
	
							
							<select   class="form-control" name="month" >
								<option value="01" <?php if($month == 1){echo "selected";} ?> >มกราคม</option>
								<option value="02" <?php if($month == 2){echo "selected";} ?> >กุมภาพันธ์</option>
								<option value="03" <?php if($month == 3){echo "selected";} ?> >มีนาคม</option>
								<option value="04" <?php if($month == 4){echo "selected";} ?> >เมษายน</option>
								<option value="05" <?php if($month == 5){echo "selected";} ?> >พฤษภาคม</option>
								<option value="06" <?php if($month == 6){echo "selected";} ?> >มิถุนายน</option>
								<option value="07" <?php if($month == 7){echo "selected";} ?> >กรกฎาคม</option>
								<option value="08" <?php if($month == 8){echo "selected";} ?> >สิงหาคม</option>
								<option value="09" <?php if($month == 9){echo "selected";} ?> >กันยายน</option>
								<option value="10" <?php if($month == 10){echo "selected";} ?> >ตุลาคม</option>
								<option value="11" <?php if($month == 11){echo "selected";} ?> >พฤศจิกายน</option>
								<option value="12" <?php if($month == 12){echo "selected";} ?> >ธันวาคม</option>
							</select>
							<select  class="form-control"  name="year" >
							<?php 
								for($i = 2559;$i < 2575;$i++)
								{
									
									echo '<option value="'.$i.'"';
									if($year == $i){echo "selected";}
									echo '>'.$i.'</option>';
								}
							?>
								
							</select>

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
											<th style="width:20%; text-align:center;">วันที่ </th>
											<th style="width:25%; text-align:center;">รายละเอียด</th>
											<th style="width:25%; text-align:center;">คนไข้</th>
											<th style="width:30%; text-align:center;">รายได้</th>

										   
										</tr>
									</thead>
									<tbody>
										<?php 
										
										$income_all = 0;
									
												
											$query  = "SELECT * FROM treatment_history_tb 
											WHERE date Like '%".($year-543)."-".$month."%' 
											ORDER BY date ASC "; 
									
											
									
										$result = mysqli_query($conn,$query); 
										
										while($row = mysqli_fetch_array($result)) {
											
											$patient = GetpatientDetailFromID($conn,$row['patient_id']);
											$income = ($row['payment']-$row['employee_earn']);
											$date = GetdayFromDate($row['date']);
											
											echo ' <tr >
														<td>'.$date['day'].' '.$date['month'].' '.$date['year'].'</td>

														<td><a target="_blank" href="TreatmentHistoryDetail.php?treatment_history='.$row['id'].'">เงินค่ารักษาพยาบาล</a></td>
														<td><a target="_blank" href="PatientDetail.php?patient='.$row['patient_id'].'">'.$patient['title'].' '.$patient['name'].' '.$patient['lastname'].'</a></td>
														<td>'.number_format($income,2).'</td>
														
													</tr> ';
													
													$income_all += $income;
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





  </body>
</html>