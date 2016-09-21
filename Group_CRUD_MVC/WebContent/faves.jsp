<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Your Faves</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>
<ul class=navbar>
	<li><a href="index.html">Home Page</a></li>
	<li><a class="active" href="goToFavorites.do">Your Favorites</a></li>
	<li><a href="goToBeers.do">Full List</a></li>
	<li><a href="goToOptions.do">Palate Options</a></li>
	<li><a href="goToEdit.do">User Settings</a></li>
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
				<td>Remove From Favorites</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="beer" items="${faveList}">

				<tr>
					<td>${beer.name}</td>
					<td>
							<form method="POST" action="UpdateRatingFromFaves.do?id=${beer.id}">
							<input type="submit" value="&#128077 ${beer.rating}"/>
						</form></td>
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