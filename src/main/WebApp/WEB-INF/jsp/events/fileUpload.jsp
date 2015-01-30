<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form modelAttribute="event" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/events/fileUploadSubmit">
		Some file: <input type="file" name="file"> <br /> 
		<br />
		<input type="submit" value="Upload">
	</form:form>
</body>
</html>