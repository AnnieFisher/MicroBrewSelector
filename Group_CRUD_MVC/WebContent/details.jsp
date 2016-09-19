<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
</head>
<body>

	<ul>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
	</ul>
	<h2>Name of Beer: ${beer.name }</h2>
	<form action="addToFavorites.do" method="POST">

		<input type="hidden" value="${beer.id}" name="addBeerId" /> <input
			type="submit" value="Add" />
	</form>
	<br>
	<p>Brand: ${beer.brand.name }</p>
	<img id="logo" src="${beer.brand.url}" alt="logo" />
	<br>
	<p>Beer Rating: ${beer.rating }</p>

	<p>Taste: ${beer.taste.name }</p>
	<br>
	<p>Style: ${beer.style.name }</p>
	<p>${beer.style.description }</p>
	<br>
	<p>Type: ${beer.type.name }</p>
	<p>${beer.type.description }</p>


	<p>${beer.brand.name }thisshould be brand name</p>


	<br>


	<p>Rate This Beer</p>

</body>

</html>



