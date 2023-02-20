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
<title>Discover Music</title>
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
	<div> 
		<div class="row">
		<div class="col-lg-6 col-md-6 col-sm-12 p-4">
		<div class="library">
			<h3><c:out value="${user.userName}"></c:out>'s Library</h3>
		</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<td>Title</td>
						<td>Genre</td>
						<td>Info</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="music" items="${myMusic}">
						<tr>
							<td><c:out value="${music.title}"></c:out></td>
							<td><c:out value="${music.genre}"></c:out></td>
							<td><a href="/music/about/${music.id}">About</a> | <a href="/music/${music.id}/edit">Edit</a> | <a href="/music/${music.id}/delete">Delete</a> </td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
		<div>
			<a href="/music/add"><button class="btn btn-outline-light" style="background-color: #9A616D;"> Add Music</button></a>
		</div>
		</div>
		<div class="col-lg-6 col-md-6 col-sm-12 p-4">
		<div >
			<h3>Discover music</h3>
		</div>
			<table class="table table-striped">
				<thead>
					<tr>
						<td>Title</td>
						<td>Genre</td>
						<td>Info</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="music" items="${otherMusic}">
						<tr>
							<td><c:out value="${music.title}"></c:out></td>
							<td><c:out value="${music.genre}"></c:out></td>
							<td><a href="/music/about/${music.id}">About</a></td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
		</div>
	</div>
	</div>
	</div>
</body>
</html>