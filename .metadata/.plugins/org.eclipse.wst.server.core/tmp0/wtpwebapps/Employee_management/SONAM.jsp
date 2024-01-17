<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<style>
/* Custom CSS for the full-height sidebar */
.full-height-sidebar {
	height: 100vh; /* 100% of the viewport height */
	background-color: #111;
	color: white;
}

/* Adjust the width to control the sidebar size */
.custom-width {
	width: 280px;
}
</style>
</head>
<body>

	<div
		class="d-flex flex-column flex-shrink-0 p-3 full-height-sidebar custom-width">
		<a href="/"
			class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
			<svg class="bi pe-none me-2" width="40" height="32">
				<use xlink:href="#bootstrap"></use></svg> <img src="" width="40px"
			height="40px"> <span class="fs-4">EmpManagement</span>
		</a>
		<hr>
		<ul class="nav nav-pills flex-column mb-auto">
			<li class="nav-item"><a href="demo.jsp" class="nav-link active"
				aria-current="page"> <svg class="bi pe-none me-2" width="16"
						height="16">
						<use xlink:href="#home"></use></svg> Home
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-white">
					<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#table"></use></svg> Orders
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-white">
					<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#speedometer2"></use></svg> Dashboard
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-white">
					<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#grid"></use></svg> Products
			</a></li>
			<li class="nav-item"><a href="#" class="nav-link text-white">
					<svg class="bi pe-none me-2" width="16" height="16">
						<use xlink:href="#people-circle"></use></svg> Customers
			</a></li>
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
		<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title">Card title</h5>
    <h6 class="card-subtitle mb-2 text-body-secondary">Card subtitle</h6>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="card-link">Card link</a>
    <a href="#" class="card-link">Another link</a>
  </div>
</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>

</body>
</html>
