<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<div class="row">
	<div class="modal fade col-md-12" id="login" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-wide40">
			<div class="modal-content col-md-8">
				<div id="loginFormContent">
					<div class="panel-default">
						<div class="panel-body">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
							<h3 class="thin text-center">Вход в системата</h3>
							<p class="text-center text-muted">
								<span> Нямате профил? </span><a href="${pageContext.request.contextPath}/users/register">Регистрирай се</a>.
							</p>
							<c:if test="${not empty var1}">
								<div class="alert alert-error">${message}</div>
							</c:if>

							<hr>

							<form method="post" action="<c:url value='j_spring_security_check' />">
								<div class="row">
									<div class="top-margin">
										<input type="text" class="form-control" placeholder="email">
									</div>
								</div>
								<br />
								<div class="row">
									<div class="top-margin">
										<input type="password" class="form-control" placeholder="password">
									</div>
								</div>
								<br />
								<div class="row">
									<div class="text-center">
										<input type="checkbox"> <label>Запомни ме</label>
									</div>
								</div>

								<div class="row">
									<div class="text-center">
										<button class="btn btn-success" type="submit">В Х О Д</button>
									</div>
								</div>
								<div class="row">
									<div id="forgettenPassword" class="text-center">
										<b> <a data-toggle="modal" data-target="#forgottenPassword" href="">Забравена парола?</a></b>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</div>