<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>
	<ul>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="editUser.do">User Settings</a></li>
	</ul>
	<h2>${beer.name }this should be beer name</h2>
	<br>

	<p>${beer.rating }this should be rating</p>

	<p>${beer.taste.name }this should be taste name</p>

	<p>${beer.style.name }this should be style name</p>
	<p>${beer.style.description }this should be style description</p>

	<p>${beer.type.name }this should be type name</p>
	<p>${beer.type.description }this should be type description</p>

	<p>${beer.brand.name }this should be brand name</p>

	<p>Rate This Beer</p>

</body>

</html>



