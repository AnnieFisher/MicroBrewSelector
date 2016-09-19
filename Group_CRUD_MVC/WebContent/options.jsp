<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="GET" action="GetType.do">
<select name="id">
			<option value="1">Ale</option>
			<option value="2">Lager</option>
			<option value="3">Stout</option>
			<option value="4">Porter</option>
			<option value="5">Malt</option>
			<option value="6">Cider</option>
		</select>
	<input type ="submit" value="Get Type of Beer"/> 
</form>
<form method="GET" action="GetTaste.do">
	<select name="id">
			<option value="1">Bitter</option>
			<option value="2">Sweet</option>
			<option value="3">Crisp</option>
			<option value="4">Creamy</option>
			<option value="5">Coffee</option>
			<option value="6">Dry</option>
			<option value="7">Citrus</option>
			<option value="8">Malty</option>
			<option value="9">Nutty</option>
			<option value="10">Spicy</option>
			<option value="11">Hoppy</option>
		</select>
	<input type ="submit" value="Taste of Beer"/>
</form>
<form method="GET" action="GetStyle.do">
	<select name="id">
			<option value="1">Amber</option>
			<option value="2">Blonde</option>
			<option value="3">Brown</option>
			<option value="4">Cream</option>
			<option value="5">Dark</option>
			<option value="6">Fruit</option>
			<option value="7">Golden</option>
			<option value="8">Honey</option>
			<option value="9">I.P.A.</option>
			<option value="10">Light</option>
			<option value="11">Pale</option>
			<option value="12">Pilsner</option>
			<option value="13">Red</option>
			<option value="14">Strong</option>
			<option value="15">Wheat</option>
		</select>
	<input type ="submit" value="Selection of Beer"/>
</form>

</body>
</html>