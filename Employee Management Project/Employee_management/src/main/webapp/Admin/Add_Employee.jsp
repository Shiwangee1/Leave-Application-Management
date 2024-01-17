<!doctype html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
.error-message {
    color: red;
    font-size: 12px;
    margin-top: 5px;
    display: block;
}
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
<script>
    function validateForm() {
        var firstName = document.getElementsByName("firstName")[0].value;
        var lastName = document.getElementsByName("lastName")[0].value;
        var email = document.getElementsByName("email")[0].value;
        var department = document.getElementsByName("department")[0].value;
        var gender = document.getElementsByName("gender")[0].value;
        var dob = document.getElementsByName("dob")[0].value;
        var contact = document.getElementsByName("contact")[0].value;
        var country = document.getElementsByName("country")[0].value;
        var address = document.getElementsByName("address")[0].value;
        var city = document.getElementsByName("city")[0].value;
        var password = document.getElementsByName("password")[0].value;

        clearErrorMessages(); // Clear previous error messages

        if (firstName.trim() === "" || !validateUsername(firstName)) {
            displayErrorMessage("firstNameError", "Please enter a  first name");
            return false;
        }
        if (lastName.trim() === "" || !validateUsername(lastName)) {
            displayErrorMessage("lastNameError", "Last Name cannot be empty");
            return false;
        }
        if (email.trim() === ""|| !isValidEmail(email)) {
            displayErrorMessage("emailError", "Email cannot be empty");
            return false;
        }
        if (department.trim() === "") {
            displayErrorMessage("departmentError", "Department cannot be empty");
            return false;
        }
        if (gender.trim() === "") {
            displayErrorMessage("genderError", "Gender cannot be empty");
            return false;
        }
        if (dob.trim() === "") {
            displayErrorMessage("dobError", "DOB cannot be empty");
            return false;
        }
        if (contact.trim() === "" || isNaN(contact) || contact.length !== 10) {
            displayErrorMessage("contactError", "Please enter a valid 10-digit mobile number");
            return false;
        }

        if (country.trim() === ""|| !validateUsername(country)) {
            displayErrorMessage("countryError", "Country cannot be empty");
            return false;
        }
        if (address.trim() === ""|| !validateUsername(address)) {
            displayErrorMessage("addressError", "Address cannot be empty");
            return false;
        }
        if (city.trim() === ""|| !validateUsername(city)) {
            displayErrorMessage("cityError", "City cannot be empty");
            return false;
        }
        if (password.trim() === "" || !isValidPassword(password)) {
            displayErrorMessage("passwordError", "Password cannot be empty");
            return false;
        }
        // Add similar checks for other fields...

        // If all checks pass, call the code to generate the random code
        generateRandomCode();

        // Allow the form to be submitted
        return true;
    }

    function displayErrorMessage(elementId, message) {
        var errorElement = document.getElementById(elementId);
        if (errorElement) {
            errorElement.innerHTML = message;
        }
    }

    function clearErrorMessages() {
        var errorElements = document.getElementsByClassName("error-message");
        for (var i = 0; i < errorElements.length; i++) {
            errorElements[i].innerHTML = "";
        }
    }

    function generateRandomCode() {
        var prefix = "MMIWFE";
        var randomCode = generateRandom4DigitNumber();
        var employeeId = prefix + randomCode;
        document.getElementById("employeeId").value = employeeId;
    }

    function generateRandom4DigitNumber() {
        return String(Math.floor(1000 + Math.random() * 9000));
    }
    function isValidEmail(email) {
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }
    function validateUsername(name) {
        // Trim the username to remove leading and trailing whitespaces
        var trimmedUsername = name.trim();

        // Check if the trimmed username is between 3 and 20 characters
        if (trimmedUsername.length < 3 || trimmedUsername.length > 20) {
            displayErrorMessage("usernameError", "Username must be between 3 and 20 characters");
            return false;
        }

        // Check if the username contains only letters
        var nameRegex = /^[a-zA-Z]+$/;
        if (!nameRegex.test(trimmedUsername)) {
            displayErrorMessage("usernameError", "Username must contain only letters");
            return false;
        }

        // You can add additional checks or validation logic if needed

        return true;
    }


    function isValidPassword(password) {
        // Minimum length of 8 characters
        if (password.length < 8) {
            displayErrorMessage("passwordError", "Password must be at least 8 characters long");
            return false;
        }

        // Should contain at least one uppercase letter
        if (!/[A-Z]/.test(password)) {
            displayErrorMessage("passwordError", "Password must contain at least one uppercase letter");
            return false;
        }

        // Should contain at least one lowercase letter
        if (!/[a-z]/.test(password)) {
            displayErrorMessage("passwordError", "Password must contain at least one lowercase letter");
            return false;
        }

        // Should contain at least one digit
        if (!/\d/.test(password)) {
            displayErrorMessage("passwordError", "Password must contain at least one digit");
            return false;
        }

        // Should contain at least one special character (e.g., !@#$%^&*)
        if (!/[!@#$%^&*]/.test(password)) {
            displayErrorMessage("passwordError", "Password must contain at least one special character");
            return false;
        }

        // If all checks pass, consider the password as strong
        return true;
    }

</script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div class="row">
<jsp:include page="/Admin/include.jsp" />


		<!-- ==================================== Second Div Start ===================== -->
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
								aria-expanded="false">Admin</a>
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
					<h5>Please fill up the form in order to add Employee records</h5>
				</div>
				<form action="../Add_Employee" method="post"
					onsubmit="generateRandomCode(); return validateForm();   return confirmSubmit();">

					<!-- <div class="mb-3">
						<label for="exampleInputEmail1" class="form-label">Employee
							ID</label> <input type="text" class="form-control"
							aria-describedby="emailHelp" name="employeeId" disabled
							placeholder="Employee ID is Auto Generated ">
					</div> -->



					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Employee
							ID</label> <input type="text" class="form-control" id="employeeId"
							name="employeeId" readonly
							placeholder="Employee ID is Auto Generated">
					</div>



					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">First
							Name</label> <input type="text" class="form-control" name="firstName">
						<span id="firstNameError" class="error-message"></span>
					</div>


					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Last
							Name</label> <input type="text" class="form-control" name="lastName">
							<span id="lastNameError" class="error-message"></span>
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Email</label>
						<input type="email" class="form-control" name="email">
						<div id="emailHelp" class="form-text">We'll never share your
							email with anyone else.
							<span id="emailError" class="error-message"></span>
							</div>
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Preferred
							Department</label> <select name="department" class="form-control"
							placeholder="Please Select the Department">
							<option value="">Select Departments</option>
							<%
							try {
								Class.forName("com.mysql.cj.jdbc.Driver");
								Connection conn = DriverManager
								.getConnection("jdbc:mysql://localhost:3306/employee_management?user=root&password=root123@");
								String sql = "Select * from departments";
								Statement pstmt = conn.createStatement();
								ResultSet rs = pstmt.executeQuery(sql);
								while (rs.next()) {
							%>
							<option value="<%=rs.getString("Department_Name")%>"><%=rs.getString("Department_Name")%></option>
							<%
							}
							%>

							<%
							} catch (Exception e) {
							e.printStackTrace();

							}
							%>

						</select>
						<span id="departmentError" class="error-message"></span>
					</div>

					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Choose
							Gender</label> <select name="gender" class="form-control"
							placeholder="Please Select the Gender">
							<option value="">Select Gender</option>
							<option value="male">Male</option>
							<option value="female">Female</option>
							<option value="other">Other</option>
						</select>
						<span id="genderError" class="error-message"></span>
					</div>

					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">DOB</label>
						<input type="date" class="form-control" name="dob">
						<span id="dobError" class="error-message"></span>
					</div>

					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Contact
							Number</label> <input type="number" class="form-control" name="contact">
							<span id="contactError" class="error-message"></span>
					</div>

					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Country</label>
						<input type="text" class="form-control" name="country">
						<span id="countryError" class="error-message"></span>
					</div>
                
                
                
                
           <!--      ==================================================================================== -->
           
           
           
           
           
           
           
           
           
           
           
           
          <!--  ============================================================================================================= -->
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Address
						</label> <input type="text" class="form-control" name="address">
						<span id="addressError" class="error-message"></span>
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">City</label>
						<input type="text" class="form-control" name="city">
						<span id="cityError" class="error-message"></span>
					</div>
					<h3>Set password for Employee Login</h3>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control" name="password">
						<span id="passwordError" class="error-message"></span>
					</div>





					<button type="submit" class="btn btn-primary">Process</button>
				</form>

			</div>
		</div>




		<!-- 	========================second div end ========================= -->
	</div>




	<script>
		function generateRandomCode() {
			// Define the prefix and generate a random 4-digit number
			var prefix = "MMIWFE";
			var randomCode = generateRandom4DigitNumber();

			// Combine the prefix and the random code
			var employeeId = prefix + randomCode;

			// Set the generated code to the input field
			document.getElementById("employeeId").value = employeeId;
		}

		function generateRandom4DigitNumber() {
			return String(Math.floor(1000 + Math.random() * 9000));
		}
		
		
		
		
		
	</script>
	<script>
    function confirmSubmit() {
        // Show a SweetAlert confirmation dialog
        Swal.fire({
            title: 'Are you sure?',
            text: 'You are about to submit the form.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, submit it!',
            cancelButtonText: 'No, cancel!',
        }).then((result) => {
            // If the user clicks "Yes"
            if (result.isConfirmed) {
                // Proceed with form submission
                Swal.fire('Submitted!', 'The form has been submitted.', 'success')
                    .then(() => {
                        // Redirect to another page
                         window.location.href = 'Employee/Employee_dashboard.jsp'; 
                    });
            } else {
                // If the user clicks "No", cancel form submission
                Swal.fire('Cancelled', 'Form submission has been cancelled.', 'info');
            }
        });

        // Return false to prevent the form from being submitted immediately
        return false;
    }
</script>  




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>