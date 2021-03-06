<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Full List</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body class="fullList">


	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a class="active" href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToSuggestBeer.do">Add A Beer</a>
		<li><a href="goToEdit.do">User Settings</a></li>
		<li><a href="SignOut.do">Logout</a></li>

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
				<td>Add To Favorites</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="beer" items="${beerList}">

				<tr>
					<td><a href="goToDetails.do?id=${beer.id}">${beer.name}</a></td>
					<td class=specialbutton>
						<form method="POST" action="UpdateRating.do?id=${beer.id}">
							<input type="submit" value="&#128077 ${beer.rating}"/>
						</form></td>
					<td>${beer.taste.name}</td>
					<td>${beer.type.name}</td>
					<td>${beer.style.name}</td>
					<td>${beer.brand.name}</td>
					<td class=specialbutton>
						<form action="addToFavorites.do" method="POST">

							<input type="hidden" value="${beer.id}" name="addBeerId" /> 
							<input type="submit" value="Add" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<br>

</body>
</html>