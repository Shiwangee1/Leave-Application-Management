<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<%@ include file="CSS/Admin_login.jsp"%>
<%@ include file="CSS/Links.jsp"%>
<!------ Include the above in your HEAD tag ---------->
</head>

<body id="LoginForm">
	<div class="container p-5">

		<div class="login-form">

			<div class="main-div">

				<div class="panel">
					<h2>Employee Login</h2>
					<p>Please enter your email and password</p>
				</div>

				<form action="Employee_login" method="post" onsubmit="confirmSubmit(); return">

					<div class="form-group">

						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group-text"><i
									class="fa-solid fa-user"></i></span>
							</div>
							<input type="email" class="form-control" name="email"
								placeholder="Email Address">

						</div>

					</div>

  


					<div class="form-group">


						<div class="input-group">
							<div class="input-group-append">
								<span class="input-group-text"><i
									class="fa-solid fa-lock"></i></span>
							</div>
							<input type="password" class="form-control" name="password"
								placeholder="Password">


						</div>



					</div>


					<br> <br>

					<button type="submit" class="btn btn-outline-light  btn-lg"
						id="myButton">
						Submit <i class="fa-solid fa-arrow-right myButton"></i>
					</button>
					<br> <br> <a href="Index.jsp"><i
						class="fa-solid fa-arrow-left"></i> Back to Admin Login </a>
				</form>
			</div>

		</div>
	</div>



</body>
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
   
    }
</script>  
</html>