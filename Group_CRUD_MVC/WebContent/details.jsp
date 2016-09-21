<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta charset="UTF-8">
<title>Details</title>
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
<link rel="stylesheet" type="text/css" href="stylesheet3.css" />
<link rel="stylesheet" type="text/css" href="stylesheet2.css" />
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body id="details">

	<ul class=navbar>
		<li><a href="index.html">Home Page</a></li>
		<li><a href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
	</ul>
	<div class="container">
		<div class="row">
			<div class="six columns">
				<div class=looks>
					<h2>${beer.name }</h2>


					<h4>${beer.brand.name }</h4>
				</div>
			</div>
			<div class="six columns">
				<img id="logo" src="${beer.brand.url}" alt="logo" />

			</div>
		</div>

		<div class=looks>
			<h5>Number of likes: ${beer.rating }</h5>
			<div class="row">
				<h5>Taste: ${beer.taste.name }</h5>
				<h5>About ${beer.style.name }s: ${beer.style.description }</h5>
				<h5>About ${beer.type.name }s: ${beer.type.description }</h5>
			</div>
		</div>



		<br>
		<div class="row">
			<div class="six columns">
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d1306385.860811039!2d-105.5584486352947!3d39.90779742870506!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sliquor+store+${user.city}!5e0!3m2!1sen!2sus!4v1474385739312"
					width="400" height="300" frameborder="0" style="border: 0"
					allowfullscreen></iframe>

				<p>
					<span>Find stores near you!</span>
				</p>

				<br>
				<form action="addToFavoritesFromDetails.do" method="POST">

					<input type="hidden" value="${beer.id}" name="addBeerId" /> <input
						type="submit" value="Add To Favorites" />
				</form>

			</div>
			<div class="six columns">
				
					<h2>Users Who Favorited This Beer!</h2>
					<div id="FaveByUser">
					<table>
						<thead>
							<tr class=heads>
								<td>Username</td>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="item" items="${userList}">

									<td>${item.username}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

</html>



