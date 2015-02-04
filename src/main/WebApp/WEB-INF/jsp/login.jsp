<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" /> 
<html>
<jsp:include page="layout/head.jsp" />
<body>
	<div class="container">
		<jsp:include page="layout/menu.jsp" />
		<div id="content">
			<div id="loginFormContent" class="col-md-6 col-md-offset-3">
				<h3 class="thin text-center">Вход в системата</h3>
				<p class="text-center text-muted">
					<span> Нямате профил? </span><a href="${pageContext.request.contextPath}/users/register">Регистрирай се</a>.
				</p>

				<c:if test="${not empty error}">
					<div class="alert alert-error">${error}</div>
				</c:if>

				<hr>

				<form method="post" action="${pageContext.request.contextPath}/j_spring_security_check?targetUrl=${targetUrl}">
					<div class="row">
						<div class="top-margin">
							<input type="text" class="form-control" name="j_username" placeholder="email/потребителско име" required="required">
						</div>
					</div>
					<br />
					<div class="row">
						<div class="top-margin">
							<input type="password" class="form-control" name="j_password" placeholder="парола" required="required">
						</div>
						<div id="forgettenPassword">
							<b> <a data-toggle="modal" data-target="#forgottenPassword" href="">Забравена парола?</a></b>
						</div>
					</div>
					<br />
					<c:if test="${empty loginUpdate}">
						<div class="row">
							<div class="text-center">
								<input id="remember-me" name="remember-me" type="checkbox"> <label for="remember-me">Запомни ме</label>
							</div>
						</div>
					</c:if>

					<div class="row">
						<div class="text-center">
							<button class="btn btn-success btn-lg" type="submit">В Х О Д</button>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
			</div>
		</div>
		<!-- End main content -->
		<jsp:include page="layout/footer.jsp" />
	</div>
	<!-- End container -->
</body>
</html>