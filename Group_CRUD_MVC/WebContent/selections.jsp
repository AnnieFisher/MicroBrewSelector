<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <h2>${}</h2> --%>
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

			<c:forEach var="beer" items="${beerList}">

				<tr>
				<td>
				 <a href="goToDetails.do?id=${beer.id}">${beer.name}</a>
				</td>
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