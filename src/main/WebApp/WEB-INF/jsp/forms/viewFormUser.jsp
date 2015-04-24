<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
	<div class="container">
		<jsp:include page="../layout/menu.jsp" />
		<div id="content">
			<div class="col-md-10">
				<form action="${pageContext.request.contextPath}/events/applyForm" method="POST">
					<input id="post-address" type="hidden" value="${pageContext.request.contextPath}/events/applyForm" name="address">
					<input id="event-id" type="hidden" value="${event.id }" name="eventId">
					<div id="form-content">
						<p>${formContent}</p>
					</div>
					<input id="apply-submit" type='submit' value="<spring:message code="saveBtn" />">
				</form>
			</div>
			<jsp:include page="../ads.jsp" />
		</div>
		<!-- End main content -->
		<jsp:include page="../layout/footer.jsp" />
	</div>
	<!-- End container -->
	<script>
		$('#apply-submit').click(function(e) {
			e.preventDefault();
			var content = $('#form-content').contents().html();
			var address = $('#post-address').val();
			var eventId = $('#event-id').val();
			$.ajax({
				type : "POST",
				url : address,
				data : {
					"content" : content,
					"eventId" : eventId
				}
			}).done(function(data) {
			});
			return false;
		});
	</script>
</body>
</html>