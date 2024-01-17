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
						<a class="navbar-brand" href="Add_Departments"><h4>Leave
								Section</h4></a> <a class="navbar-brand" href="Leave_type">Manager
							type/Admin Page</a>
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
			<div class="container">
				<div class="text-center mt-3 mb-3">
					<a href="Add_Leave_type.jsp" class="btn btn-primary ">Add new
						Leave type</a>

				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Leave Type</th>
							<th scope="col">Short Description</th>
							<th scope="col">Date Time</th>
							<th scope="col">Action</th>



						</tr>
						<%
						Connection conn = null;
						PreparedStatement pstmt = null;
						String sql = "SELECT * FROM leavetype";
						ResultSet rs = null;

						try {
							Class.forName("com.mysql.cj.jdbc.Driver");
							conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
							pstmt = conn.prepareStatement(sql);
							rs = pstmt.executeQuery();
							while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getString("id")%></td>
							<td><%=rs.getString("Leave_Type")%></td>
							<td><%=rs.getString("short_description")%></td>
							<td><%=rs.getString("dataTIME")%></td>

							<td>
								<form action="../LeavetypeDelete" method="post">
									<!-- Hidden input to store the id value -->
									<input type="hidden" name="id" value="<%=rs.getString("id")%>">
									<!-- Submit button with the trash icon -->
									<button type="submit" class="btn btn-link">
										<i class="fa-solid fa-trash"></i>
									</button>
									<a href="Edit_LeaveType.jsp?id=<%=rs.getString("id")%>"
										class=""> <i class="fa-solid fa-pen-to-square"></i>
									</a>
								</form>
							</td>
							<!-- Add more columns as needed -->
						</tr>
						<%
						}
						} catch (Exception e) {
						e.printStackTrace();
						} finally {
						if (rs != null) {
						rs.close();
						}
						if (pstmt != null) {
						pstmt.close();
						}
						if (conn != null) {
						conn.close();
						}
						}
						%>
					
					</tbody>
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






