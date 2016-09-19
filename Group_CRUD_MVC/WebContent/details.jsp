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
	<li><a href="UpdateRating.do">Rate A beer</a></li>
	<li><a href="goToFavorites.do">Your Favorites</a></li>
	<li><a href="goToBeers.do">Full List</a></li>
	<li><a href="editUser.do">User Settings</a></li>
</ul>
	<h2>${beer.name }</h2>
	<br>

<p>${beer.rating }</p>

<p>${beer.taste.name }</p>

<p>${beer.style.name }</p>
<p>${beer.style.description }</p>

<p>${beer.type.name }</p>

<p>${beer.type.description }</p>

<p>${beer.brand.name }</p>


</body>

</html>



