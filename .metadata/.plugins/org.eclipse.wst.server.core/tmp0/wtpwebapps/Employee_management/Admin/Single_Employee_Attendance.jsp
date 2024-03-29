<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
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
</style>

</head>
<body>


	<div class="row">
		<jsp:include page="/Admin/include.jsp" />
	


		<div class="container col-lg-9 bg-light mt-4 right-content">

			<div class="card-body">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<%
						int id = Integer.parseInt(request.getParameter("employeeId"));
						try {
							Connection conn1 = DriverManager
							.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
							PreparedStatement pstmt = conn1.prepareStatement("SELECT * FROM add_employee where id = ?");
							pstmt.setInt(1, id);
							ResultSet rs1 = pstmt.executeQuery();

							if (rs1.next()) {
						%>





						<a class="navbar-brand" href="#"><h4><%=rs1.getString("employeeId")%></h4></a>
						<a class="navbar-brand" href="#"><%=rs1.getString("firstName")%>
							<%=rs1.getString("lastName")%> </a>
						<div class="dropdown nav-item ">
					
							 <a class="btn btn-info btn-sm dropdown-toggle btn-lg btn-wider "
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false"><%=rs1.getString("department")%></a> 
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Log-Out</a></li>
							</ul>
						</div>
						<%
						}
						rs1.close();
						pstmt.close();
						conn1.close();
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</div>
				</nav>
			</div>

			<hr>
			<!-- =============================================================================================== -->



			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col">SR.NO</th>
						<th scope="col">Attendance Code</th>
						<th scope="col">Check IN</th>
						<th scope="col">Day</th>
						<th scope="col">Check OUT</th>

					</tr>
				</thead>
				<tbody>

					<%
					try {

						String sql = "SELECT add_employee.employeeId, add_employee.firstName, add_employee.lastName, "
						+ "employee_attendance.id, employee_attendance.PunchIN_Date, employee_attendance.PunchIN_Time, "
						+ "employee_attendance.PunchIN_Day, employee_attendance.PunchOut_Time, "
						+ "employee_attendance.Attendance_Code, employee_attendance.Employee_id " + "FROM add_employee "
						+ "JOIN employee_attendance ON add_employee.id = employee_attendance.Employee_id "
						+ "WHERE add_employee.id = ? AND employee_attendance.Employee_id = ?";

						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection conn = DriverManager
						.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
						PreparedStatement psmt = conn.prepareStatement(sql);
						psmt.setInt(1, id);
						psmt.setInt(2, id);
						ResultSet rs = psmt.executeQuery();

						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("id")%></td>
						<td><%=rs.getString("Attendance_Code")%></td>

						<td><%=rs.getString("PunchIN_Date")%></td>
						<td><%=rs.getString("PunchIN_Day")%></td>
						<td><%=rs.getString("PunchIN_Time")%></td>

					</tr>
				</tbody>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>

			</table>

			<div class="text-center mt-3 mb-3">
				<div class="modal fade" id="exampleModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<!-- Modal content (unchanged) -->
				</div>
			</div>


		</div>
	</div>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>