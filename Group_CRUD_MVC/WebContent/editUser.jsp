<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body id ="edit">
	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a class="active" href="goToEdit.do">User Settings</a></li>
	</ul>
	<h2><span>Update Your Information Below</span></h2>
	<br>
	<form method="POST" action="editUser.do">
		<input type="text" name="firstName" placeholder="First Name" /> 
		<input type="text" name="lastName" placeholder="Last Name" /><br><br>
		<input type="text" name="city" placeholder="City" /> 
		<input type="text" name="state" placeholder="State" /> <br><br>
		<span class ="editBtn"><input type="submit" value="Update Information" /></span><br><br>
	</form>
	<form method="POST" action="removeUser.do">
		<span class ="editBtn"><input type="submit" value="Delete Account" /></span>
	</form>
</body>
</html>