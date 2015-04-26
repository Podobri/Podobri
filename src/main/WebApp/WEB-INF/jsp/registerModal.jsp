<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="/resources/images/" />
<div class="modal fade" id="register" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-wide60">
    <div class="modal-content">
      <div class="register col-md-12 ">
        <div class="panel-default">
          <div class="panel-body">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
            <div id="register-titles">
              <fieldset>
                <div class="register-user col-md-6 active">
                  <a href="#user"> <span class="register-image"> <img alt="" src="${imgURL}register_user.png" />
                  </span> <span class="register-text"><spring:message code="userRegistration" /></span></a>
                </div>
                <div class="register-company col-md-6 inactive">
                  <a href="#company"> <span class="register-image"> <img alt="" src="${imgURL}register_company.png" />
                  </span> <span class="register-text"><spring:message code="organizationRegistration" /></span></a>
                </div>
              </fieldset>
            </div>
          </div>
          <div class="register-user-inputs">
            <form:errors path="user.*" />
            <form id="register-individual-form" method="post"
              action="${pageContext.request.contextPath}/users/register/individual/">
              <fieldset>
                <!-- Form Name -->
                <legend>
                  <spring:message code="registration" />
                </legend>
                <div class="register-user-inputs-first">
                  <!-- Text input-->
                  <div class="form-group col-md-6">
                    <spring:message code="username" var="usernamePlaceholder" />
                    <input id="username" name="username" placeholder="${usernamePlaceholder }"
                      data-validate="required,alphaNumeric,min(6),max(70)" class="form-control" />
                  </div>
                  <!-- Text input-->
                  <div class="form-group col-md-6">
                    <spring:message code="email" var="emailPlaceholder" />
                    <input id="email" name="email" type="email" placeholder="${emailPlaceholder }"
                      data-validate="required,email,min(6),max(70)" class="form-control" />
                  </div>
                  <!-- Password input -->
                  <div class="form-group col-md-6">
                    <spring:message code="password" var="passwordPlaceholder" />
                    <input type="password" id="password" name="password" placeholder="${passwordPlaceholder }"
                      data-validate="required,alphaNumeric,min(6),max(40)" class="form-control" />
                  </div>
                  <!-- Password input -->
                  <div class="form-group col-md-6">
                    <spring:message code="repeatPassword" var="repeatPasswordPlaceholder" />
                    <input type="password" id="paswordConfirm" name="confirmedPassword"
                      placeholder="${repeatPasswordPlaceholder }" data-validate="required,alphaNumeric,min(6),max(40)"
                      class="form-control" />
                  </div>
                </div>
                <div class="register-user-inputs-second hide">
                  <div class="form-group col-md-6">
                    <select id="activities-user" name="activities" multiple class="form-control">
                      <c:forEach items="${activitiesList}" var="item">
                        <option value="${item.id}">${item.type}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group col-md-6">
                    <select id="educations" name="individual.education.id" class="form-control">
                      <option id="education-none" value="-1">---
                        <spring:message code="education" />---
                      </option>
                      <c:forEach items="${educations}" var="item">
                        <option value="${item.id}">${item.education}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="text-center col-md-12">
                  <button id="register-individual" class="btn btn-success btn-lg" type="submit">
                    <spring:message code="registerBtn" />
                  </button>
                </div>
              </fieldset>
            </form>
          </div>
          
          <div class="register-company-inputs hide">
            <form:errors path="user.*" />
            <form id="register-organization-form" method="post"
              action="${pageContext.request.contextPath}/users/register/organization">
              <fieldset>
                <legend>
                  <spring:message code="registration" />
                </legend>
                <div class="register-company-inputs-first">
                  <div class="form-group col-md-6">
                    <spring:message code="organizationName" var="organizationNamePlaceholder" />
                    <input id="username" name="username" placeholder="${organizationNamePlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(45)" class="form-control" />
                  </div>
                  <div class="form-group col-md-6">
                    <spring:message code="email" var="emailPlaceholder" />
                    <input id="email" name="email" type="email" placeholder="${emailPlaceholder}"
                      data-validate="required,email,min(4),max(30)" class="form-control" />
                  </div>
                  <div class="form-group col-md-6">
                    <spring:message code="password" var="passwordPlaceholder" />
                    <input type="password" id="password" name="password" placeholder="${passwordPlaceholder }"
                      data-validate="required,alphaNumeric,min(4),max(30)" class="form-control" />
                  </div>
                  <div class="form-group col-md-6">
                    <spring:message code="repeatPassword" var="repeatPasswordPlaceholder" />
                    <input type="password" id="pasword-confirm" name="confirmedPassword"
                      placeholder="${repeatPasswordPlaceholder }" data-validate="required,alphaNumeric,min(4),max(30)"
                      class="form-control" />
                  </div>
                </div>
                <div class="register-company-inputs-second hide">
                  <div class="form-group col-md-12">
                    <select id="organization-types" name="organization.organizationsType.id" class="form-control"
                      required="required">
                      <option id="organization-type" value="-1">---
                        <spring:message code="organizationType" />---
                      </option>
                      <c:forEach items="${organizationTypes}" var="item">
                        <option value="${item.id}">${item.type}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group col-md-12">
                    <select id="activities-company" name="activities" multiple class="form-control" required="required">
                      <c:forEach items="${activitiesList}" var="item">
                        <option value="${item.id}">${item.type}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group col-md-6">
                    <select id="countries-organization" name="userInfo.country.id" class="form-control" required="required">
                      <option id="country-none" value="-1">---
                        <spring:message code="country" />---
                      </option>
                      <c:forEach items="${countries}" var="item">
                        <option value="${item.id}">${item.country}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group col-md-6">
                    <select id="cities-organization" name="userInfo.city.id" class="form-control" required="required">
                      <option id="city-none" value="-1">---
                        <spring:message code="choiceCountryLbl" />---
                      </option>
                      <c:forEach items="${cities}" var="item">
                        <option value="${item.id}">${item.city}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="text-center col-md-12">
                  <button id="register-company" class="btn btn-success btn-lg" type="submit">
                    <spring:message code="registerBtn" />
                  </button>
                </div>
              </fieldset>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
	$('#activities-user').chosen();
	$('#activities-company').chosen();
	makeAjaxCall('country', 'getCitiesByCountry', 'change', "city", "city");
	makeAjaxCall('countries-organization', 'getCitiesByCountry', 'change',
			"cities-organization", "city");

	$('#register-individual').on('click', function() {
		var ri = $('.register-user-inputs-first');
		var ri2 = $('.register-user-inputs-second');
		if (ri2.hasClass('hide')) {
			ri.addClass('hide');
			ri2.removeClass('hide');
			return false;
		}
	});

	$('#register-company').on('click', function() {
		var ri = $('.register-company-inputs-first');
		var ri2 = $('.register-company-inputs-second');
		if (ri2.hasClass('hide')) {
			ri.addClass('hide');
			ri2.removeClass('hide');
			return false;
		}
	});
</script>