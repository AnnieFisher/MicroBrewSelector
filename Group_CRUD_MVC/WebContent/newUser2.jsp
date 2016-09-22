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
<body class="newUser">
	<ul class=navbar>
		<li><a href="index.html">Return to Home Page</a></li>
	</ul>
<h2><span>Fill out the form below</span></h2>
<br>
	<form method="POST" action="addUser.do">
		<input type="text" name="firstName" placeholder="First Name" /> 
		<input type="text" name="lastName" placeholder="Last Name" /> 
			<input type="text" name="username" placeholder="Username" /> 
			<h5><span class ="editBtn">This username is taken. Please try another username.</span></h5>
			<br>
			<input type="text" name="password" placeholder="Password" /> 
			<input type="text" name="city" placeholder="City" /> 
			<input type="text" name="state" placeholder="State" /> 
			<br>
			<input type="submit" value="Become User" />

 </form>
</body>
</html>