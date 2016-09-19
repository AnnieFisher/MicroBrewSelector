<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Options</title>
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

	<form method="GET" action="GetType.do">

		<select name="id">
			<c:forEach var="type" items="${typeList}">
				<option value="${type.id}">${type.name}</option>
			</c:forEach>
		</select> <input type="submit" value="Search By Type" />
	</form>


	<form method="GET" action="GetTaste.do">
		<select name="id">
			<c:forEach var="taste" items="${tasteList}">
				<option value="${taste.id}">${taste.name}</option>
			</c:forEach>
		</select> <input type="submit" value="Search By Taste" />
	</form>

	<form method="GET" action="GetStyle.do">
		<select name="id">
			<c:forEach var="style" items="${styleList}">
				<option value="${style.id}">${style.name}</option>
			</c:forEach>
		</select> <input type="submit" value="Search By Style" />
	</form>


	<form method="GET" action="GetBrand.do">
		<select name="id">
			<c:forEach var="brand" items="${brandList}">
				<option value="${brand.id}">${brand.name}</option>
			</c:forEach>
		</select> <input type="submit" value="Search By Brand" />
	</form>


</body>
</html>