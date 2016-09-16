<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Your Faves</title>
</head>
<body>

<p>You're logged in to this mother</p>

<table>
		<thead>
			<tr>
				<td>Name</td>
				<td>Rating</td>
				<td>Taste</td>
				<td>Type</td>
				<td>Style</td>
				<td>Brand</td>
			</tr>
		</thead>
		<tbody>
		
		<c:forEach var="beer" items="${faveList}">
			
			<tr>
				<td>${beer.name}</td>
				<td>${beer.rating}</td>
				<td>${beer.taste.name}</td>
				<td>${beer.type.name}</td>
				<td>${beer.style.name}</td>
				<td>${beer.brand.name}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</body>
</html>