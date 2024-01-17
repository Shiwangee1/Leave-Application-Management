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
						<a class="navbar-brand" href="Add_Departments"><h4>Approved Leave
								</h4></a> <a class="navbar-brand" href="Leave_type">Home/Approved List
							Page</a>
						<!-- 	<button type="button" class="btn btn-primary"
							style="hight: 200px; width: 200px">Admin</button> -->



						<div class="dropdown nav-item ">
							<a class="btn btn-success dropdown-toggle btn-lg  btn-wider "
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">Admin</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Log-Out</a></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<hr>
			
				<table class="table table-bordered">
					<thead>
						<tr>
							<th scope="col">SR.NO</th>
							<th scope="col">Emplooye Id</th>
							<th scope="col">Full Name</th>
							<th scope="col">Leave Type</th>
							<th scope="col">Applied on</th>
							<th scope="col">Current Status</th>
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

							// Assuming '5' is an integer value
							/*     int employeeId = 5; */

							String sql = "SELECT add_employee.employeeId, add_employee.id, add_employee.firstName, "
							+ "add_employee.lastName, apply_leave.leave_type, apply_leave.applied, "
							+ "apply_leave.leaveCode, apply_leave.Apply_Status " + "FROM add_employee "
							+ "JOIN apply_leave ON add_employee.id = apply_leave.id " + "WHERE apply_leave.Apply_Status = 'approved'";
							pstmt = conn.prepareStatement(sql);
							/*       pstmt.setInt(1, employeeId); */

							rs = pstmt.executeQuery();
							int row = 1;
							while (rs.next()) {
						%>
						<tr>
							<td><%=row++%></td>
							<td><%=rs.getString("employeeId")%></td>
							<td><%=rs.getString("firstName")%> <%=rs.getString("lastName")%></td>
							<td><%=rs.getString("leave_type")%></td>
							<td><%=rs.getString("applied")%></td>
							<td><%=rs.getString("Apply_Status")%> <i
								class="fa-solid fa-spinner"
								style="font-size: 1rem; position: left; top: 5px; right: 10px; color: blue;"></i></td>

							<td><a
								href="Employee_leave_detail.jsp?leaveCode=<%=rs.getString("leaveCode")%>&id=<%=rs.getString("id")%>"
								class="btn btn-secondary">Details</a></td>

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

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
</body>
</html>






