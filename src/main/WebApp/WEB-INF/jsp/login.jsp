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
			<div id="loginForm">
				<div class="row">
					<div id="loginFormContent" class="col-md-5">
						<div class="row">
							<h3>Вход в системата</h3>
						</div>

						<div class="row">
							<span> Нямате профил? </span><a href="/Podobri/users/add"><u> Регистрирай се </u></a>
						</div>

						<div class="row">
							<form method="post" action="<c:url value='j_spring_security_check' />">
								<fieldset>
									<c:if test="${not empty var1}">
										<div class="alert alert-error">${message}</div>
									</c:if>
									<label for="username">Username</label> <input type="text" id="username" name="username" /> <label
										for="password">Password</label> <input type="password" id="password" name="password" />
									<div class="form-actions">
										<button type="submit" class="btn">Log in</button>
									</div>
								</fieldset>
							</form>
						</div>

						<div class="row">
							<div id="forgettenPassword">
								<a data-toggle="modal" data-target="#forgottenPassword" href=""><u>Забравена парола?</u></a>
							</div>
						</div>

						<div class="row">
							<div class="modal fade col-md-12" id="forgottenPassword" tabindex="-1" aria-labelledby="myModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-wide50">
									<div class="modal-content col-md-10">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
											<h3>Вход в системата</h3>
										</div>
										<div class="modal-body col-md-12">
											<div class="row">
												<span> Нямате профил? </span><a href="/Podobri/users/add"><u> Регистрирай се </u></a>
											</div>

											<div class="row">
												<form method="post" action="<c:url value='j_spring_security_check' />">
													<fieldset>
														<c:if test="${not empty var1}">
															<div class="alert alert-error">${message}</div>
														</c:if>
														<label for="username">Username</label> <input type="text" id="username" name="username" /> <label
															for="password">Password</label> <input type="password" id="password" name="password" />
														<div class="form-actions">
															<button type="submit" class="btn">Log in</button>
														</div>
													</fieldset>
												</form>
											</div>

											<div class="row">
												<div id="forgettenPassword">
													<a href="#forgottenPassword"><u>Забравена парола?</u></a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- End main content -->
		<jsp:include page="footer.jsp" />
	</div>
	<!-- End container -->
</body>
</html>

