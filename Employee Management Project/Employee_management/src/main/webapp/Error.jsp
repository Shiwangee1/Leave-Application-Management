<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry ! Somthing went wrong</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">

<style type="text/css">
.banner-background {
	clip-path:polygon(30% 0%,70%,0,100%,0,100% 91%,63% 100%,22% 91%,o. 99%,0,0 );
}
</style>

</head>
<body>
<% response.setHeader("cache-centrol", "no-cache,no-store") ;%>

 <div class="container text-center">
 
 <img alt="" src="Image/cancel.png" class="img-fluid mt-5"  width="20%" height="20%">
 <a href="User_login.jsp" class="btn primary-background btn lg text-white mt-3">Click here</a>
 </div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>