<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:url var="imgURL" value="resources/images/" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
  <div class="container">
    <jsp:include page="../layout/menu.jsp" />
    <div id="content">
      <div id="my-events">
        <div class="row">
          <div id="actual-events-label" class="col-md-10">
            <h3>
              <strong><spring:message code="myEventsTitle" /></strong>
            </h3>
            <hr />
            <div class="row">
              <div id="my-events-menu" class="menu-tabs col-md-5">
                <ul class="nav nav-tabs">
                  <li class="active"><a data-toggle="tab" href="#my-events-incoming"><spring:message
                        code="myEventsUpcoming" /></a></li>
                  <li><a data-toggle="tab" href="#my-events-past"><spring:message code="myEventsPast" /></a></li>
                  <li><a data-toggle="tab" href="#my-events-all"><spring:message code="myEventsAll" /></a></li>
                </ul>
              </div>
            </div>
            <div class="row">
              <div id="my-events-content" class="tab-content col-md-12">
                <div id="my-events-incoming" class="tab-pane fade in active">
                  <table class="my-events-table table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th><spring:message code="eventTitle" /></th>
                        <th><spring:message code="created" /></th>
                        <th><spring:message code="modified" /></th>
                        <th><spring:message code="eventParticipantsMax" /></th>
                        <th><spring:message code="country" /></th>
                        <th><spring:message code="city" /></th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="event" items="${events}">
                        <c:if
                          test="${event.event.id == 8 || event.event.id == 7 || event.event.id == 11 || event.event.id == 9 || event.event.id == 10}">
                          <tr>
                            <td>${event.event.title }</td>
                            <td>${event.event.created }</td>
                            <td>${event.event.modified }</td>
                            <td>${event.eventParticipantsSize }/${event.event.maxParticipants }</td>
                            <td>${event.country }</td>
                            <td>${event.city }</td>
                            <td>
                              <div class="col-md-6">
                                <a href="${pageContext.request.contextPath}/events/viewEvent/${event.event.id}">
                                  <button type="button" class="btn btn-info">
                                    <span class="glyphicon glyphicon-search"><spring:message code="viewBtn" /></span>
                                  </button>
                                </a>
                              </div>
                              <div class="btn-group actions col-md-6">
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                                  <span class="glyphicons glyphicons-cogwheel"><spring:message code="actionBtn" /></span>
                                </button>
                                <ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu">
                                  <li><a href="${pageContext.request.contextPath}/events/editEvent/${event.event.id}"><i
                                      class="fa fa-pencil"></i> <spring:message code="editBtn" /> </a></li>
                                  <li><a data-toggle="modal" data-target="#confirm-delete-${event.event.id}" href="#"> <i
                                      class="glyphicon glyphicon-remove"></i> <spring:message code="deleteBtn" />
                                  </a></li>
                                  <li><a data-toggle="modal" data-target="#event-participant-modal-${event.event.id}" href=""><i
                                      class="fa fa-home"></i> <spring:message code="eventParticipantsBtn" /> </a></li>
                                  <li><a data-toggle="modal" data-target="#send-mail-form-${event.event.id}" href=""><i
                                      class="fa fa-envelope-o"></i> <spring:message code="eventSendMailParticipantsBtn" /></a></li>
                                  <li><a target="_blank"
                                    href="${pageContext.request.contextPath}/events/generatePDF/${event.event.id}"><i
                                      class="fa fa-file-pdf-o"></i> <spring:message code="eventGeneratePDF" /></a></li>
                                  <li><a href="${pageContext.request.contextPath}/events/generateExcel/${event.event.id}"><i
                                      class="fa fa-file-excel-o"></i> <spring:message code="eventGenerateExcel" /></a></li>
                                </ul>
                              </div>
                            </td>
                          </tr>
                        </c:if>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                <div id="my-events-past" class="tab-pane fade">
                  <table class="my-events-table table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th><spring:message code="eventTitle" /></th>
                        <th><spring:message code="created" /></th>
                        <th><spring:message code="modified" /></th>
                        <th><spring:message code="eventParticipantsMax" /></th>
                        <th><spring:message code="country" /></th>
                        <th><spring:message code="city" /></th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="event" items="${events}">
                        <c:if test="${event.event.id == 1 || event.event.id == 6 || event.event.id == 9 }">
                          <tr>
                            <td>${event.event.title }</td>
                            <td>${event.event.created }</td>
                            <td>${event.event.modified }</td>
                            <td>${event.eventParticipantsSize }/${event.event.maxParticipants }</td>
                            <td>${event.country }</td>
                            <td>${event.city }</td>
                            <td>
                              <div class="col-md-6">
                                <a href="${pageContext.request.contextPath}/events/viewEvent/${event.event.id}">
                                  <button type="button" class="btn btn-info">
                                    <span class="glyphicon glyphicon-search"><spring:message code="viewBtn" /></span>
                                  </button>
                                </a>
                              </div>
                              <div class="btn-group actions col-md-6">
                                <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                                  <span class="glyphicons glyphicons-cogwheel"><spring:message code="actionBtn" /></span>
                                </button>
                                <ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu">
                                  <li><a href="${pageContext.request.contextPath}/events/editEvent/${event.event.id}"><i
                                      class="fa fa-pencil"></i> <spring:message code="editBtn" /> </a></li>
                                  <li><a data-toggle="modal" data-target="#confirm-delete-${event.event.id}" href="#"> <i
                                      class="glyphicon glyphicon-remove"></i> <spring:message code="deleteBtn" />
                                  </a></li>
                                  <li><a data-toggle="modal" data-target="#event-participant-modal-${event.event.id}" href=""><i
                                      class="fa fa-home"></i> <spring:message code="eventParticipantsBtn" /> </a></li>
                                  <li><a data-toggle="modal" data-target="#send-mail-form-${event.event.id}" href=""><i
                                      class="fa fa-envelope-o"></i> <spring:message code="eventSendMailParticipantsBtn" /></a></li>
                                  <li><a target="_blank"
                                    href="${pageContext.request.contextPath}/events/generatePDF/${event.event.id}"><i
                                      class="fa fa-file-pdf-o"></i> <spring:message code="eventGeneratePDF" /></a></li>
                                  <li><a href="${pageContext.request.contextPath}/events/generateExcel/${event.event.id}"><i
                                      class="fa fa-file-excel-o"></i> <spring:message code="eventGenerateExcel" /></a></li>
                                </ul>
                              </div>
                            </td>
                          </tr>
                        </c:if>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
                <div id="my-events-all" class="tab-pane fade">
                  <table class="my-events-table table table-striped table-bordered">
                    <thead>
                      <tr>
                        <th><spring:message code="eventTitle" /></th>
                        <th><spring:message code="created" /></th>
                        <th><spring:message code="modified" /></th>
                        <th><spring:message code="eventParticipantsMax" /></th>
                        <th><spring:message code="country" /></th>
                        <th><spring:message code="city" /></th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach var="event" items="${events}">
                        <tr>
                          <td>${event.event.title }</td>
                          <td>${event.event.created }</td>
                          <td>${event.event.modified }</td>
                          <td>${event.eventParticipantsSize }/${event.event.maxParticipants }</td>
                          <td>${event.country }</td>
                          <td>${event.city }</td>
                          <td>
                            <div class="col-md-6">
                              <a href="${pageContext.request.contextPath}/events/viewEvent/${event.event.id}">
                                <button type="button" class="btn btn-info">
                                  <span class="glyphicon glyphicon-search"><spring:message code="viewBtn" /></span>
                                </button>
                              </a>
                            </div>
                            <div class="btn-group actions col-md-6">
                              <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicons glyphicons-cogwheel"><spring:message code="actionBtn" /></span>
                              </button>
                              <ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu">
                                <li><a href="${pageContext.request.contextPath}/events/editEvent/${event.event.id}"><i
                                    class="fa fa-pencil"></i> <spring:message code="editBtn" /> </a></li>
                                <li><a data-toggle="modal" data-target="#confirm-delete-${event.event.id}" href="#"> <i
                                    class="glyphicon glyphicon-remove"></i> <spring:message code="deleteBtn" />
                                </a></li>
                                <li><a data-toggle="modal" data-target="#event-participant-modal-${event.event.id}" href=""><i
                                    class="fa fa-home"></i> <spring:message code="eventParticipantsBtn" /> </a></li>
                                <li><a data-toggle="modal" data-target="#send-mail-form-${event.event.id}" href=""><i
                                    class="fa fa-envelope-o"></i> <spring:message code="eventSendMailParticipantsBtn" /></a></li>
                                <li><a target="_blank"
                                  href="${pageContext.request.contextPath}/events/generatePDF/${event.event.id}"><i
                                    class="fa fa-file-pdf-o"></i> <spring:message code="eventGeneratePDF" /></a></li>
                                <li><a href="${pageContext.request.contextPath}/events/generateExcel/${event.event.id}"><i
                                    class="fa fa-file-excel-o"></i> <spring:message code="eventGenerateExcel" /></a></li>
                              </ul>
                            </div>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            <c:forEach var="event" items="${events}" varStatus="eventStatus">
              <!-- PARTICIPANTS MODAL -->
              <div class="modal fade col-md-12" id="event-participant-modal-${event.event.id}" tabindex="-1"
                aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-wide100">
                  <div class="modal-content col-md-10">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
                      <h3>${event.event.title}</h3>
                    </div>
                    <form action="${pageContext.request.contextPath}/events/updateParticipants" method="POST">
                      <div class="modal-body col-md-12">
                        <table id="event-participant-table-${event.event.id}"
                          class="event-participant-table table table-striped table-bordered">
                          <thead>
                            <tr>
                              <th><spring:message code="name" /></th>
                              <th><spring:message code="lastname" /></th>
                              <th><spring:message code="gender" /></th>
                              <th></th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="participant" items="${event.event.eventsParticipants}" varStatus="participantStatus">
                              <tr>
                                <td>${participant.individual.firstName }</td>
                                <td>${participant.individual.lastName }</td>
                                <td><spring:message code="male" var="male" /> <spring:message code="famele" var="famele" />
                                  ${participant.individual.isMale ? male : famele }</td>
                                <td>
                                  <div class="col-md-12">
                                    <div class="col-md-2">
                                      <a target="_blank"
                                        href="${pageContext.request.contextPath}/users/viewUser/${participant.individual.userId}">
                                        <button type="button" class="btn btn-info">
                                          <span class="glyphicon glyphicon-search"><spring:message code="viewBtn" /></span>
                                        </button>
                                      </a>
                                    </div>
                                    <div class="col-md-2">
                                      <a data-toggle="modal" data-target="#application-form-${participantStatus.index}" href="">
                                        <button type="button" class="btn btn-info">
                                          <span class="fa fa-eye"><spring:message code="eventViewForm" /></span>
                                        </button>
                                      </a>
                                    </div>
                                    <div class="col-md-3">
                                      <a data-toggle="modal" data-target="#send-mail-form-to-${participant.userId}" href="">
                                        <button type="button" class="btn btn-info">
                                          <span class="fa fa-envelope-o"><spring:message code="eventSendMailSendBtn" /></span>
                                        </button>
                                      </a>
                                    </div>
                                    <div class="btn-group col-md-5" data-toggle="buttons">
                                      <input type="hidden" name="participantsList[${participantStatus.index}].eventId"
                                        value="${participant.eventId}" /> <input type="hidden"
                                        name="participantsList[${participantStatus.index}].userId" value="${participant.userId}" />
                                      <input type="hidden" name="participantsList[${participantStatus.index}].status"
                                        value="${participant.status}" class="status" /> <label
                                        class="btn btn-success ${participant.status == 1 ? 'active' : ''}"> <input
                                        type="radio" name="event.event.eventsParticipants[${participantStatus.index}].status"
                                        value="${participant.status}" onchange="switchStatus(this,1)"> <spring:message
                                          code="eventParticipantApprove" /> <span class="glyphicon glyphicon-ok"></span>
                                      </label> <label class="btn btn-danger ${participant.status == 2 ? 'active' : ''}"> <input
                                        type="radio" name="event.event.eventsParticipants[${participantStatus.index}].status"
                                        value="${participant.status}" onchange="switchStatus(this,2)"> <spring:message
                                          code="eventParticipantReject" /> <span class="glyphicon glyphicon-ok"></span>
                                      </label>
                                    </div>
                                  </div>
                                </td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn btn-primary save">
                          <spring:message code="saveBtn" />
                        </button>
                        <button type="button" data-dismiss="modal" class="btn btn-default">
                          <spring:message code="closeBtn" />
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="modal fade" id="confirm-delete-${event.event.id}" tabindex="-1" role="dialog"
                aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                      <h4 class="modal-title" id="my-modal-label">
                        <spring:message code="confirmDeleteTitle" />
                      </h4>
                    </div>
                    <div class="modal-body">
                      <p>
                        <spring:message code="confirmDeleteSubTitle" arguments="${event.event.title}" htmlEscape="false" />
                      </p>
                      <p>
                        <spring:message code="confirmDeleteConfirm" />
                      </p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">
                        <spring:message code="cancelBtn" />
                      </button>
                      <a href="${pageContext.request.contextPath}/events/deleteEvent/${event.event.id}"
                        class="btn btn-danger danger"><spring:message code="deleteBtn" /></a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Email FORM -->
              <div class="modal fade col-md-12" id="send-mail-form-${event.event.id}" tabindex="-1" aria-labelledby="myModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-wide60">
                  <form:form modelAttribute="mailTemplate"
                    action="${pageContext.request.contextPath}/events/myEvents/sendMailToParticipants/${event.event.id}"
                    method="POST">
                    <div class="modal-content col-md-10">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3>
                          <spring:message code="eventSendMailParticipantsTitle" arguments="${event.event.title}"
                            htmlEscape="false" />
                        </h3>
                      </div>
                      <div class="modal-body col-md-12">
                        <input type="hidden" name="eventId" value="${event.event.id}" />
                        <div class="col-md-12">
                          <form:label path="subject">
                            <spring:message code="subject" />:</form:label>
                        </div>
                        <div class="col-md-12">
                          <form:input path="subject" required="required" />
                        </div>
                        <div class="col-md-12">
                          <form:label path="content">
                            <spring:message code="eventSendMailMessage" />:</form:label>
                          <form:textarea path="content" rows="5" required="required" />
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn btn-default">
                          <i class="fa fa-envelope-o"></i>
                          <spring:message code="eventSendMailSendBtn" />
                        </button>
                        <button type="button" data-dismiss="modal" class="btn btn-default">
                          <spring:message code="closeBtn" />
                        </button>
                      </div>
                    </div>
                  </form:form>
                </div>
              </div>
            </c:forEach>
            <c:forEach var="event" items="${events}">
              <c:forEach var="participant" items="${event.event.eventsParticipants}" varStatus="status">
                <!-- APPLICATION FORM -->
                <div class="modal fade col-md-12" id="application-form-${status.index}" tabindex="-1"
                  aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-wide60">
                    <div class="modal-content col-md-10">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h3>
                          <spring:message code="eventParticipantFormTitle"
                            arguments="${participant.individual.firstName }, ${participant.individual.lastName }"
                            htmlEscape="false" />
                        </h3>
                      </div>
                      <div class="modal-body col-md-12">${participant.appForm}</div>
                      <div class="modal-footer">
                        <button type="button" data-dismiss="modal" class="btn btn-default">
                          <spring:message code="closeBtn" />
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Email FORM -->
                <div class="modal fade col-md-12" id="send-mail-form-to-${participant.userId}" tabindex="-1"
                  aria-labelledby="myModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-wide60">
                    <form:form modelAttribute="mailTemplate"
                      action="${pageContext.request.contextPath}/events/myEvents/sendMailToParticipants/${event.event.id}/${participant.userId}"
                      method="POST">
                      <div class="modal-content col-md-10">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                          <h3>
                            <spring:message code="eventSendMalParticipantTitle"
                              arguments="${participant.individual.firstName }, ${participant.individual.lastName }"
                              htmlEscape="false" />
                          </h3>
                        </div>
                        <div class="modal-body col-md-12">
                          <div class="col-md-12">
                            <form:label path="subject">
                              <spring:message code="subject" />:</form:label>
                          </div>
                          <div class="col-md-12">
                            <form:input path="subject" required="required" />
                          </div>
                          <div class="col-md-12">
                            <form:label path="content">
                              <spring:message code="eventSendMailMessage" />:</form:label>
                            <form:textarea path="content" rows="5" required="required" />
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="submit" class="btn btn-default">
                            <i class="fa fa-envelope-o"></i>
                            <spring:message code="eventSendMailSendBtn" />
                          </button>
                          <button type="button" data-dismiss="modal" class="btn btn-default">
                            <spring:message code="closeBtn" />
                          </button>
                        </div>
                      </div>
                    </form:form>
                  </div>
                </div>
              </c:forEach>
            </c:forEach>
          </div>
          <jsp:include page="../ads.jsp" />
        </div>
      </div>
    </div>
    <!-- End main content -->
    <jsp:include page="../layout/footer.jsp" />
  </div>
  <!-- End container -->
  <script>
			function switchStatus(e, status) {
				$(e).parents('td').find('.status').val(status);
			}
			$(document).ready(

					$('input[type=radio]').on('change', function() {
						var optionId = $(this).val();
						console.log(optionId);
					}),

					function() {
						$('.my-events-table').DataTable(
								{
									"aoColumnDefs" : [ {
										'bSortable' : false,
										'aTargets' : [ -1 ]
									} ],
									"aLengthMenu" : [ [ 5, 10, 25, 50, -1 ],
											[ 5, 10, 25, 50, "All" ] ]
								});

						$('.event-participant-table').DataTable(
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