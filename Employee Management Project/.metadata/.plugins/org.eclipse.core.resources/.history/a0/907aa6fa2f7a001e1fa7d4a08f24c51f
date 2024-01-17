<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ page isELIgnored="False" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
<%@ include file="component/allcss.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@ include file="component/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">Admin Login</p>
						
							<c:if test="${not empty errorMsg }">
						<p class="text-center text-danger fs-3">${errorMsg}</p>
						<c:remove var="errorMsg" scope="session"/>
						</c:if>

                         <c:if test="${not empty sucMsg}">
						<p class="text-center text-danger fs-3">${sucMsg}</p>
						<c:remove var="sucMsg" scope="session"/>
						</c:if>
						
						
						<form action="adminLogin" method="post">
							<div class="md-3">
								<label class="form-label"> Email address</label> <input required
									name="email" type="email" class="form-control">

							</div>

							<div class="md-3">
								<label class="form-label">Password</label> <input required
									name="password" type="password" class="form-control">
							</div>
							 
							 
							<button  type="submit" class=" btn mt-2 bg-success text-white col-md-12 text-center">Login</button>
						</form>
						

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>