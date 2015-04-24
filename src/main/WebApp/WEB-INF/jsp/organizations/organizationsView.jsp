<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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
      <div id="organization-profile" class="col-md-10">
        <div class="row">
          <c:set value="background-image: url(${imgURL}Overlay.png)" var="picture" />
          <div id="organization-profile-picture-container" style="${not empty picture ? picture : '' }">
            <div class="col-md-12">
              <div id="organization-profile-logo" class="col-md-2">
                <img alt="" src="${imgURL}/thumb128.png">
              </div>
              <div id="members-follows" class="col-md-12">
                <div id="members" class="col-md-6">
                  <a href="${pageContext.request.contextPath}/events/apply">
                    <button type="button" class="btn btn-primary btn-lg">
                      <div class="col-md-6">
                        <span id="apply-as-member-ok" class="glyphicon glyphicon-ok-sign"></span> 1235
                      </div>
                    </button>
                  </a>
                </div>
                <div id="follow-us" class="col-md-6">
                  <a href="${pageContext.request.contextPath}/events/apply">
                    <button type="button" class="btn btn-primary btn-lg">
                      <div class="col-md-6">
                        <span id="apply-as-member-ok" class="glyphicon glyphicon-ok-sign"></span>
                        <spring:message code="follow" />
                      </div>
                    </button>
                  </a>
                </div>
              </div>
              <div id="apply-as-member" class="col-md-12">
                <hr />
                <a href="${pageContext.request.contextPath}/events/apply">
                  <button type="button" class="btn btn-primary btn-lg">
                    <div class="col-md-6">
                      <span id="apply-as-member-ok" class="glyphicon glyphicon-ok-sign"></span>
                      <spring:message code="beAMember" />
                    </div>
                  </button>
                </a>
                <hr />
              </div>
              <div id="organization-profile-info" class="col-md-12">
                <h4>
                  <span>${organization.name}</span>
                </h4>
                <h5>
                  <span> ${organization.user.userInfo.country.country}, ${organization.user.userInfo.city.city},
                    ${organization.address}</span>
                </h5>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div id="organization-profile-menu" class="menu-tabs">
            <ul class="nav nav-tabs">
              <li class="active"><a data-toggle="tab" href="#organization-information"><spring:message
                    code="eventMenuAbout" /></a></li>
              <li><a data-toggle="tab" href="#organization-current-events"><spring:message code="currentEvents" /></a></li>
              <li><a data-toggle="tab" href="#organization-past-events"><spring:message code="pastEvents" /></a></li>
              <li><a data-toggle="tab" href="#organization-contacts"><spring:message code="contacts" /></a></li>
            </ul>
          </div>
        </div>
        <c:if test="${not empty applyResult}">
          <div class="alert alert-danger">${applyResult}</div>
        </c:if>
        <div class="row">
          <div id="organization-profile-menu-content" class="tab-content">
            <div id="organization-information" class="tab-pane fade in active">
              <p>
                <label><spring:message code="activityArea" />:</label>
                <c:forEach varStatus="status" var="organizationActivity" items="${organization.user.activities}">
                  <span> ${organizationActivity.type } <c:if test="${!status.last}">,</c:if>
                  </span>
                </c:forEach>
                <br /> <label><spring:message code="organizationType" />: ${organization.organizationsType.type}</label>
              </p>
              <p>
                <label><spring:message code="website" />:</label><span> <a href="${organization.user.userInfo.website}">${organization.user.userInfo.website}</a>
                </span>
              </p>
              <p>
                <label><spring:message code="description" />:</label><span> ${organization.user.userInfo.description}</span>
              </p>
            </div>
            <div id="organization-current-events" class="tab-pane fade">
              <div id="organizations" class="row list-group">
                <c:forEach var="organization" items="${organizations}">
                  <div id="organization-item-${organization.userId}" class="item col-md-4">
                    <div class="thumbnail">
                      <a href="${pageContext.request.contextPath}/viewOrganization/${organization.userId}"><img
                        class="group list-group-image" src="${imgURL}thumb450.gif" alt="" /></a>
                      <div class="caption">
                        <a href="${pageContext.request.contextPath}/viewOrganization/${organization.userId}">
                          <h4 class="group inner list-group-item-heading">${organization.name}</h4>
                        </a>
                        <p class="group inner list-group-item-text">${organization.user.userInfo.description}</p>
                        <hr />
                        <p>
                          <span class="item-info"><spring:message code="currentEvents" />: 3</span> <br /> <span
                            class="item-info"> <spring:message code="activityArea" />:
                          </span>
                          <c:forEach varStatus="status" var="activity" items="${organization.user.activities}">
                            <span class="item-info"> ${activity.type } <c:if test="${!status.last}">,</c:if>
                            </span>
                          </c:forEach>
                          <br /> <span class="item-info"><spring:message code="location" />:
                            ${organization.user.userInfo.city.city}</span>
                        </p>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </div>
            <div id="organization-past-events" class="tab-pane fade">
              <div id="organizations" class="row list-group">
                <c:forEach var="organization" items="${organizations}">
                  <div id="organization-item-${organization.userId}" class="item col-md-4">
                    <div class="thumbnail">
                      <a href="${pageContext.request.contextPath}/organizations/view/${organization.userId}"><img
                        class="group list-group-image" src="${imgURL}thumb450.gif" alt="" /></a>
                      <div class="caption">
                        <a href="${pageContext.request.contextPath}/organizations/view/${organization.userId}">
                          <h4 class="group inner list-group-item-heading">${organization.name}</h4>
                        </a>
                        <p class="group inner list-group-item-text">${organization.user.userInfo.description}</p>
                        <hr />
                        <p>
                          <span class="item-info"><spring:message code="currentEvents" />: 3</span> <br /> <span
                            class="item-info"> <spring:message code="activityArea" />:
                          </span>
                          <c:forEach varStatus="status" var="activity" items="${organization.user.activities}">
                            <span class="item-info"> ${activity.type } <c:if test="${!status.last}">,</c:if>
                            </span>
                          </c:forEach>
                          <br /> <span class="item-info"><spring:message code="location" />:
                            ${organization.user.userInfo.city.city}</span>
                        </p>
                      </div>
                    </div>
                  </div>
                </c:forEach>
              </div>
            </div>
            <div id="organization-contacts" class="tab-pane fade">
              
            </div>
          </div>
        </div>
      </div>
      <!-- End eventViewFull -->
      <jsp:include page="../ads.jsp" />
    </div>
    <!-- End main content -->
    <jsp:include page="../layout/footer.jsp" />
  </div>
  <!-- End container -->
  <script>
			$(document).ready(function() {

				$('.po-markup > .po-link').popover({
					trigger : 'hover',
					html : true, // must have if HTML is contained in popover

					// get the title and conent
					title : function() {
						return $(this).parent().find('.po-title').html();
					},
					content : function() {
						return $(this).parent().find('.po-body').html();
					},

					container : 'body',
					placement : 'right'

				});
			});
		</script>
</body>
</html>