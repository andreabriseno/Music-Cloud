<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Music Cloud: An application to discover new music</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<section class="vh-100" style="background-color: #9A616D;">
	<div class="container py-5 h-100">
	<div class="row d-flex justify-content-center align-items-center h-100">
	<div class="col col-xl-10">
		<div class="text-center">
			<h1 class="h1 fw-bold mb-0">Music Cloud</h1>
			<h5>Discover new music</h5>
		</div>
		<div class="card text-center" style="border-radius: 1rem;">
		<div class="row g-0">
		<div class="card-body p-4 p-lg-5 text-black">
		<div class="row">
			<form:form action="/register" method="post" modelAttribute="user" class="col-sm">
				<h2> Register </h2>
				<div class="form-outline mb-4">
					<form:errors path="userName" class="text-danger"/>
					<form:input placeholder="First Name" path="userName"/>
					<form:label path="userName"></form:label>
				</div>
				<div class="form-outline mb-4">
					<form:errors path="userLast" class="text-danger"/>
					<form:input placeholder="Last name" path="userLast"/>
					<form:label path="userLast"></form:label>
				</div>
				<div class="form-outline mb-4">
					<form:errors path="email" class="text-danger"/>
					<form:input placeholder="Email address" path="email"/>
					<form:label path="email"></form:label>
				</div>
				<div class="form-outline mb-4">
					<form:errors path="password" class="text-danger"/>
					<form:input placeholder="Password" path="password" type="password"/>
					<form:label path="password"></form:label>
				</div>
				<div class="form-outline mb-4">
					<form:errors path="confirmPassword" class="text-danger"/>
					<form:input placeholder="Confirm Password" path="confirmPassword" type="password"/>
					<form:label path="confirmPassword"></form:label>
				</div>
				<div class="pt-1 mb-4">
					<button class="btn btn-dark btn-lg btn-block">Register</button>
				</div>
			</form:form>
			<form:form action="/login" method="post" modelAttribute="loginUser" class="col-sm">
				<h2>Login </h2>
				<div class="form-outline mb-4" >
					<form:errors path="email" class="text-danger"/>
					<form:label path="email"></form:label>
					<form:input placeholder="Email address" path="email"/>
				</div>
				<div  class="form-outline mb-4">
					<form:errors path="password" class="text-danger"/>
					<form:label path="password"></form:label>
					<form:input placeholder="Password" path="password" type="password"/>
				</div>
				<div class="pt-1 mb-4">
					<button class="btn btn-dark btn-lg btn-block"> Log in</button>
				</div>
			</form:form>
		</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</section>

</body>
</html>