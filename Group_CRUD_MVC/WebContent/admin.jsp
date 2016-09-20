<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Admin</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
</head>
<body>

<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
		<li><a href="SignOut.do">Logout</a></li>
		<li><a class="active" href="getUserList.do">Admin</a></li>

	</ul>

	<table>
		<thead>
			<tr>
				<td>username</td>
				<td>password</td>
				<td>firstName</td>
				<td>lastName</td>
				<td>city</td>
				<td>state</td>

				<td>Remove User</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="user" items="${userList}">

				<tr>
					<%-- <form method="GET" action="getUserList.do"> --%>
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