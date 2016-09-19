<!DOCTYPE html >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form method="GET" action="GetType.do">
	<input type ="text" name="id" placeholder="Type of Beer"/>
<!-- 	<input type ="submit" value="Get Type of Beer"/> -->
</form>
<form method="GET" action="GetTaste.do">
	<input type ="text" name="id" placeholder="Taste of Beer"/>
	<!-- <input type ="submit" value="Taste of Beer"/> -->
</form>
<form method="GET" action="GetStyle.do">
	<input type ="text" name="id" placeholder="Style of Beer"/>
	<input type ="submit" value="Selection of Beer"/>
</form>

</body>
</html>