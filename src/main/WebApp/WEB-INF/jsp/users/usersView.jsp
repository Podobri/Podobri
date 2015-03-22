<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="/resources/images/" />
<!DOCTYPE html">
<html>
<jsp:include page="../layout/head.jsp" />
<body>
	<div class="container">
		<jsp:include page="../layout/menu.jsp" />
		<div id="content">
			<div id="userProfilePage" class="col-md-10">
				<div class="row">
					<div id="userProfilePageTitle">
						<h3>
							<strong><spring:message code="mainPage" /></strong>
						</h3>
					</div>
				</div>
				<div class="row">
					<div id="pageWelcome" class="center col-md-12">
						<h1 class="pull-down">
							<span><spring:message code="welcome" /> ${user.individual != null ? user.individual.fullName : user.organization.name }</span>
						</h1>
					</div>
				</div>

				<div class="row">
					<div id="eventViewFullMenu" class="menuTabs">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#profileMyNotifications"><span><spring:message
											code="newsAndNotifies" /></span></a></li>
							<li><a data-toggle="tab" href="#profileEdit"><span><spring:message code="profileEdit" /></span></a></li>
							<li><a data-toggle="tab" href="#changePassword"><span><spring:message code="changePassword" /></span></a></li>
							<li><a data-toggle="tab" href="#profileMyEvents"><span><spring:message code="menuMyEvents" /></span></a></li>
						</ul>
					</div>
				</div>

				<div class="row">
					<div id="profileContent" class="tab-content">
						<div id="profileMyNotifications" class="tab-pane fade in active">
							<div class="notify row">
								<div class="notify-left col-md-2 text-center">
									<a href=""> <img class="img-circle" alt="" src="${imgURL}team1_128x128.jpg">
									</a>
								</div>
								<div class="notify-right col-md-10">
									<p>GuyWith Glasses следва страницата на организация</p>
									<p>
										<a href="">Вижте профила</a> на GuyWith Glasses
									</p>
								</div>
							</div>

							<div class="notify row">
								<div class="notify-left col-md-2 text-center">
									<a href=""> <img class="img-circle" alt="" src="${imgURL}team1_128x128.jpg">
									</a>
								</div>
								<div class="notify-right col-md-10">
									<p>Милен Иванов кандидатства за членство.</p>
									<p>
										<a href="">Изтеглете</a> апликационната форма на кандидата
									</p>
									<p>
										<a href="">Вижте профила</a> на Милен Иванов
									</p>
								</div>
							</div>

							<div class="notify row">
								<div class="notify-left col-md-2 text-center">
									<a href=""> </a>
								</div>
								<div class="notify-right col-md-10">
									<p>13 потребители следват страницата на организацията.</p>
								</div>
							</div>

							<div class="notify row">
								<div class="notify-left col-md-2 center">
									<a href=""> <img class="img-circle" alt="" src="${imgURL}team1_128x128.jpg">
									</a>
								</div>
								<div class="notify-right col-md-10">
									<p>24 потребители са потвърили участието си за Семинар "Организационни умения".</p>
									<p>
										<a href="">Вижте събитието</a> "Организационни умения".
									</p>
								</div>
							</div>
						</div>

						<div id="profileEdit" class="tab-pane fade col-md-12">
							<div class="row">
								<div class="register_user_inputs ">
									<form:errors path="user.*" />
									<form:form id="registerIndividualForm" modelAttribute="user" method="post"
										action="${pageContext.request.contextPath}/users/updateUser">
										<fieldset>

											<!-- Form Name -->
											<legend>
												<spring:message code="editing" />
											</legend>
											<div class="row">
												<div class="form-group col-md-6">
													<spring:message code="name" var="namePlacholder" />
													<form:input id="firstName" path="individual.firstName" placeholder="${namePlaceholder }"
														required="required" cssClass="form-control" />
												</div>

												<div class="form-group col-md-6">
													<spring:message code="lastname" var="lastnamePlacholder" />
													<form:input id="lastName" path="individual.lastName" placeholder="${lastnamePlacholder }"
														required="required" cssClass="form-control" />
												</div>
											</div>

											<div class="row">
												<div class="form-group col-md-6">
													<form:select id="gender" path="individual.isMale" cssClass="form-control">
														<form:option id="famele" value="false">
															<spring:message code="famele" />
														</form:option>
														<form:option id="male" value="true">
															<spring:message code="male" />
														</form:option>
													</form:select>
												</div>

												<div class="form-group col-md-6">
													<form:input id="dateInput" path="individual.birthdate" type="date"
														cssClass="form-control date datepicker margin-top-none input-xxlarge" placeholder="23/9/2013"
														required="required" />
												</div>
											</div>

											<div class="row">
												<div class="form-group col-md-6">
													<form:select id="country" path="userInfo.country.id" cssClass="form-control">
														<form:option id="countryNone" value="-1">---<spring:message code="country" />---</form:option>
														<form:options items="${countries}" itemValue="id" itemLabel="country" />
													</form:select>
												</div>

												<div class="form-group col-md-6">
													<form:select id="city" path="userInfo.city.id" cssClass="form-control">
														<form:option id="cityNone" value="-1">---<spring:message code="city" />---</form:option>
														<form:options items="${cities}" itemValue="id" itemLabel="city" />
													</form:select>
												</div>
											</div>

											<div class="row">
												<div class="form-group col-md-12">
													<form:select id="educations" path="individual.education.id" cssClass="form-control">
														<form:option id="educationNone" value="-1">---<spring:message code="education" />---</form:option>
														<form:options items="${educations}" itemValue="id" itemLabel="education" />
													</form:select>
												</div>
											</div>

											<div class="row">
												<div class="form-group col-md-6">
													<form:label path="activities">
														<spring:message code="activityUser" />
													</form:label>
													<form:select id="activitiesUser" path="activities" multiple="true" cssClass="form-control">
														<form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
													</form:select>
												</div>

												<div class="form-group col-md-6">
													<form:label path="individual.languages">
														<spring:message code="languages" />
													</form:label>
													<form:select id="languages" path="individual.languages" multiple="true" cssClass="form-control">
														<form:options items="${languages}" itemValue="id" itemLabel="language" />
													</form:select>
												</div>
											</div>

											<div class="row">
												<div class="form-group col-md-12">
													<label class="control-label" for="description"></label>
													<spring:message code="userDescription" var="userDescriptionPlaceholder" />
													<form:textarea id="description" path="userInfo.description" placeholder="${userDescriptionPlaceholder }"
														rows="5" cols="78" cssClass="form-control" />
												</div>
											</div>

											<div class="row">
												<div class="text-center">
													<button id="registerIndividual" class="btn btn-success btn-lg" type="submit">
														<spring:message code="saveBtn" />
													</button>
												</div>
											</div>

										</fieldset>
									</form:form>
								</div>
							</div>
						</div>

						<div id="changePassword" class="tab-pane fade col-md-8">
							<div class="row">
								<div class="form-group col-md-12">
									<spring:message code="oldPassword" var="oldPassPlaceholder" />
									<spring:message code="newPassword" var="newPassPlaceholder" />
									<spring:message code="repeatNewPassword" var="rePassPlaceholder" />
									<input id="lastName" type="password" placeholder="${oldPassPlaceholder }" required="required"
										class="form-control" /> <input id="lastName" type="password" placeholder="${newPassPlaceholder }"
										required="required" class="form-control" /> <input id="lastName" type="password"
										placeholder="${rePassPlaceholder }" required="required" class="form-control" />
									<button type="submit" class="btn btn-primary save">
										<spring:message code="saveBtn" />
									</button>
								</div>
							</div>
						</div>
						<jsp:include page="../events/myEventsUser.jsp"></jsp:include>
					</div>
				</div>
			</div>
			<!-- End profile -->
			<jsp:include page="../reklams.jsp" />
		</div>
		<jsp:include page="../layout/footer.jsp" />
	</div>
	<script>
		$(document).ready(
				function() {
					$('.pull-down').css(
							'margin-top',
							$('.pull-down').parent().height()
									- $('.pull-down').height());

					$('.myEventsTable').DataTable(
							{
								"aoColumnDefs" : [ {
									'bSortable' : false,
									'aTargets' : [ -1 ]
								} ],
								"aLengthMenu" : [ [ 5, 10, 25, 50, -1 ],
										[ 5, 10, 25, 50, "All" ] ]
							});
				});
	</script>
</body>
</html>