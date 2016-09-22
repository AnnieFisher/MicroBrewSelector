<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body class = "admin">

<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToBeersAdmin.do">Full List</a></li>
		<li><a class="active" href="getUserList.do">List of Users</a></li>
		<li><a href="SignOut.do">Logout</a></li>

	</ul>

	<table>
		<thead>
			<tr>
				<td>Username</td>
				<td>Password</td>
				<td>First Name</td>
				<td>Last Name</td>
				<td>City</td>
				<td>State</td>

				<td>Remove User</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="user" items="${userList}">

				<tr>
					<td>${user.username}</td>
					<td>${user.password}</td>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.city}</td>
					<td>${user.state}</td>
				

					<td><form method="POST" action="removeUserAdmin.do">
							<input type="hidden" value="${user.id}" name= "id" />
							<input type="submit" value="Delete Account" />
						</form></td>
				
				</tr>
			</c:forEach>
		</tbody>
	</table>




</body>
</html>