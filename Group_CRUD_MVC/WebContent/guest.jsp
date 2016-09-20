<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Guest View</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>

	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a class="active" href="goToBeers.do">Full List</a></li>
		<li><a href="newUser.jsp">Register</a></li>

	</ul>
	
	<table>
		<thead>
			<tr class=heads>
				<td>Name</td>
				<td>Likes</td>
				<td>Taste</td>
				<td>Type</td>
				<td>Style</td>
				<td>Brand</td>

			</tr>
		</thead>
		<tbody>

			<c:forEach var="beer" items="${beerList}">

				<tr>
					<td>${beer.name}</td>
					<td>${beer.rating}</td>
					<td>${beer.taste.name}</td>
					<td>${beer.type.name}</td>
					<td>${beer.style.name}</td>
					<td>${beer.brand.name}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<br>
	<hr>
	<br>
	
	<p><span>Become a registered user to add beers to the list!</span></p>
	<form action="newUser.jsp" method="POST">
		<input type="submit" value="REGISTER"/>	
	</form>
</body>
</html>