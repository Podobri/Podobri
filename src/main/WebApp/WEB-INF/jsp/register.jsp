<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="/resources/images/" />
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content">
			<div class="register col-md-6 col-md-offset-3">
				<div class="row">
					<div id="register_titles">
						<fieldset>
							<div class="register_user col-md-6 active">
								<a href="#user"> <span class="register_image"> <img alt="" src="${imgURL}register_user.png" />
								</span> <span class="register_text">User registration</span></a>
							</div>

							<div class="register_company col-md-6 inactive">
								<a href="#company"> <span class="register_image"> <img alt="" src="${imgURL}/register_company.png" />
								</span> <span class="register_text">Company registration</span></a>
							</div>
						</fieldset>
					</div>
				</div>
				<div class="row">
					<div class="register_user_inputs">
						<form:errors path="user.*" />
						<form:form id="registerIndividualForm" modelAttribute="user" method="post"
							action="${pageContext.request.contextPath}/users/register/individual/">
							<fieldset>

								<!-- Form Name -->
								<legend>Регистрация</legend>
								<div class="row">
									<!-- Text input-->
									<div class="form-group col-md-6">
										<form:input id="username" path="username" placeholder="потребителско име" required="required"
											cssClass="form-control" />
									</div>

									<!-- Text input-->
									<div class="form-group col-md-6">
										<form:input id="email" path="email" type="email" placeholder="email" required="required"
											cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<!-- Password input -->
									<div class="form-group col-md-6">
										<form:password id="password" path="password" placeholder="парола" required="required" cssClass="form-control" />
									</div>

									<!-- Password input -->
									<div class="form-group col-md-6">
										<form:password id="paswordConfirm" path="confirmedPassword" placeholder="повторете паролата"
											required="required" cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-6">
										<form:input id="firstName" path="individual.firstName" placeholder="име" required="required"
											cssClass="form-control" />
									</div>

									<div class="form-group col-md-6">
										<form:input id="lastName" path="individual.lastName" placeholder="фамилия" required="required"
											cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-6">
										<form:select id="gender" path="individual.isMale" cssClass="form-control">
											<form:option id="famele" value="false">Жена</form:option>
											<form:option id="male" value="true">Мъж</form:option>
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
											<form:option id="countryNone" value="-1">---Държава---</form:option>
											<form:options items="${countries}" itemValue="id" itemLabel="country" />
										</form:select>
									</div>

									<div class="form-group col-md-6">
										<form:select id="city" path="userInfo.city.id" cssClass="form-control">
											<form:option id="cityNone" value="-1">---Град---</form:option>
											<form:options items="${cities}" itemValue="id" itemLabel="city" />
										</form:select>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<form:select id="educations" path="individual.education.id" cssClass="form-control">
											<form:option id="educationNone" value="-1">---Образование---</form:option>
											<form:options items="${educations}" itemValue="id" itemLabel="education" />
										</form:select>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-6">
										<form:label path="activities">Интереси</form:label>
										<form:select id="activities" path="activities" multiple="true" cssClass="form-control">
											<form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
										</form:select>
									</div>

									<div class="form-group col-md-6">
										<form:label path="individual.languages">Езици</form:label>
										<form:select id="languages" path="individual.languages" multiple="true" cssClass="form-control">
											<form:options items="${languages}" itemValue="id" itemLabel="language" />
										</form:select>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<label class="control-label" for="description"></label>
										<form:textarea id="description" path="userInfo.description" placeholder="описание за себе си" rows="5"
											cols="78" cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="col-md-2">
										<input id="tos" type="checkbox" required="required">
									</div>
									<div class="text-left col-md-6">
										<span> I've read the </span> <a href="#">Terms and Condition</a>
									</div>
									<div class="text-center col-md-4">
										<button id="registerIndividual" class="btn btn-success btn-lg" type="submit">РЕГИСТРАЦИЯ</button>
									</div>
								</div>

							</fieldset>
						</form:form>
					</div>
				</div>

				<div class="row">
					<div class="register_company_inputs hide">
						<form:errors path="user.*" />
						<form:form id="registerOrganizationForm" modelAttribute="user" method="post"
							action="${pageContext.request.contextPath}/users/register/organization">
							<fieldset>

								<legend>Регистрация</legend>
								<div class="row">
									<div class="form-group col-md-6">
										<form:input id="username" path="username" placeholder="име на организация" required="required"
											cssClass="form-control" />
									</div>

									<div class="form-group col-md-6">
										<form:input id="email" path="email" type="email" placeholder="email" required="required"
											cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-6">
										<form:password id="password" path="password" placeholder="парола" required="required" cssClass="form-control" />
									</div>

									<div class="form-group col-md-6">
										<form:password id="paswordConfirm" path="confirmedPassword" placeholder="Повторете паролата"
											required="required" cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<form:select id="organizationType" path="organization.organizationsType" cssClass="form-control">
											<form:option id="organizationType" value="-1">---Тип на организацията---</form:option>
											<form:options items="${organizationTypes}" itemValue="id" itemLabel="type" />
										</form:select>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<form:select id="activitiess" path="activities" cssClass="form-control">
											<form:option id="activityNone" value="-1" disabled="true">---Сфера на дейност---</form:option>
											<form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
										</form:select>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-6">
										<form:select id="country" path="userInfo.country.id" cssClass="form-control">
											<form:option id="countryNone" value="-1">---Държава---</form:option>
											<form:options items="${countries}" itemValue="id" itemLabel="country" />
										</form:select>
									</div>

									<div class="form-group col-md-6">
										<form:select id="city" path="userInfo.city.id" cssClass="form-control">
											<form:option id="cityNone" value="-1">---Град---</form:option>
											<form:options items="${cities}" itemValue="id" itemLabel="city" />
										</form:select>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<form:input id="address" path="organization.address" placeholder="адрес" required="required"
											cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-12">
										<label class="control-label" for="description"></label>
										<form:textarea id="description" path="userInfo.description" placeholder="описание" rows="5" cols="78"
											cssClass="form-control" />
									</div>
								</div>

								<div class="row">
									<div class="text-left col-md-6">
										<input id="tos" type="checkbox"> <label for="tos"> I've read the <a href="#">Terms
												and Condition</a></label>
									</div>
									<div class="text-center col-md-6">
										<button id="registerOrganization" class="btn btn-success btn-lg" type="submit">РЕГИСТРАЦИЯ</button>
									</div>
								</div>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<!-- End main content -->
		<jsp:include page="footer.jsp" />
	</div>
	<!-- End container -->
	<script>
		$(document).ready(function dateChange() {
			var date = $('#dateInput').val();
			$('#birthdate').val('date');
		});
		
		$('#activities').chosen();
		$('#activitiess').chosen();
		$('#languages').chosen();
	</script>
</body>
</html>

<!-- <?php -->
<!-- //AJAX for Dynamic Drop down -->
<!-- //$this->Js->get('.country_id')->event('change',  -->
<!-- //    $this->Js->request(array( -->
<!-- //      'controller'=>'users', -->
<!-- //      'action' =>'getCitiesByCountries', -->
<!-- //    ), array( -->
<!-- //        'update' =>'.city_id', -->
<!-- //        'async' => true, -->
<!-- //        'method' => 'Post', -->
<!-- //        'dataExpression'=>true, -->
<!-- //        'data'=> $this->Js->serializeForm(array( -->
<!-- //        'isForm' => true, -->
<!-- //        'inline' => true -->
<!-- //      )) -->
<!-- //    )) -->
<!-- //); -->
<!-- // -->
<!-- //// END AJAX -->
<!-- ?> -->

<!-- <script> -->
<!-- // 	$(document).ready( -->
<!-- // 			function() { -->
<!-- // 				$(".country_id").bind( -->
<!-- // 						"change", -->
<!-- // 						function(event) { -->
<!-- // 							var $targetCity = $(this).parent().parent() -->
<!-- // 									.parent().find('.city_id'); -->
<!-- // 							var $data = "country_id=" + $(this).val(); -->

<!-- // 							$.ajax({ -->
<!-- // 								async : true, -->
<!-- // 								data : $data, -->
<!-- // 								dataType : "html", -->
<!-- // 								success : function(data, textStatus) { -->
<!-- // 									$targetCity.html(data); -->
<!-- // 								}, -->
<!-- // 								type : "Post", -->
<!-- // 								url : "\/Podobri\/users\/getCitiesByCountries" -->
<!-- // 							}); -->
<!-- // 							return false; -->

<!-- // 						}); -->
<!-- // 			}); -->
<!-- </script> -->
