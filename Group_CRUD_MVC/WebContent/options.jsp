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