<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content">
		<!-- INSERT MAIN CONTENT HERE -->
		</div> <!-- End main content -->
		<jsp:include page="footer.jsp" />
	</div> <!-- End container -->
</body>
</html>