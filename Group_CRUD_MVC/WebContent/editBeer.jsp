<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Edit Beer Information</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body class = "admin">

	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a class="active" href="goToBeersAdmin.do">Full List</a></li>
		<li><a href="getUserList.do">List of Users</a></li>
		<li><a href="SignOut.do">Logout</a></li>
	</ul>
	
	<h2>Edit Beer Information Below</h2>
	<br>
	<form method="POST" action="editBeerAdmin.do">
		<input type="text" name="name" placeholder="Name" /> 
		<input type="text" name="brand" placeholder="Brand" /><br>
		<select name="typeId">
			<c:forEach var="type" items="${typeList}">
				<option value="${type.id}">${type.name}</option>
			</c:forEach>
		</select>
		<select name="tasteId">
			<c:forEach var="taste" items="${tasteList}">
				<option value="${taste.id}">${taste.name}</option>
			</c:forEach>
		</select> 

		<select name="styleId">
			<c:forEach var="style" items="${styleList}">
				<option value="${style.id}">${style.name}</option>
			</c:forEach>
		</select>
		<input type="hidden" value="${beer.id}" name="beerId"/>
		<input type="submit" value="Update Information" /><br><br>
	</form>

</body>
</html>