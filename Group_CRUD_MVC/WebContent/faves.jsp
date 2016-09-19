<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Your Faves</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>
<ul>
	<li><a href="index.html">Home Page</a></li>
	<li><a class="active" href="goToFavorites.do">Your Favorites</a></li>
	<li><a href="goToBeers.do">Full List</a></li>
	<li><a href="goToOptions.do">Palate Options</a></li>
	<li><a href="editUser.do">User Settings</a></li>
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
				<td>Remove From Favorites</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="beer" items="${faveList}">

				<tr>
					<td>${beer.name}</td>
					<td>${beer.rating}</td>
					<td>${beer.taste.name}</td>
					<td>${beer.type.name}</td>
					<td>${beer.style.name}</td>
					<td>${beer.brand.name}</td>
					<td>
						<form action="removeFromFavorites.do" method="POST">

							<input type="hidden" value="${beer.id}" name="removeBeerId" /> 
							<input type="submit" value="Remove" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>