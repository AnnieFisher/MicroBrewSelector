<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>PLACEHOLDER</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>
<ul>
	<li><a href="index.html">Home Page</a></li>
	<li><a href="UpdateRating.do">Rate A beer</a></li>
	<li><a href="goToFavorites.do">Your Favorites</a></li>
	<li><a class="active" href="goToBeers.do">Full List</a></li>
	<li><a href="editUser.do">User Settings</a></li>

</ul>

	<p>You're logged in to this mother</p>



	<table>
		<thead>
			<tr>
				<td>Name</td>
				<td>Rating</td>
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
</body>
</html>