<%@ page import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
		




		
		<div class="container col-lg-9 bg-light mt-4">

			<div class="card-body">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="#"><h4>Edit Section</h4></a> <a
							class="navbar-brand" href="#">Edit ManageAdmin Section</a>
						<!-- <button type="button" class="btn btn-primary"
							style="hight: 200px; width: 200px">Admin</button>  -->



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
			<div class="container mt-5">
				<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;

				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

					String id = request.getParameter("id");

					// Query the database to get the leave type details based on the ID
					String sql = "SELECT * FROM manage_admin WHERE id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					rs = pstmt.executeQuery();

					if (rs.next()) {
						String name = rs.getString("Name");
						String Username = rs.getString("Username");
						String Email = rs.getString("Email");
						Timestamp dateTime = rs.getTimestamp("AccountCreatedOn");

						// Format the date and time
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						String formattedDateTime = dateFormat.format(dateTime);
				%>
				<form action="../EditmanageAdmin" method="post">
					<input type="hidden" name="id" value="<%=id%>">
					<div class="form-group">
						<label for="leaveType">Name</label> <input type="text"
							class="form-control" name="Name" value="<%=name%>"
							required>
					</div>
					<div class="form-group">
						<label for="">UserName</label> <input
							type="text" class="form-control" name="UserName"
							value="<%=Username%>" required>
					</div>
					<div class="form-group">
						<label for="Email">Email</label> <input
							type="text" class="form-control" name="Email"
							value="<%=Email%>" required>
					</div>
					<div class="form-group">
						<label for="dateTime">Date Time</label> <input type="text"
							class="form-control" name="dateTime"
							value="<%=formattedDateTime%>" required>
					</div>
					<button type="submit" class="btn btn-primary">Update Leave
						Type</button>
				</form>
				<%
				} else {
				out.println("Leave Type not found.");
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
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous">
		
	</script>
</body>
</html>