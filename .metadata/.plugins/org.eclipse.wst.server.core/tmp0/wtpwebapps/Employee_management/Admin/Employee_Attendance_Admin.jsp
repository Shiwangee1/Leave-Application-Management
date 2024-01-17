<!doctype html>
<html lang="en">
<%@ page import="java.sql.*"%>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style type="text/css">
.full-height-sidebar {
	height: 100vh;
	background-color: #111;
	color: white;

	/* Set a high z-index to ensure it appears above other content */
}

.custom-width {
	width: 280px;
}

.right-content {
	overflow-y: auto;
	height: calc(100vh - 72px); /* Adjust the height as needed */
	padding: 20px;
}

.btn-toggle, .btn-toggle-nav a {
	color: #fff; /* White color */
}

.btn-toggle:focus, .btn-toggle-nav a:focus {
	outline: none; /* Remove focus outline */
}
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div class="row">
		<jsp:include page="/Admin/include.jsp" />
		


		<!-- ==================================== Second Div Start ===================== -->
		<div class="container col-lg-9 bg-light mt-8">

			<div class="card-body">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="Add_Departments"><h4>Attendance
								List</h4></a> </a>
						<!-- 	<button type="button" class="btn btn-primary"
							style="hight: 200px; width: 200px">Admin</button> -->



						<div class="dropdown nav-item ">

							</h4>
							</a> <a class="navbar-brand" href="Leave_type">recent 24 hour </a>
							<ul class="dropdown-menu">

							</ul>
						</div>
					</div>
				</nav>
			</div>

			<hr>

			<div class="container">

				<div class="card-body mt-3 mb-3">
					<nav class="navbar navbar-light bg-light">
						<div class="container-fluid">
							<a class="navbar-brand" href="#">Recent List </a> <a
								class="navbar-brand" href="Leave_type"> </a>
							<!-- 	<button type="button" class="btn btn-primary"
							style="hight: 200px; width: 200px">Admin</button> -->



							<div class="dropdown nav-item ">
								<a class="navbar-brand" href="#"> List 24 hours Section</a> <a
									class="navbar-brand" href="Leave_type"> </a>

							</div>
						</div>
					</nav>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">SR.NO</th>
							<th scope="col">Employee Id</th>
							<th scope="col">Full Name</th>
								<th scope="col">Department</th>
							<th scope="col">Details</th>




						</tr>
					<tbody>
						<%
						Connection conn = null;
						PreparedStatement pstmt = null;
						ResultSet rs = null;

						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

							String sql = "SELECT id, employeeId, firstName, lastName,department FROM employee_management.add_employee";

							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();

							int row = 1;
							while (rs.next()) {
						%>
						<tr>
							<td><%=row++%></td>
							<td><%=rs.getString("employeeId")%></td>
							<td><%=rs.getString("firstName")%> <%=rs.getString("lastName")%></td>
							<td><%=rs.getString("department")%></td>
							<td><a
								href="Single_Employee_Attendance.jsp?employeeId=<%=rs.getString("id")%>"
								class="btn btn-secondary">Details</a></td>
						</tr>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						} finally {
						try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
						} catch (SQLException e) {
						e.printStackTrace();
						}
						}
						%>
					</tbody>
				</table>
			</div>
		</div>


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>






