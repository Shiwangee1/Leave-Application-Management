<%@ page import="java.sql.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Objects" %>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>
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
			 	HttpSession session1 = request.getSession(); 
				int employeeId = (int) session1.getAttribute("employeeId");
				System.out.println("Employee Dashboard employer id " + employeeId);
				%> 



				<li><a href="View_leave_History.jsp?id=<%=employeeId %>"
					class="nav-link text-white"> <svg class="bi pe-none me-2"
							width="16" height="16">
						<use xlink:href="#speedometer2"></use></svg> View My Leave History
				</a></li>
				
				<li><a href="Employee_Attendence.jsp?id=<%=employeeId%>"
					class="nav-link text-white"> <svg class="bi pe-none me-2"
							width="16" height="16">
						<use xlink:href="#speedometer2"></use></svg> Attendence
				</a></li>
				
				<li><a href="PieChart.jsp?id=<%=employeeId%>"
					class="nav-link text-white"> <svg class="bi pe-none me-2"
							width="16" height="16">
						<use xlink:href="#speedometer2"></use></svg> pieChart
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
							class="navbar-brand" href="#">Home/Employee Management</a>
						<!-- 	<button type="button" class="btn btn-primary"
							style="hight: 200px; width: 200px">Admin</button> -->



						<div class="dropdown nav-item ">
							<a class="btn btn-success dropdown-toggle btn-lg  btn-wider "
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
			<div class="container mt-4">
				<div class=" mt-3 mb-5">
					<h5>Employee Leave Form</h5>
					<h6 style="color: grey;">Please fill up the form</h6>
				</div>

				<form action="../Apply_leave" method="post"
					onsubmit="generateRandomLeaveCode();">
<input type="hidden" name="id" value="<%= employeeId %>">

					<input type="hidden" name="leaveCode" id="leaveCode"> 
				<%-- 	<input type="hidden" name="id" value="<%=employeeId%>"> --%>

					<!-- <div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Employee
							ID</label> <input type="text" class="form-control"
							aria-describedby="emailHelp" name="employeeId" disabled
							placeholder="Employee ID is Auto Generated ">
					</div> -->



					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Start
							Date </label> <input type="date" class="form-control" name="start_date"
							placeholder="Select the Date ">
					</div>



					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label"> End
							Date</label> <input type="date" class="form-control" name="end_date">
					</div>



					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">
							Your Leave Type</label> <select name="leave_type" class="form-control"
							placeholder="Click here to select any...">
							<option value="">Select Leave Type</option>

							<%
							try {
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection conn = DriverManager
								.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

								String sql = "Select * from leavetype";
								Statement pstmt = conn.createStatement();
								ResultSet rs = pstmt.executeQuery(sql);
								while (rs.next()) {
							%>

							<option value="<%=rs.getString("Leave_Type")%>"><%=rs.getString("Leave_Type")%></option>
							<%
							}
							%>
							<%
							} catch (Exception e) {
							e.printStackTrace();
							}
							%>


						</select>
					</div>



					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Describe
							your Conditions </label><br>
						<textarea name="longText" rows="4" cols="126"></textarea>
					</div>



					<button type="submit" class="btn btn-primary">Grant For
						Leave</button>
				</form>

			</div>
		</div>



	</div>

	<script>
		function generateRandomLeaveCode() {
			// Define the prefix for leave and generate a random 6-digit number
			var prefix = "LEAVE";
			var randomCode = generateRandom6DigitNumber();

			// Combine the prefix and the random code
			var leaveCode = prefix + randomCode;

			// Set the generated code to the input field
			document.getElementById("leaveCode").value = leaveCode;
		}

		function generateRandom6DigitNumber() {
			return String(Math.floor(100000 + Math.random() * 900000));
		}
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>