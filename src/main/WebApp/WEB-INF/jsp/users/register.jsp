<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="/resources/images/" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
  <div class="container">
    <jsp:include page="../layout/menu.jsp" />
    <div id="content">
      <div class="register col-md-9 col-md-offset-1">
        <div class="row">
          <div id="register-titles">
            <fieldset>
              <div class="register-user col-md-6 active">
                <a href="#user"> <span class="register-image"> <img alt="" src="${imgURL}register_user.png" />
                </span> <span class="register-text"><spring:message code="userRegistration" /></span></a>
              </div>
              <div class="register-company col-md-6 inactive">
                <a href="#company"> <span class="register-image"> <img alt="" src="${imgURL}/register-company.png" />
                </span> <span class="register-text"><spring:message code="organizationRegistration" /></span></a>
              </div>
            </fieldset>
          </div>
        </div>
        <div class="row">
          <div class="register-user-inputs">
            <form:errors path="user.*" />
            <form:form id="registerIndividualForm" modelAttribute="user" method="post"
              action="${pageContext.request.contextPath}/users/register/individual/">
              <fieldset>
                <!-- Form Name -->
                <legend>
                  <spring:message code="registration" />
                </legend>
                <div class="row">
                  <!-- Text input-->
                  <div class="form-group col-md-6">
                    <spring:message code="username" var="usernamePlaceholder" />
                    <form:input id="username" path="username" placeholder="${usernamePlaceholder }"
                      data-validate="required,alphaNumeric,min(6),max(70)" cssClass="form-control" />
                  </div>
                  <!-- Text input-->
                  <div class="form-group col-md-6">
                    <spring:message code="email" var="emailPlaceholder" />
                    <form:input id="email" path="email" type="email" placeholder="${emailPlaceholder }"
                      data-validate="required,email,min(6),max(70)" cssClass="form-control" />
                  </div>
                </div>
                <div class="row">
                  <!-- Password input -->
                  <div class="form-group col-md-6">
                    <spring:message code="password" var="passwordPlaceholder" />
                    <form:password id="password" path="password" placeholder="${passwordPlaceholder }"
                      data-validate="required,alphaNumeric,min(6),max(40)" cssClass="form-control" />
                  </div>
                  <!-- Password input -->
                  <div class="form-group col-md-6">
                    <spring:message code="repeatPassword" var="repeatPasswordPlaceholder" />
                    <form:password id="pasword-confirm" path="confirmedPassword" placeholder="${repeatPasswordPlaceholder }"
                      data-validate="required,alphaNumeric,min(6),max(40)" cssClass="form-control" />
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <spring:message code="name" var="namePlaceholder" />
                    <form:input id="firstname" path="individual.firstName" placeholder="${namePlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(30)" cssClass="form-control" />
                  </div>
                  <div class="form-group col-md-6">
                    <spring:message code="lastname" var="lastnamePlaceholder" />
                    <form:input id="lastname" path="individual.lastName" placeholder="${lastnamePlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(30)" cssClass="form-control" />
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
                    <form:input id="birthdate" path="individual.birthdate" type="date"
                      cssClass="form-control date datepicker margin-top-none input-xxlarge" placeholder="23/9/2013"
                      required="required" />
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <form:select id="country" path="userInfo.country.id" cssClass="form-control">
                      <form:option id="country-none" value="-1">---<spring:message code="country" />---</form:option>
                      <form:options items="${countries}" itemValue="id" itemLabel="country" />
                    </form:select>
                  </div>
                  <div class="form-group col-md-6">
                    <form:select id="city" path="userInfo.city.id" cssClass="form-control">
                      <form:option id="city-none" value="-1">---<spring:message code="choiceCountryLbl" />---</form:option>
                      <%-- 											<form:options items="${cities}" itemValue="id" itemLabel="city" /> --%>
                    </form:select>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12">
                    <form:select id="educations" path="individual.education.id" cssClass="form-control">
                      <form:option id="education-none" value="-1">---<spring:message code="education" />---</form:option>
                      <form:options items="${educations}" itemValue="id" itemLabel="education" />
                    </form:select>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <form:label path="activities">
                      <spring:message code="activityUser" />
                    </form:label>
                    <form:select id="activities-user" path="activities" multiple="true" cssClass="form-control">
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
                  <!-- 									<div class="col-md-2"> -->
                  <!-- 										<input id="tos" type="checkbox" required="required"> -->
                  <!-- 									</div> -->
                  <!-- 									<div class="text-left col-md-6"> -->
                  <!-- 										<span> Съгласен съм с </span> <a href="#">общите условия</a> -->
                  <!-- 									</div> -->
                  <div class="text-center col-md-12">
                    <button id="register-individual-submit" class="btn btn-success btn-lg" type="submit">
                      <spring:message code="registerBtn" />
                    </button>
                  </div>
                </div>
              </fieldset>
            </form:form>
          </div>
        </div>
        <div class="row">
          <div class="register-company-inputs hide">
            <form:errors path="user.*" />
            <form:form id="register-organization-form" modelAttribute="user" method="post"
              action="${pageContext.request.contextPath}/users/register/organization">
              <fieldset>
                <legend>
                  <spring:message code="registration" />
                </legend>
                <div class="row">
                  <div class="form-group col-md-6">
                    <spring:message code="organizationName" var="organizationNamePlaceholder" />
                    <form:input id="username" path="username" placeholder="${organizationNamePlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(45)" cssClass="form-control" />
                  </div>
                  <div class="form-group col-md-6">
                    <spring:message code="email" var="emailPlaceholder" />
                    <form:input id="email" path="email" type="email" placeholder="${emailPlaceholder}"
                      data-validate="required,email,min(4),max(30)" cssClass="form-control" />
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <spring:message code="password" var="passwordPlaceholder" />
                    <form:password id="password" path="password" placeholder="${passwordPlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(30)" cssClass="form-control" />
                  </div>
                  <div class="form-group col-md-6">
                    <spring:message code="repeatPassword" var="repeatPasswordPlaceholder" />
                    <form:password id="pasword-confirm" path="confirmedPassword" placeholder="${repeatPasswordPlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(30)" cssClass="form-control" />
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12">
                    <form:select id="organization-types" path="organization.organizationsType.id" cssClass="form-control"
                      required="required">
                      <form:option id="organization-type" value="-1">---<spring:message code="organizationType" />---</form:option>
                      <form:options items="${organizationTypes}" itemValue="id" itemLabel="type" />
                    </form:select>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12">
                    <form:label path="activities">
                      <spring:message code="activity" />
                    </form:label>
                    <form:select id="activities-company" path="activities" cssClass="form-control" required="required">
                      <form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
                    </form:select>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-6">
                    <form:select id="countries-organization" path="userInfo.country.id" cssClass="form-control"
                      required="required">
                      <form:option id="country-none" value="-1">---<spring:message code="country" />---</form:option>
                      <form:options items="${countries}" itemValue="id" itemLabel="country" />
                    </form:select>
                  </div>
                  <div class="form-group col-md-6">
                    <form:select id="cities-organization" path="userInfo.city.id" cssClass="form-control" required="required">
                      <form:option id="city-none" value="-1">---<spring:message code="choiceCountryLbl" />---</form:option>
                      <%-- 											<form:options items="${cities}" itemValue="id" itemLabel="city" /> --%>
                    </form:select>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12">
                    <spring:message code="address" var="addressPlaceholder" />
                    <form:input id="address" path="organization.address" placeholder="${addressPlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(45)" cssClass="form-control" />
                  </div>
                </div>
                <div class="row">
                  <div class="form-group col-md-12">
                    <label class="control-label" for="description"></label>
                    <spring:message code="description" var="descriptionPlaceholder" />
                    <form:textarea id="description" path="userInfo.description" placeholder="${descriptionPlaceholder }" rows="5"
                      cols="78" cssClass="form-control" />
                  </div>
                </div>
                <div class="row">
                  <!-- 									<div class="text-left col-md-6"> -->
                  <!-- 										<input id="tos" type="checkbox"> <label for="tos"> I've read the <a href="#">Terms and -->
                  <!-- 												Condition</a></label> -->
                  <!-- 									</div> -->
                  <div class="text-center col-md-12">
                    <button id="register-organization-submit" class="btn btn-success btn-lg" type="submit">
                      <spring:message code="registerBtn" />
                    </button>
                  </div>
                </div>
              </fieldset>
            </form:form>
          </div>
        </div>
      </div>
      <jsp:include page="../ads.jsp" />
    </div>
    <!-- End main content -->
    <jsp:include page="../layout/footer.jsp" />
  </div>
  <!-- End container -->
  <script>
			$(document).ready(function dateChange() {
				var date = $('#birthdate').val();
				$('#birthdate').val('date');
			});

			$('#activities-user').chosen();
			$('#activities-company').chosen();
			$('#languages').chosen();
			makeAjaxCall('country', 'getCitiesByCountry', 'change', "city",
					"city");
			makeAjaxCall('countryies-organization', 'getCitiesByCountry',
					'change', "cities-organization", "city");
		</script>
</body>
</html>
