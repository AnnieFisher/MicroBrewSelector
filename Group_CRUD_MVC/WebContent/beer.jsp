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
		<li><a href="editUser.jsp">User Settings</a></li>

	</ul>

	<p>You're logged in to this mother</p>

	<ul>
		<li><a href="goToOptions.do">Palate Options</a></li>
	</ul>

	<table>
		<thead>
			<tr>
				<td>Name</td>
				<td>Rating</td>
				<td>Taste</td>
				<td>Type</td>
				<td>Style</td>
				<td>Brand</td>
				<td>Add To Favorites</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="beer" items="${beerList}">

				<tr>
					<td><a href="goToDetails.do?id=${beer.id}">${beer.name}</a></td>
					<td>${beer.rating}</td>
					<td>${beer.taste.name}</td>
					<td>${beer.type.name}</td>
					<td>${beer.style.name}</td>
					<td>${beer.brand.name}</td>
					<td>
						<form action="addToFavorites.do" method="POST">
							<input type="hidden" value="${beer.id}" name="addBeerId" /> 
							<input type="submit" value="Add" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>