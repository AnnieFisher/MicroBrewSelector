<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Tell Us Your Suggestion</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
</head>
<body>

	<ul>
		<li><a href="index.html">Home Page</a></li>
		<li><a class="active" href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
	</ul>

	<h2>Tell Us Your Suggestion!</h2>

<form action="suggestBeer.do" method="POST">">

		<select name="typeId">
			<c:forEach var="type" items="${typeList}">
				<option value="${type.id}">${type.name}</option>
			</c:forEach>
		</select>
		<select name="tasteId">
			<c:forEach var="taste" items="${tasteList}">
				<option value="${taste.id}">${taste.name}</option>
			</c:forEach>
		</select> 

		<select name="styleId">
			<c:forEach var="style" items="${styleList}">
				<option value="${style.id}">${style.name}</option>
			</c:forEach>
		</select>
		
		 <input type="text" name="name" placeholder="name"/>
		 <input type="number" name="rating" placeholder="Rate 1-5"/>
		 <input	type="text" name="brandId" placeholder="Enter Brand"/>
	
		 <input type="submit" value="Submit Your Suggestion" />
	</form>
</body>
</html>