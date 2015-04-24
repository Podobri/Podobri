<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="images" value="/images/" />
<c:url var="thumb128" value="/images/thumbnail128x128/" />
<c:url var="thumb450" value="/images/thumbnail400x25/" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
  <div class="container">
    <jsp:include page="../layout/menu.jsp" />
    <div id="content">
      <div id="event-view-full" class="col-md-10">
        <div class="row">
          <c:if test="${not empty event.event.picture}">
            <c:set value="background-image: url(${images}${event.event.picture })" var="picture" />
          </c:if>
          <div id="event-view-full-picture" style="${not empty picture ? picture : '' }">
            <div class="col-md-12">
              <div id="event-full-view-date" class="col-md-2">
                <div id="event-full-view-date-no">
                  <h1>
                    <span>${event.dateFromDayOfMonth }</span>
                  </h1>
                </div>
                <div id="event-full-view-date-month">
                  <h4>
                    <span>${event.dateFromMonth }</span>
                  </h4>
                </div>
              </div>
              <div id="event-time" class="col-md-12">
                <h5>
                  <span class="glyphicon glyphicon-time"></span><span>${event.dateFromTime }</span>
                </h5>
              </div>
              <div id="event-apply" class="col-md-12">
                <a href="${pageContext.request.contextPath}/events/apply/${event.event.id}">
                  <button type="button" class="btn btn-primary btn-lg">
                    <div class="col-md-6">
                      <span id="event-apply-ok" class="glyphicon glyphicon-ok-sign"></span>
                      <spring:message code="eventApplyBtn" />
                    </div>
                  </button>
                </a>
              </div>
              <div id="event-name-info" class="col-md-12">
                <h4>
                  <span>${event.event.title }</span>
                </h4>
                <h5>
                  <span>${event.opportunity } </span> | <span>${event.country },${event.city },${event.event.address }</span>
                </h5>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div id="event-view-full-menu" class="menu-tabs">
            <ul class="nav nav-tabs">
              <li class="active"><a data-toggle="tab" href="#event-information"><spring:message code="eventMenuAbout" /></a></li>
              <li><a data-toggle="tab" href="#event-program"><spring:message code="eventMenuProgram" /></a></li>
              <li><a data-toggle="tab" href="#event-lectors"><spring:message code="eventMenuLectors" /></a></li>
              <li><a data-toggle="tab" href="#event-sponsors"><spring:message code="eventMenuSponsors" /></a></li>
            </ul>
          </div>
        </div>
        <c:if test="${not empty applyResult}">
          <div class="alert alert-danger">${applyResult}</div>
        </c:if>
        <div class="row">
          <div id="event-view-full-menu-content" class="tab-content">
            <div id="event-information" class="tab-pane fade in active">
              <p>
                <label><spring:message code="category" />:</label><span> ${event.category }</span> <br /> <label><spring:message
                    code="activity" />:</label>
                <c:forEach varStatus="status" var="eventActivity" items="${event.event.activities}">
                  <span> ${eventActivity.type } <c:if test="${!status.last}">,</c:if>
                  </span>
                </c:forEach>
              </p>
              <p>
                <label><spring:message code="eventStart" />:</label><span> ${event.event.dateFrom }</span> <br /> <label><spring:message
                    code="eventEnd" />:</label><span> ${event.event.dateTo }</span> <br /> <label><spring:message
                    code="eventDeadline" />:</label><span> ${event.event.deadline }</span>
              </p>
              <p>
                <label><spring:message code="eventExpenses" />:</label><span> ${event.costType }</span> <br /> <label><spring:message
                    code="eventOrganizer" />:</label><span> <u>${event.organizator } </u>
                </span>
              </p>
              <p>
                <label><spring:message code="description" />:</label><span> ${event.event.description }</span>
              </p>
              <p>
                <label><spring:message code="eventAdditionalInfo" />:</label><span> ${event.event.additionalInfo } </span> <br />
                <label><spring:message code="eventParticipants" />:</label><span> ${event.eventParticipantsSize } </span> <br />
                <label><spring:message code="website" />:</label><span> <a href="${event.event.website}">${event.event.website }</a>
                </span> <br /> <label><spring:message code="facebook" />:</label><span> <a href="${event.event.facebook}">${event.event.facebook }</a></span>
                <br /> <label><spring:message code="eventGainingOrganizers" /> </label><span>
                  ${event.event.recruitCoorganizators ? '<spring:message code="yes" />' : '<spring:message code="no" />'  }</span> <br />
                <label><spring:message code="requireApplicationForm" /> </label><span>${event.event.applicationFormRequire ? '<spring:message code="yes" />' : '<spring:message code="no" />' }
                </span>
              </p>
            </div>
            <div id="event-program" class="tab-pane fade">
              <div id="event-program-content">
                <table class="table table-bordered table-striped">
                  <thead>
                    <tr>
                      <th><spring:message code="subject" /></th>
                      <th><spring:message code="eventStart" /></th>
                      <th><spring:message code="eventEnd" /></th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${event.event.eventsPrograms}" var="eventProgram">
                      <tr>
                        <td>
                          <div class="po-markup">
                            <span>${eventProgram.subject} </span><span class="glyphicon glyphicon-info-sign po-link"></span>
                            <div class="po-content hidden">
                              <div class="po-title">
                                <span>${eventProgram.subject}</span>
                              </div>
                              <!-- ./po-title -->
                              <div class="po-body">
                                <p>${eventProgram.information}</p>
                              </div>
                              <!-- ./po-body -->
                            </div>
                            <!-- ./po-content -->
                          </div> <!-- ./po-markup -->
                        </td>
                        <td>${eventProgram.dateFrom}</td>
                        <td>${eventProgram.dateTo}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <div id="event-lectors" class="tab-pane fade">
              <c:forEach items="${event.event.lectors}" var="lector">
                <div id="${lector.id}" class="event-lector">
                  <div class="media">
                    <div class="media-left">
                      <a href="#"> <img class="media-object" src="${thumb128}${lector.picture}" alt="...">
                      </a>
                    </div>
                    <div class="media-body">
                      <h4 class="media-heading">${lector.firstName}${lector.lastName}</h4>
                      <h5>${lector.job}</h5>
                      <p>${lector.information}</p>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>
            <div id="event-sponsors" class="tab-pane fade">
              <c:forEach items="${event.event.sponsors}" var="sponsor">
                <div class="col-md-3">
                  <div class="col-md-12 text-center">
                    <img class="img-circle" alt="" src="${thumb128}${sponsor.picture}" />
                  </div>
                  <div class="col-md-12 text-center">
                    <h3>${sponsor.name}</h3>
                  </div>
                </div>
              </c:forEach>
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