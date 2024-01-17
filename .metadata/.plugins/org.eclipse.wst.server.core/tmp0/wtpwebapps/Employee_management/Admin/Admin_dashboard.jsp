<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
   <script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>
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
}us, .btn-toggle-nav a:focus {
	outline: none; /* Remove focus outline */
}
</style>
<%-- <script>
	// Check if user is logged in (you can customize this based on your session attribute)
	if (!
<%=session.getAttribute("loggedInUser") != null%>
	) {
		window.location.href = "login.jsp"; // Redirect to the login page
	}
</script> --%>
</head>
<body>


	<div class="row">
		<jsp:include page="/Admin/include.jsp" />
		


		<div class="container col-lg-9 bg-light mt-4 right-content">

			<div class="card-body">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="#"><h4>Deskboard</h4></a> <a
							class="navbar-brand" href="#">Home/Admin Page</a>
						<!-- 	<button type="button" class="btn btn-primary"
							style="hight: 200px; width: 200px">Admin</button> -->









						<div class="dropdown nav-item ">
							<a class="btn btn-success dropdown-toggle btn-lg  btn-wider "
								href="#" role="button" data-bs-toggle="dropdown"
								aria-expanded="false">Admin</a>
							<ul class="dropdown-menu">
								<li>
								
								<% 
								response.setHeader("paragma", "no-cache");
								response.setHeader("cache-control", "no-store");
								response.setHeader("Expire", "0");
							response.setDateHeader("Expire", -1);
							session.invalidate();
								
								
								%>
									<form action="../Logout" method="get">
										<input type="submit" value="Logout">
									</form>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</div>

			<hr>
			<!-- =============================================================================================== -->
			<%
			Connection conn1 = null;
			PreparedStatement pstmt1 = null;
			ResultSet rs1 = null;
			String sql1 = "SELECT COUNT(*) AS total FROM apply_leave";
			int totalLeaveApplications = 0;

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
				pstmt1 = conn1.prepareStatement(sql1);
				rs1 = pstmt1.executeQuery();

				if (rs1.next()) {
					totalLeaveApplications = rs1.getInt("total");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs1 != null)
				rs1.close();
					if (pstmt1 != null)
				pstmt1.close();
					if (conn1 != null)
				conn1.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			%>
			<div class="row">
				<!-- Left Side Card -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="row ">
								<div class="col-lg-2">
									<i class="fa-solid fa-briefcase "
										style="font-size: 2rem; position: left; top: 10px; right: 10px; color: blue;"></i>
								</div>
								<div class="col-lg-10 text-center">
									<h5 class="card-title" style="">Available Leave Type</h5>
								</div>
							</div>
							<div class="row mt-5">
								<div class="col-lg-6 text-center">
									<h1><%=totalLeaveApplications%></h1>
								</div>
								<div class="col-lg-6">
									<h5>Leave Type</h5>
								</div>
							</div>

							<!-- <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>
				<%
				Connection conn2 = null;
				PreparedStatement pstmt2 = null;
				ResultSet rs2 = null;
				String sql2 = "SELECT COUNT(*) AS total FROM add_employee";
				int totalLeaveApplications2 = 0;

				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
					pstmt2 = conn2.prepareStatement(sql2);
					rs2 = pstmt2.executeQuery();

					if (rs2.next()) {
						totalLeaveApplications2 = rs2.getInt("total");
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs2 != null)
					rs2.close();
						if (pstmt2 != null)
					pstmt2.close();
						if (conn2 != null)
					conn2.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				%>
				<!-- Middle Card -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="row ">
								<div class="col-lg-2">
									<i class="fa-solid fa-user-group"
										style="font-size: 2rem; position: left; top: 10px; right: 10px; color: blue;"></i>
								</div>
								<div class="col-lg-10 text-center">
									<h5 class="card-title" style="">Registered Employees</h5>
								</div>
							</div>
							<div class="row mt-5">
								<div class="col-lg-6 text-center">
									<h1><%=totalLeaveApplications2%></h1>
								</div>
								<div class="col-lg-6 ">
									<h5>Active Employees</h5>
								</div>
							</div>

							<!-- <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>

				<%
				Connection conn3 = null;
				PreparedStatement pstmt3 = null;
				ResultSet rs3 = null;
				String sql3 = "SELECT COUNT(*) AS total FROM departments";
				int totalDepartments = 0;

				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
					pstmt3 = conn3.prepareStatement(sql3);
					rs3 = pstmt3.executeQuery();

					if (rs3.next()) {
						totalDepartments = rs3.getInt("total");
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs3 != null)
					rs3.close();
						if (pstmt3 != null)
					pstmt3.close();
						if (conn3 != null)
					conn3.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				%>



				<!-- Right Side Card -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="row ">
								<div class="col-lg-2">



									<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
										fill="currentColor" class="bi bi-microsoft"
										viewBox="0 0 16 16" style="color: blue;">
  <path
											d="M7.462 0H0v7.19h7.462V0zM16 0H8.538v7.19H16V0zM7.462 8.211H0V16h7.462V8.211zm8.538 0H8.538V16H16V8.211z" />
</svg>

								</div>
								<div class="col-lg-10 text-center">
									<h5 class="card-title" style="">Available Departments</h5>
								</div>
							</div>
							<div class="row mt-5">
								<div class="col-lg-6 text-center">
									<h1><%=totalDepartments%></h1>
								</div>
								<div class="col-lg-6">
									<h5>Employees Department</h5>
								</div>
							</div>

							<!-- <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>
			</div>


			<%
			Connection conn4 = null;
			PreparedStatement pstmt4 = null;
			ResultSet rs4 = null;
			String sql4 = "SELECT COUNT(*) AS total FROM employee_management.apply_leave WHERE Apply_Status='Pending'";
			int totalPending = 0;

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				conn4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
				pstmt4 = conn4.prepareStatement(sql4);
				rs4 = pstmt4.executeQuery();

				if (rs4.next()) {
					totalPending = rs4.getInt("total");
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs4 != null)
				rs4.close();
					if (pstmt4 != null)
				pstmt4.close();
					if (conn4 != null)
				conn4.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			%>

			<br>
			<div class="row">
				<!-- Left Side Card -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="row ">
								<div class="col-lg-2">
									<i class="fa-solid fa-spinner"
										style="font-size: 2rem; position: left; top: 10px; right: 10px; color: blue;"></i>
								</div>
								<div class="col-lg-10 text-center">
									<h5 class="card-title" style="">Pending Application</h5>
								</div>
							</div>
							<div class="row mt-5">
								<div class="col-lg-6 text-center">
									<h1><%=totalPending%></h1>
								</div>
								<div class="col-lg-6">
									<h5>Pending</h5>
								</div>
							</div>

							<!-- <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>




				<%
				Connection conn5 = null;
				PreparedStatement pstmt5 = null;
				ResultSet rs5 = null;
				String sql5 = "SELECT COUNT(*) AS total FROM apply_leave WHERE Apply_Status='decline'";
				int totalDecline = 0;

				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn5 = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
					pstmt5 = conn5.prepareStatement(sql5);
					rs5 = pstmt5.executeQuery();

					if (rs5.next()) {
						totalDecline = rs5.getInt("total");
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs5 != null)
					rs5.close();
						if (pstmt5 != null)
					pstmt5.close();
						if (conn5 != null)
					conn5.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				%>


				<!-- Middle Card -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="row ">
								<div class="col-lg-2">
									<i class="fa-solid fa-xmark"
										style="font-size: 2rem; position: left; top: 10px; right: 10px; color: blue;"></i>
								</div>
								<div class="col-lg-10 text-center">
									<h5 class="card-title" style="">Decline Application</h5>
								</div>
							</div>
							<div class="row mt-5">
								<div class="col-lg-6 text-center">
									<h1><%=totalDecline%></h1>
								</div>
								<div class="col-lg-6">
									<h5>Decline</h5>
								</div>
							</div>

							<!-- <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>



				<%
				Connection conn6 = null;
				PreparedStatement pstmt6 = null;
				ResultSet rs6 = null;
				String sql6 = "SELECT COUNT(*) AS total FROM employee_management.apply_leave WHERE Apply_Status='approved'";
				int totalApproved = 0;

				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn6 = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
					pstmt6 = conn6.prepareStatement(sql6);
					rs6 = pstmt6.executeQuery();

					if (rs6.next()) {
						totalApproved = rs6.getInt("total");
					}
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if (rs6 != null)
					rs6.close();
						if (pstmt6 != null)
					pstmt6.close();
						if (conn6 != null)
					conn6.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
				%>

				<!-- Right Side Card -->
				<div class="col-lg-4">
					<div class="card">
						<div class="card-body">
							<div class="row ">
								<div class="col-lg-2">
									<i class="fa-solid fa-square-check"
										style="font-size: 2rem; position: left; top: 10px; right: 10px; color: blue;"></i>
								</div>
								<div class="col-lg-10 text-center">
									<h5 class="card-title" style="">Approved Application</h5>
								</div>
							</div>
							<div class="row mt-5">
								<div class="col-lg-6 text-center">
									<h1><%=totalApproved%></h1>
								</div>
								<div class="col-lg-6">
									<h5>Approved</h5>
								</div>
							</div>

							<!-- <a href="#" class="card-link">Card link</a>
                <a href="#" class="card-link">Another link</a> -->
						</div>
					</div>
				</div>
			</div>
			<!-- =======================================Recent list  ===================================================-->
			<!-- =======================================Recent list end  ===================================================-->

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

							String sql = "SELECT " + "add_employee.employeeId, " + "add_employee.id, " + "add_employee.firstName, "
							+ "add_employee.lastName, " + "apply_leave.leave_type, " + "apply_leave.applied, "
							+ "apply_leave.leaveCode, " + "apply_leave.Apply_Status " + "FROM " + "add_employee " + "JOIN "
							+ "apply_leave ON add_employee.id = apply_leave.id";

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
							<td>
								<%-- Check and display status with corresponding icon --%> <%
 String applyStatus = rs.getString("Apply_Status");
 String iconClass = "fa-spinner"; // default icon
 String statusClass = "text-primary"; // default status color

 if ("approved".equalsIgnoreCase(applyStatus)) {
 	iconClass = "fa-check"; // icon for approved status
 	statusClass = "text-success"; // color for approved status
 } else if ("decline".equalsIgnoreCase(applyStatus)) {
 	iconClass = "fa-times"; // icon for declined status
 	statusClass = "text-danger"; // color for declined status
 }
 // You can add more conditions for other status types
 %> <span class="<%=statusClass%>"><%=applyStatus%></span> <i
								class="fa-solid <%=iconClass%>"
								style="font-size: 1rem; position: left; top: 5px; right: 10px; color: blue;"></i>
							</td>


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


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>