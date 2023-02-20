<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
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
<title><c:out value="${music.title}"/></title>
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
		<div class="container p-4">
			<div class="card" style="border-radius: 1rem;">
				<div class="card-body p-4 p-lg-5 text-black">
				<div class= "row">
	 	<div class="mx-auto" style="width: 500px;"> 
				<h3><c:out value="${music.title}"/></h3>
					<p><c:out value="${music.genre}"></c:out></p>
					<p><c:out value="${music.description}"></c:out>
					<p>Posted by: <c:out value="${music.user.userName}"/></p>
				<div class="links">
					<a href="/musicboard"><button class="btn btn-outline-light" style="background-color: #9A616D;"> Discover more</button></a>
				</div>
				<div>
					<c:if test="${!isAuthor}">
						<a href="/music/${id}/like"><button class="btn btn-outline-light" style="background-color: #9A616D;">Like</button></a>
					</c:if>
				</div>
				</div>
			</div>
		</div>
		
		</div>
		<div class="card p-4" style="border-radius: 1rem;">
			<div class="card-body p-4 p-lg-5 text-black">
				<h5 class="title"> Likes </h5>
					<ul class="list-group list-group-flush">
					<c:forEach var="u" items="${music.likedBy}">
						<li class="list-group-item">
							<c:out value="${u.userName}"/>
						</li>
					</c:forEach>
					</ul>
			</div>
		</div>
		</div>

	

</body>
</html>