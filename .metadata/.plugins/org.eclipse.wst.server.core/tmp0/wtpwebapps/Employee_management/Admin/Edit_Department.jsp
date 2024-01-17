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
		<div class="container col-lg-9 bg-light mt-4">

			<div class="card-body">
				<nav class="navbar navbar-light bg-light">
					<div class="container-fluid">
						<a class="navbar-brand" href="#"><h4>Employee Section</h4></a> <a
							class="navbar-brand" href="#">Edit Department</a>
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
			
			
			
			
			
			
		<!-- 	=========================================================== -->
		
		
		<div class="container mt-5">
    <h2>Edit Department</h2>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");

            String departmentId = request.getParameter("id");

            // Query the database to get the department details based on the ID
            String sql = "SELECT * FROM departments WHERE Department_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, departmentId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String departmentName = rs.getString("Department_Name");
                String shortForm = rs.getString("Shortform");
                String code = rs.getString("code");
    %>
    <form action="../Edit_Departments" method="post">
        <input type="hidden" name="id" value="<%= departmentId %>">
        <div class="form-group">
            <label for="departmentName">Department Name</label>
            <input type="text" class="form-control" name="departmentName" value="<%=departmentName %>" required>
        </div>
        <div class="form-group">
            <label for="shortForm">Short Form</label>
            <input type="text" class="form-control" name="shortForm" value="<%=shortForm %>" required>
        </div>
        <div class="form-group">
            <label for="code">Code</label>
            <input type="text" class="form-control" name="code" value="<%=code %>" required>
        </div>
        <button type="submit" class="btn btn-primary">Update Department</button>
    </form>
    <%
        } else {
            out.println("Department not found.");
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
		<!-- 	================================================================================ -->
			
			
			
			
			
			<!-- 
			<form action="../Departments" method="Post">
				<div class="mb-3">
				<div id="emailHelp" class="form-text">please fill up the form in order to add new departments 
						</div> 
					<label for="department_name" class="form-label">Department Name
						</label> <input type="text" class="form-control"
						 aria-describedby="departmenmtHelp" name="department_name" required>
					
				</div>
				<div class="mb-3">
					<label for="Shortform" class="form-label">Shortform</label>
					<input type="test" class="form-control"
						 name="shortform" required>
				</div>
				<div class="mb-3">
					<label for="code" class="form-label">code</label>
					<input type="text" class="form-control" name="code"
						required>
				</div>
				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input">
					<label class="form-check-label" for="exampleCheck1">Check
						me out</label>
				</div>
				<button type="submit" class="btn btn-primary">Add</button>
			</form>



				========================second div end =========================
		</div>



 -->




		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
			crossorigin="anonymous"></script>
</body>
</html>