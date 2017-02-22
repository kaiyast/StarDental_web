             <!--toggle sidebar button-->
            <p class="hidden-md-up">
                <button type="button" class="btn btn-primary-outline btn-sm" data-toggle="offcanvas"><i class="fa fa-chevron-left"></i> Menu</button>
            </p>
 
	    <div class="col-md-3 col-lg-2 sidebar-offcanvas" id="sidebar" role="navigation">
            <ul class="nav nav-pills nav-stacked">
			<?php
				

				
				if($_SESSION["employee_status"] == "admin")
				{ echo 
					   ' <li class="nav-item"><a class="nav-link" href="DailyPatientPage.php">จัดการคนไข้ประจำวัน</a></li>
						 <li class="nav-item"><a class="nav-link" href="PatientPage.php">ทะเบียนผู้ป่วย</a></li>
						 <li class="nav-item"><a class="nav-link" href="MedicSupplyPage.php">คลังเวชภัณฑ์</a></li>
						 <li class="nav-item"><a class="nav-link" href="CureSubjectPage.php">รูปแบบการรักษา</a></li>
						 <li class="nav-item"><a class="nav-link" href="TreatmentHistoryPage.php">ประวัติการรักษา</a></li>
						 <li class="nav-item"><a class="nav-link" href="EmployeePage.php">จัดการบุคาลากร</a></li>
						 <li class="nav-item"><a class="nav-link" href="SchedulePage.php">ตารางนัดหมาย</a></li>
						 <li class="nav-item"><a class="nav-link" href="ReportPage.php">รายงานข้อมูล</a></li>						
					   ';					
				}
				else
				{
						// Getpatientdetail
						$employeeDetail = GetEmployeeFromID($conn,$_SESSION["employee_id"]);
				
						if(strpos($employeeDetail['systemaccount'],'1') !== false){echo '<li class="nav-item"><a class="nav-link" href="DailyPatientPage.php">จัดการคนไข้ประจำวัน</a></li>';}
						if(strpos($employeeDetail['systemaccount'],'2') !== false){echo '<li class="nav-item"><a class="nav-link" href="PatientPage.php">ทะเบียนผู้ป่วย</a></li>';}
						if(strpos($employeeDetail['systemaccount'],'3') !== false){echo '<li class="nav-item"><a class="nav-link" href="MedicSupplyPage.php">คลังเวชภัณฑ์</a></li>';}
						if(strpos($employeeDetail['systemaccount'],'4') !== false){echo '<li class="nav-item"><a class="nav-link" href="CureSubjectPage.php">รูปแบบการรักษา</a></li>';}
						if(strpos($employeeDetail['systemaccount'],'5') !== false){echo '<li class="nav-item"><a class="nav-link" href="TreatmentHistoryPage.php">ประวัติการรักษา</a></li>';}
						if(strpos($employeeDetail['systemaccount'],'6') !== false){echo '<li class="nav-item"><a class="nav-link" href="EmployeePage.php">จัดการบุคาลากร</a></li>';}
						if(strpos($employeeDetail['systemaccount'],'7') !== false){echo '<li class="nav-item"><a class="nav-link" href="SchedulePage.php">ตารางนัดหมาย</a></li>';}
						if(strpos($employeeDetail['systemaccount'],'8') !== false){echo '<li class="nav-item"><a class="nav-link" href="ReportPage.php">รายงานข้อมูล</a></li>	';}
				}
			?>
				
               
            </ul>
        </div>