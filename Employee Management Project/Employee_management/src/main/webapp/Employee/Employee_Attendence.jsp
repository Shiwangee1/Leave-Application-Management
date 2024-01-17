<%@ page import="Employee.WorkingDaysCalculator"%>
<%@ page import=" java.time.DayOfWeek"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee Dashboard</title>



<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/f327e1d3d1.js"
	crossorigin="anonymous"></script>
<style type="text/css">
.full-height-sidebar {
	height: 100vh;
	background-color: #111;
	color: white;
}

.custom-width {
	width: 280px;
}

.btn-wider {
	min-width: 150px;
}

/* Add CSS to make the right side content scrollable */
.right-content {
	overflow-y: auto;
	height: calc(100vh - 72px); /* Adjust the height as needed */
	padding: 20px;
}
</style>
<%@ include file="../CSS/pieChartCSS.jsp"%>
</head>
<body>


	<div class="row">
		<div
			class="d-flex flex-column  text-bg-dark  col-lg-2 full-height-sidebar custom-width ">
			<a href="/"
				class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
				<svg class="bi pe-none me-2" width="40" height="32">
				<use xlink:href="#bootstrap"></use></svg> <span class="fs-4">Employee
					Department </span>
			</a>
			<hr>
			<ul class="nav nav-pills flex-column mb-auto container-fluid">
				<li class="nav-item"><a href="Employee_dashboard.jsp"
					class="nav-link active" aria-current="page"> <svg
							class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#home"></use></svg> Apply Leave
				</a></li>

				<%
				int employeeId = Integer.parseInt(request.getParameter("id"));
				%>

				<li><a href="View_leave_History.jsp?id=<%=employeeId%>"
					class="nav-link text-white"> <svg class="bi pe-none me-2"
							width="16" height="16">
						<use xlink:href="#speedometer2"></use></svg> View My Leave History
				</a></li>

				<li><a href="Employee_Attendance.jsp?id=<%=employeeId%>"
					class="nav-link text-white"> <svg class="bi pe-none me-2"
							width="16" height="16">
						<use xlink:href="#speedometer2"></use></svg>Attendance
				</a></li>
				<!--  <li><a href="Departments.jsp" class="nav-link text-white">
						<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#table"></use></svg> Department Section
				</a></li>
				<li><a href="Leave_type.jsp" class="nav-link text-white"> <svg
							class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#grid"></use></svg> Leave Types
				</a></li>
				<li><a href="#" class="nav-link text-white"> <svg
							class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#people-circle"></use></svg> Manage Leaves
				</a></li>

				<li><a href="" class="nav-link text-white"> <svg
							class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#people-circle"></use></svg> Manage Admin
				</a></li> -->
			</ul>
			<hr>
			<div class="dropdown">
				<a href="#"
					class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false"> <img
					src="https://github.com/mdo.png" alt="" width="32" height="32"
					class="rounded-circle me-2"> <strong>mdo</strong>
				</a>
				<ul class="dropdown-menu dropdown-menu-dark text-small shadow">
					<li><a class="dropdown-item" href="#">New project...</a></li>
					<li><a class="dropdown-item" href="#">Settings</a></li>
					<li><a class="dropdown-item" href="#">Profile</a></li>
					<li><hr class="dropdown-divider"></li>
					<li><a class="dropdown-item" href="#">Sign out</a></li>
				</ul>
			</div>
		</div>

		<div class="container col-lg-9 bg-light mt-4 right-content">

			<div class="card-body">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="#"><h4>Employee Section</h4></a> <a
							class="navbar-brand" href="#">Employee /Attendance System</a>
						<!-- 	<button type="button" class="btn btn-primary"
							style="hight: 200px; width: 200px">Admin</button> -->



						<div class="dropdown nav-item ">
							<a class="btn btn-primary dropdown-toggle btn-lg  btn-wider "
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">User</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Log-Out</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<hr>


			<!-- ========================== -->



			<div>


				<section class="pie_chart_content">


					<div class="container">
						<div class="row">
							<div class="col-3">
								<form action="../punchIN" method="post"
									onsubmit="generateUniqueCode()">
									<!-- Hidden input field for employee ID -->
									<input type="hidden" name="employeeId" value="<%=employeeId%>">
									<input type="hidden" id="uniqueCode" name="uniqueCode" value="">
									<!-- Hidden input field for punchIN value -->
									<input type="hidden" name="punchType" value="punchIN">
									<!-- Submit button -->
									<button type="submit" id="btnPunchIn"
										class="btn btn-primary dropdown-toggle btn-lg btn-wider">Check
										IN</button>
								</form>
							</div>

							<div class="col-9 d-flex justify-content-end">
								<form action="../punchOUT" method="post">
									<!-- Hidden input field for employee ID -->
									<input type="hidden" name="employeeId" value="<%=employeeId%>">
									<!-- Hidden input field for punchOUT value -->
									<input type="hidden" name="punchOUT" value="punchOUT">
									<!-- Submit button -->
									<button type="submit"
										class="btn btn-danger dropdown-toggle btn-lg btn-wider">Check
										OUT</button>
								</form>
							</div>
						</div>



						<!-- total days  start-->
						<%
						System.out.println(" total days  start");
						%>

						<%
						String startDate = null;
						String endDate = null;
						int present = 0;
						int absent = 0;

						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							Connection conn = DriverManager
							.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
							PreparedStatement pstmt = conn.prepareStatement(
							"SELECT Joining_Date, CURDATE() as 'current_date' FROM employee_management.add_employee WHERE id=?");
							pstmt.setInt(1, employeeId);

							ResultSet rs = pstmt.executeQuery();
							if (rs.next()) {
								System.out.println("Joining date: " + rs.getString("Joining_Date"));
								System.out.println("Current Date: " + rs.getString("current_date"));

								startDate = rs.getString("Joining_Date");
								endDate = rs.getString("current_date");

								PreparedStatement checkInStatusStateSment = conn.prepareStatement(
								"Select count(*) as total from employee_management.employee_attendance where PunchIN_Time is not null and PunchOut_Time is not null and Employee_Id=?");
								checkInStatusStateSment.setInt(1, employeeId);

								ResultSet resultSet = checkInStatusStateSment.executeQuery();

								// Update the session attribute with the retrieved check-in status
								if (resultSet.next()) {
							present = resultSet.getInt("total");

								}

								else {

								}

							}
						} catch (Exception e) {
							e.printStackTrace();
						}

						WorkingDaysCalculator calculate = new WorkingDaysCalculator();
						long result = calculate.calculateWorkingDays(startDate, endDate);

						absent = (int) (result - present);
						System.out.println("Number of working days between " + startDate + " and " + endDate + ": " + result);
						%>


						<%
						System.out.println(" total days  end");
						%>

						<!-- total days  end -->








						<div class="row mt-5 text-center justify-content-center">
							<div class="col-md-4">
								<div class="main_box">

									<canvas id="mychart"></canvas>
								</div>
							</div>
							<div class="col-md-6">
								<div class="count_box bg-primary"
									style="margin-top: 50px; height: 240px;">
									<div class="form-group">
										<label for="coronavirus-input text-white">Total Days
											of Employment</label> <input type="text" value="<%=result%>"
											class="total-input form-control"  readonly id="coronavirus-input">
									</div>
									<div class="form-group">
										<label for="coronavirus-input">Active Days Present</label> <input
											type="text" value="<%=present%>" name="coronavirus-input"
											class="coronavirus-input form-control"  readonly id="Present_Days">
									</div>
									<div class="form-group">
										<label for="death-input">Absent Days</label> <input
											type="text" value="<%=absent%>" name="death-input"
											class="death-input form-control " readonly id="Absent_Days">
									</div>
									<!-- <div class="form-group">
										<label for="recovered-input">Recovered</label> <input
											type="text" name="recovered-input" value="1234"
											class="recovered-input form-control" id="recovered-input">
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>



	<!-- pie Chat start -->


	<script>
    document.addEventListener('DOMContentLoaded', function () {
        const cases = document.getElementById('Present_Days');
        const deaths = document.getElementById('Absent_Days');
        const recovered = document.getElementById('recovered-input');
        const totalDaysInput = document.getElementById('coronavirus-input');
        const ctx = document.getElementById('mychart').getContext('2d');

        
        
        const presentDays = <%= present %>;
        const absentDays = <%= absent %>;
        
        let mychart = new Chart(ctx, {
            type: 'pie',
            data: {
                labels: ['Present Days', 'Absent Days'],
                datasets: [{
                    label: 'Number of cases',
                    data: [presentDays, absentDays],
                    backgroundColor: ['red', 'orange'],
                    borderWidth: 1
                }]
            }
        });

        
   

    });
</script>


	<!--pie chart end   -->








	<script>
		function generateUniqueCode() {
			// Use a combination of a 4-digit random number and "AFKIS" to generate a unique code
			var randomPrefix = Math.floor(1000 + Math.random() * 9000); // 4-digit random number
			var uniqueCode = "AFKIS" + randomPrefix;

			// Set the generated unique code to the hidden input field
			document.getElementById("uniqueCode").value = uniqueCode;
		}
	</script>







	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'Status', 'Count' ], [ 'Present', 1 ], [ 'Absent', 4 ] ]);

			var options = {
				title : 'Attendance Chart'
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('piechart'));

			chart.draw(data, options);
		}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>