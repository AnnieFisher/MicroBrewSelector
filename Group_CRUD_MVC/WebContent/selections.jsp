<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
<title>Selections</title>
</head>
<body id="selections">
	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a class="active" href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
	</ul>

	<%-- <h2>${}</h2> --%>
	<table>
		<thead>
			<tr class=heads>
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
					<td><a href="goToDetails.do?id=${beer.id}">${beer.name}</a></td>
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