<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Options</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body id="options">
	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a class=active href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
	</ul>
<div class="w3-container w3-display-bottomleft w3-margin-bottom">
	<form method="GET" action="GetType.do">

		<select name="id">
			<c:forEach var="type" items="${typeList}">
				<option value="${type.id}">${type.name}</option>
			</c:forEach>
		</select> <span class ="editBtn"> <input type="submit" value="Search By Type" /></span>
	</form>
<br><br>

	<form method="GET" action="GetTaste.do">
		<select name="id">
			<c:forEach var="taste" items="${tasteList}">
				<option value="${taste.id}">${taste.name}</option>
			</c:forEach>
		</select> <span class ="editBtn"><input type="submit" value="Search By Taste" /></span>
	</form>
<br><br>
	<form method="GET" action="GetStyle.do">
		<select name="id">
			<c:forEach var="style" items="${styleList}">
				<option value="${style.id}">${style.name}</option>
			</c:forEach>
		</select> <span class ="editBtn"><input type="submit" value="Search By Style" /></span>
	</form>
<br><br>

	<form method="GET" action="GetBrand.do">
		<select name="id">
			<c:forEach var="brand" items="${brandList}">
				<option value="${brand.id}">${brand.name}</option>
			</c:forEach>
		</select> <span class ="editBtn"><input type="submit" value="Search By Brand" /></span>
	</form>
<br><br>
</div>
</body>
</html>