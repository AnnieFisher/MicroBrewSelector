<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Tell Us Your Suggestion</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body id="suggest">

	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a class="active" href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
	</ul>

	
<div class="container">
<h2><span class=suggest>Add A Beer to the Directory!</span></h2><br>
<div class="row">

			<div class="five columns">
				<form action="suggestBeer.do" method="POST">

					<span class=suggest>Type</span>  
					<select name="typeId">
						<c:forEach var="type" items="${typeList}">
							<option value="${type.id}">${type.name}</option>
						</c:forEach>
					</select> <br> <br>
					<span class=suggest>Taste</span>
					<select name="tasteId">
						<c:forEach var="taste" items="${tasteList}">
							<option value="${taste.id}">${taste.name}</option>
						</c:forEach>
					</select> <br>
					<br>
					<span class=suggest>Style</span>
					<select name="styleId">
						<c:forEach var="style" items="${styleList}">
							<option value="${style.id}">${style.name}</option>
						</c:forEach>
		</select> 
		</form>
		</div>
			<div class="seven columns">
	
			<form action="suggestBeer.do" method="POST">
		<input type="text" name="name" placeholder="Name" /> <br><br>
		<input type="text" name="brandId" placeholder="Brand" /> <br><br><input
			type="submit" value="Submit Your Suggestion" />
				</form>
	</div>
	</div>
	</div>
</body>
</html>