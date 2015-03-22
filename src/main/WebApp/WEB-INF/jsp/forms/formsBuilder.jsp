<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<c:url var="resURL" value="/resources" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
	<div class="container">
		<jsp:include page="../layout/menu.jsp" />
		<div id="content">
			<div id="formsBuilder" class="col-md-10">
				<form action="${pageContext.request.contextPath}/forms/add" method="POST">
					<iframe id="formBuilderFrame" src="${resURL}/vendors/formbuilder/index.html"></iframe>
					<input id="postAddress" type="hidden" value="${pageContext.request.contextPath}/forms/add" name="address">
					<label for="formName"><spring:message code="formName" />:</label>
					<input id="formName" type='text' required="required" />
					<input id="formBuilderSubmit" type='submit' value="<spring:message code="saveBtn" />">
				</form>
			</div>
			<jsp:include page="../reklams.jsp" />
		</div>
		<!-- End main content -->
		<jsp:include page="../layout/footer.jsp" />
	</div>
	<!-- End container -->
	<script>
		$('#formBuilderSubmit').click(
				function(e) {

					//new Date().getTime();
					e.preventDefault();
					var responseFields = $('#formBuilderFrame').contents().find('.fb-response-fields');
					responseFields.find('input, select').each(function(){
							$(this).attr('name', new Date().getTime()+Math.floor((Math.random() * 100) + 1));
						});
					responseFields.find('.actions-wrapper').remove();
					var content = responseFields.html();
					console.log(content);
					var address = $('#postAddress').val();
					var formName = $('#formName').val();
					$.ajax({ 
						type: "POST",
						url : address,
						data : {
							"content" : content,
							"formName" : formName
						}
					}).done(function(data){
					if(data)
					{
						console.log('success');
					}
					else
					{
						console.log('failed');
					}
					});
					return false;
				});
	</script>
</body>
</html>