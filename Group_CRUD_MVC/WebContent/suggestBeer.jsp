<!DOCTYPE html>
<html>
<head>
<title>Tell Us Your Suggestion</title>
<link rel="stylesheet" type="text/css" href="stylesheet.css" />
<link rel="stylesheet" type="text/css" href="normalize.css" />
<link rel="stylesheet" type="text/css" href="skeleton.css" />
</head>
<body>

	<ul>
		<li><a href="index.html">Home Page</a></li>
		<li><a class="active" href="goToFavorites.do">Your Favorites</a></li>
		<li><a href="goToBeers.do">Full List</a></li>
		<li><a href="goToOptions.do">Palate Options</a></li>
		<li><a href="goToEdit.do">User Settings</a></li>
	</ul>

	<h2>Tell Us Your Suggestion!</h2>

	<form method="suggestBeer.do" method="POST"> <!-- suggestBeer.do not implemented yet -->
		Name:<br> <input type="text" name="name" /><br> Rating:<br>
		<input type="text" name="rating" /><br> Style:<br> <input
			type="text" name="style" /><br> Type:<br> <input
			type="text" name="type" /><br> Taste:<br> <input
			type="text" name="taste" /><br> Brand:<br> <input
			type="text" name="brand" /><br>
		<br> <input type="submit" value="Submit Your Suggestion" />
	</form>
</body>
</html>