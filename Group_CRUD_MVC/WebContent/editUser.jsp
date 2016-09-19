<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>New User</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>
	<ul>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a class="active" href="editUser.do">User Settings</a></li>
	</ul>
	<h2>Update Your Information Below</h2>
	<br>
	<form method="POST" action="editUser.do">
		<input type="text" name="firstName" placeholder="First Name" /> <input
			type="text" name="lastName" placeholder="Last Name" /> <input
			type="text" name="city" placeholder="City" /> <input type="text"
			name="state" placeholder="State" /> <input type="submit"
			value="Update Information" />
	</form>
</body>
</html>