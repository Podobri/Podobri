<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
      <div id="actual-events" class="col-md-10">
        <div class="row">
          <div id="actual-events-title">
            <h3>
              <strong><spring:message code="eventsActualTitle" /></strong>
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
                    <form:errors path="eventsFilter.*" />
                    <form:form id="filter-form" modelAttribute="eventsFilter" method="post"
                      action="${pageContext.request.contextPath}/events/search">
                      <fieldset>
                        <div class="row">
                          <div class="form-group col-md-4">
                            <form:label path="categoryId" cssClass="control-label">
                              <spring:message code="category" />
                            </form:label>
                            <form:select id="opportunity-category" path="categoryId" cssClass="form-control">
                              <form:option id="opportunity-category-none" value="-1">---<spring:message
                                  code="category" />---</form:option>
                              <form:options items="${categoriesList}" itemValue="id" itemLabel="category" />
                            </form:select>
                          </div>
                          <div class="form-group col-md-4">
                            <form:label path="opportunityId" cssClass="control-label">
                              <spring:message code="opportunity" />
                            </form:label>
                            <form:select id="opportunity" path="opportunityId" cssClass="form-control">
                              <form:option id="opportunity-none" value="-1">---<spring:message
                                  code="eventChoiceCategoryLbl" />---</form:option>
                            </form:select>
                          </div>
                          <div class="form-group col-md-4">
                            <form:label path="activities" cssClass="control-label">
                              <spring:message code="activity" />
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
                            <form:label path="costTypeId" cssClass="control-label">
                              <spring:message code="financing" />
                            </form:label>
                            <form:select id="event-cost-types" path="costTypeId" cssClass="form-control">
                              <form:options items="${costTypesList}" itemValue="id" itemLabel="cost" />
                            </form:select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="control-group col-md-4">
                            <div class="controls">
                              <form:label path="startDate" cssClass="control-label">
                                <spring:message code="startDate" />
                              </form:label>
                              <form:input id="start-date" path="startDate" type="text"
                                cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
                            </div>
                          </div>
                          <div class="form-group col-md-4">
                            <form:label path="deadline" cssClass="control-label">
                              <spring:message code="deadlineApplying" />
                            </form:label>
                            <form:input id="deadline" path="deadline" type="text"
                              cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
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
                <!-- END OF eventsFilterPanel -->
              </div>
            </div>
          </div>
          <!-- END OF FILTER -->
        </div>
        <c:if test="${not empty filteredEventsMessage }">
          <div class="row">
            <div id="filtered-message">${filteredEventsMessage}</div>
          </div>
        </c:if>
        <div class="row">
          <div class="btn-group col-md-3 col-md-offset-9">
            <a href="#" id="list" class="pull-right btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list"> </span> <spring:message
                code="listView" /></a> <a href="#" id="grid" class="pull-right btn btn-default btn-sm"><span class="glyphicon glyphicon-th"></span>
              <spring:message code="gridView" /></a>
          </div>
        </div>
        <div id="events" class="row list-group">
          <c:forEach var="event" items="${actualEvents}">
            <c:choose>
              <c:when test="${not empty event.event.picture}">
                <c:set value="${thumb450}${event.event.picture}" var="picture" />
                <c:set value="${images}${event.event.picture}" var="pictureFull" />
              </c:when>
              <c:otherwise>
                <c:set value="${imgURL}thumb450.gif" var="picture" />
                <c:set value="${imgURL}Overlay.png" var="pictureFull" />
              </c:otherwise>
            </c:choose>
            <div id="item-${event.event.id}" class="item col-md-4">
              <div class="thumbnail">
                <a data-toggle="modal" data-target="#item-modal-${event.event.id}" href=""><img class="group list-group-image"
                  src="${picture}" alt="" /></a>
                <div class="caption">
                  <a data-toggle="modal" data-target="#item-modal-${event.event.id}" href="">
                    <h4 class="group inner list-group-item-heading">${event.event.title}</h4>
                  </a>
                  <p class="group inner list-group-item-text">${event.event.description}</p>
                  <br />
                  <p>
                    <span class="item-info">${event.category}</span> | <span class="item-info">${event.opportunity}</span> <br />
                    <c:forEach varStatus="status" var="eventActivity" items="${event.event.activities}">
                      <span class="item-info"> ${eventActivity.type } <c:if test="${!status.last}">,</c:if>
                      </span>
                    </c:forEach>
                  </p>
                  <p>
                    <span class="item-info"> <img alt="" src="${imgURL}thumblines/location_24x24.png" /> ${event.city }
                    </span>
                  </p>
                  <p>
                    <span class="item-info"> <img alt="" src="${imgURL}thumblines/calendar_24x24.png" />
                      ${event.dateFromDayOfMonth } ${event.dateFromMonth }
                    </span>
                  </p>
                  <p>
                    <span class="item-info"> <img alt="" src="${imgURL}thumblines/time_24x24.png" /> ${event.dateFromTime }
                    </span>
                  </p>
                  <security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
                    <p>
                      <span class="item-info"> <img alt="" src="${imgURL}thumblines/views_24x24.png" />
                        ${event.eventParticipantsSize}
                      </span>
                    </p>
                  </security:authorize>
                  <p>
                    <span class="item-info"> <spring:message code="eventOrganizer" />: ${event.organizator}
                    </span>
                  </p>
                </div>
              </div>
            </div>
            <div class="modal fade col-md-12 item" id="item-modal-${event.event.id}" tabindex="-1" aria-labelledby="myModalLabel"
              aria-hidden="true">
              <div class="modal-dialog modal-wide70">
                <div class="modal-content col-md-10">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                    <h3>${event.event.title}</h3>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div id="event-view-picture-section">
                        <a href="#x" class="thumbnail"> <img alt="" src="${pictureFull}" />
                        </a>
                      </div>
                    </div>
                    <div class="row">
                      <div id="event-view-main-info">
                        <img alt="" src="${imgURL}thumblines/location_24x24.png" /> ${event.country }, ${event.city },
                        ${event.event.address } <img alt="" src="${imgURL}thumblines/calendar_24x24.png" />
                        ${event.dateFromDayOfMonth } ${event.dateFromMonth } <img alt="" src="${imgURL}thumblines/time_24x24.png" />
                        ${event.dateFromTime }
                        <security:authorize access="hasRole('ROLE_ADMINISTRATOR')">
                          <img alt="" src="${imgURL}thumblines/views_24x24.png" /> ${event.eventParticipantsSize}
												</security:authorize>
                      </div>
                    </div>
                    <div class="row">
                      <div id="event-view-short-description" class="col-md-7">${event.event.description}</div>
                      <div id="event-view-more-info" class="col-md-5">
                        <div id="event-view-organizator" class="col-md-12">
                          <h4>
                            <spring:message code="eventOrganizerUpper" />
                            :
                            <span class="item-info">${event.organizator}</span>
                          </h4>
                          
                        </div>
                        <!-- 												<div id="EventViewIntendedFor" class="col-md-12"> -->
                        <!-- 													<p> -->
                        <!-- 													<h4><spring:message code="eventIntendedFor" />:</h4> -->
                        <!-- 													<span class="item-infoLabel label label-info">спортисти</span> <span -->
                        <!-- 														class="item-infoLabel label label-info">uchenici</span> <span -->
                        <!-- 														class="item-infoLabel label label-info">atlelti</span> <span -->
                        <!-- 														class="item-infoLabel label label-info">deputati</span> <span -->
                        <!-- 														class="item-infoLabel label label-info">text</span> <span class="item-infoLabel label label-info">text</span> -->
                        <!-- 													<span class="item-infoLabel label label-info">text</span> -->
                        <!-- 												</div> -->
                        <div id="event-view-social" class="col-md-12 social-links">
                          <p>
                            <img alt="" src="${imgURL}thumblines/fb_32.png" /> <img alt=""
                              src="${imgURL}thumblines/twitter_32.png" /> <img alt="" src="${imgURL}thumblines/linkedin_32.png" />
                            <%-- 														<img alt="" src="${imgURL}thumblines/google_32.png" />  --%>
                            <%-- 														<img alt="" src="${imgURL}thumblines/skype_32.png" /> --%>
                          </p>
                        </div>
                        <security:authorize access="hasAnyRole('ROLE_INDIVIDUAL', 'ROLE_ORGANIZATION')">
                          <div id="event-view-full-description" class="col-md-12">
                            <p>
                              <a href="${pageContext.request.contextPath}/events/viewEvent/${event.event.id}">
                                <button type="button" class="btn btn-primary btn-lg btn-block">
                                  <spring:message code="eventFullDescriptionBtn" />
                                </button>
                              </a>
                              <security:authorize access="hasRole('ROLE_INDIVIDUAL')"> 
                              <a href="${pageContext.request.contextPath}/events/apply/${event.event.id}">
                                <button type="button" class="btn btn-warning btn-lg btn-block">
                                  <spring:message code="eventApplyBtn" />
                                </button>
                              </a>
                              </security:authorize>
                            </p>
                          </div>
                        </security:authorize>
                      </div>
                    </div>
                  </div>
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
			function toggleChevron(e) {
				$('#activities').next('div').css('width', "85%");
				$('#filter-chevron').toggleClass(
						'glyphicon-chevron-down glyphicon-chevron-up');
			}
			$('#accordion').on('hidden.bs.collapse', toggleChevron);
			$('#accordion').on('shown.bs.collapse', toggleChevron);
			$('#activities').chosen();

			$(document).ready(function() {
				$('#list').click(function(event) {
					$('#events .item').addClass('list-group-item');
				});
				$('#grid').click(function(event) {
					$('#events .item').removeClass('list-group-item');
					$('#events .item').addClass('grid-group-item');
				});
			});
		</script>
  <script>
			makeAjaxCall('country', 'getCitiesByCountry', 'change', "city",
					"city");
			makeAjaxCall('opportunity-category', 'getOpportunitiesByCategory',
					'change', "opportunity", "opportunity");
		</script>
</body>
</html>
