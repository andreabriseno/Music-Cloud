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
<title>Add Music</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> 
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar" style="background-color: #9A616D;" >
		<div class="container">
  		<span class="navbar-text h1 text-white">
  			  Music Cloud 
  		</span>
  		<a href="/logout">
  			<button type="button" class="btn btn-outline-light">Logout</button>
  		</a>
  		
  		</div>
	</nav>
	<div class="container">
		<div class="d-flex p-3 ">
			<div class="p-2">
				<a href="/musicboard"><button class="btn btn-outline-light" style="background-color: #9A616D;"> Discover more</button></a>
			</div>
			<div class="ml-auto p-2">
				<a href="/musicboard"><button class="btn btn-outline-light" style="background-color: #9A616D;"> Cancel </button></a>
			</div>
		</div>
		<div class="card text-center" style="border-radius: 1rem;">
		<div class="card-body p-4 p-lg-5 text-black">
			<h1 class="title"> Add Music </h1>
			<form:form action="/music/create" method="post" modelAttribute="music">
				<div class="form-outline mb-4">
					<form:errors path="title" class="text-danger"></form:errors>
					<form:label path="title"></form:label>
					<form:input placeholder="Title" path="title"/>
				</div>
				<div class="form-outline mb-4">
					<form:errors path="genre" class="text-danger"></form:errors>
					<form:label path="genre"></form:label>
					<form:input placeholder="Genre" path="genre"/>
				</div>
				<div class="form-outline mb-4">
					<form:errors path="description" class="text-danger"></form:errors>
					<form:label path="description"></form:label>
					<form:textarea placeholder="About the music" path="description"></form:textarea>
				</div>
				<div> 
					<button class="btn btn-outline-light" style="background-color: #9A616D;"> Post </button>
				</div>	
			</form:form>
		</div>
		</div>
	</div>

</body>
</html>