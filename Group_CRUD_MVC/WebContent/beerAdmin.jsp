<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Beer Inventory: Admin</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body>

	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a class="active" href="goToBeersAdmin.do">Full List</a></li>
		<li><a href="getUserList.do">List of Users</a></li>
		<li><a href="SignOut.do">Logout</a></li>

	</ul>

	<table>
		<thead>
			<tr class=heads>
				<td>Name</td>
				<td>Taste</td>
				<td>Type</td>
				<td>Style</td>
				<td>Brand</td>
				<td>Edit Beer</td>
				<td>Delete Beer From Inventory</td>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="beer" items="${beerList}">

				<tr>
					<td>${beer.name}</td>
					<td>${beer.taste.name}</td>
					<td>${beer.type.name}</td>
					<td>${beer.style.name}</td>
					<td>${beer.brand.name}</td>
					<td class=specialbutton>
						<form action="goToEditBeer.do" method="POST">
							<input type="hidden" value="${beer.id}" name="editBeerId" /> <input
								type="submit" value="Edit" />
						</form>
					</td>
					<td class=specialbutton>
						<form action="deleteBeerAdmin.do" method="POST">
							<input type="hidden" value="${beer.id}" name="deleteBeerId" /> <input
								type="submit" value="Delete" />
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>