<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="imgURL" value="/resources/images/" />
<c:url var="images" value="/images/" />
<c:url var="thumb128" value="/images/thumbnail128x128/" />
<c:url var="thumb450" value="/images/thumbnail400x25/" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
  <div class="container">
    <jsp:include page="../layout/menu.jsp" />
    <div id="content">
      <div id="organizations-container" class="col-md-10">
        <div class="row">
          <div id="organizations-label">
            <h3>
              <strong><spring:message code="organizations" /></strong>
            </h3>
          </div>
        </div>
        <!-- FILTER -->
        <div class="row">
          <div id="filter">
            <div id="accordion" class="panel-group">
              <div class="panel panel-default">
                <a data-toggle="collapse" data-parent="#accordion" href="#filter-panel">
                  <button type="button" class="btn btn-primary btn-lg btn-block">
                    <div class="col-md-2">
                      <span id="filter-chevron" class="glyphicon glyphicon-chevron-down"></span>
                      <spring:message code="filter" />
                    </div>
                  </button>
                </a>
                <div id="filter-panel" class="panel-collapse collapse">
                  <!-- collapse -->
                  <div class="panel-body">
                    <form:errors path="organizationsFilter.*" />
                    <form:form id="filter-form" modelAttribute="organizationsFilter" method="post"
                      action="${pageContext.request.contextPath}/organizations/search">
                      <fieldset>
                        <div class="row">
                          <div class="form-group col-md-6">
                            <form:label path="organizationTypeId" cssClass="control-label">
                              <spring:message code="organizationType" />
                            </form:label>
                            <form:select id="organization-types" path="organizationTypeId" cssClass="form-control"
                              required="required">
                              <form:option id="organization-type" value="-1">---<spring:message
                                  code="organizationType" />---</form:option>
                              <form:options items="${organizationTypes}" itemValue="id" itemLabel="type" />
                            </form:select>
                          </div>
                          <div class="form-group col-md-6">
                            <form:label path="activities" cssClass="control-label">
                              <spring:message code="activityArea" />
                            </form:label>
                            <form:select id="activities" path="activities" multiple="true" cssClass="form-control">
                              <form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
                            </form:select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-md-4">
                            <form:label path="countryId" cssClass="control-label">
                              <spring:message code="country" />
                            </form:label>
                            <form:select id="country" path="countryId" cssClass="form-control">
                              <form:option id="country-none" value="-1">---<spring:message code="country" />---</form:option>
                              <form:options items="${countriesList}" itemValue="id" itemLabel="country" />
                            </form:select>
                          </div>
                          <div class="form-group col-md-4">
                            <form:label path="cityId" cssClass="control-label">
                              <spring:message code="city" />
                            </form:label>
                            <form:select id="city" path="cityId" cssClass="form-control">
                              <form:option id="city-none" value="-1">---<spring:message code="choiceCountryLbl" />---</form:option>
                            </form:select>
                          </div>
                          <div class="form-group col-md-4">
                            <button id="filter-events" class="btn btn-success btn-lg" type="submit">
                              <span class="glyphicon glyphicon-search"></span>
                              <spring:message code="filterSearchBtn" />
                            </button>
                          </div>
                        </div>
                      </fieldset>
                    </form:form>
                  </div>
                </div>
                <!-- END OF filter-panel -->
              </div>
            </div>
          </div>
          <!-- END OF FILTER -->
        </div>
        <c:if test="${not empty filteredOrganizationsMessage }">
          <div class="row">
            <div id="filtered-message">${filteredOrganizationsMessage}</div>
          </div>
        </c:if>
        <div class="row">
          <div class="btn-group col-md-3 col-md-offset-9">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list"> </span> <spring:message
                code="listView" /></a> <a href="#" id="grid" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th"></span>
              <spring:message code="gridView" /></a>
          </div>
        </div>
        <div id="organizations" class="row list-group">
          <c:forEach var="organization" items="${organizations}">
            <div id="organization-item-${organization.userId}" class="item col-md-4">
              <div class="thumbnail">
                <a href="${pageContext.request.contextPath}/organizations/viewOrganization/${organization.userId}"><img
                  class="group list-group-image" src="${imgURL}thumb450.gif" alt="" /></a>
                <div class="caption">
                  <a href="${pageContext.request.contextPath}/organizations/viewOrganization/${organization.userId}">
                    <h4 class="group inner list-group-item-heading">${organization.name}</h4>
                  </a>
                  <p class="group inner list-group-item-text">${organization.user.userInfo.description}</p>
                  <hr />
                  <p>
                    <span class="item-info"><spring:message code="currentEvents" />: 3</span> <br /> 
                    <span class="item-info"> <spring:message code="activityArea" />: </span>
                    <c:forEach varStatus="status" var="activity" items="${organization.user.activities}">
                      <span class="item-info"> ${activity.type } <c:if test="${!status.last}">,</c:if>
                      </span>
                    </c:forEach>
                    <br /> <span class="item-info"><spring:message code="location" />: ${organization.user.userInfo.city.city}</span>
                  </p>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
      <!-- END OF actualEvents -->
      <jsp:include page="../ads.jsp" />
    </div>
    <!-- End main content -->
    <jsp:include page="../layout/footer.jsp" />
  </div>
  <!-- End container -->
  <script>
	$(document).ready(function() {
			function toggleChevron(e) {
				$('#activities').next('div').css('width', "85%");
				$('#filter-chevron').toggleClass(
						'glyphicon-chevron-down glyphicon-chevron-up');
			}
			$('#accordion').on('hidden.bs.collapse', toggleChevron);
			$('#accordion').on('shown.bs.collapse', toggleChevron);
			$('#activities').chosen();


				$('#list').click(function(event) {
					$('#organizations .item').addClass('list-group-item');
				});
				$('#grid').click(function(event) {
					$('#organizations .item').removeClass('list-group-item');
					$('#organizations .item').addClass('grid-group-item');
				});
			});
		</script>
  <script>
			makeAjaxCall('country', 'getCitiesByCountry', 'change', "city",
					"city");
		</script>
</body>
</html>
