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
			<div id="myEvents">
				<div class="row">
					<div id="actual-events-label" class="col-md-10">
						<h3>
							<strong>Моите събития</strong>
						</h3>
						<hr />
						<div class="row">
							<div id="myEvents" class="menuTabs col-md-5">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#myEventsIncoming">Предстоящи</a></li>
									<li><a data-toggle="tab" href="#myEventsPast">Изминали</a></li>
									<li><a data-toggle="tab" href="#myEventsAll">Всички</a></li>
								</ul>
							</div>
						</div>

						<div class="row">
							<div id="myEventsContent" class="tab-content col-md-12">
								<div id="myEventsIncoming" class="tab-pane fade in active">
									<table class="myEventsTable table table-striped table-bordered">
										<thead>
											<tr>
												<th>Title</th>
												<th>Created</th>
												<th>Modified</th>
												<th>Participants/Max</th>
												<th>Country</th>
												<th>City</th>
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
																		<span class="glyphicon glyphicon-search">Преглед</span>
																	</button>
																</a>
															</div>
															<div class="btn-group actions col-md-6">
																<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
																	<span class="glyphicons glyphicons-cogwheel">Действие</span>
																</button>
																<ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu">
																	<li><a href="${pageContext.request.contextPath}/events/editEvent/${event.event.id}"><i
																			class="fa fa-pencil"></i> Редакция </a></li>
																	<li><a data-toggle="modal" data-target="#confirmDelete${event.event.id}" href="#"> <i
																			class="glyphicon glyphicon-remove"></i> Изтриване
																	</a></li>
																	<li><a data-toggle="modal" data-target="#eventParticipantModal${event.event.id}" href=""><i
																			class="fa fa-home"></i> Участници </a></li>
																	<li><a data-toggle="modal" data-target="#sendMailForm${event.event.id}" href=""><i
																			class="fa fa-envelope-o"></i> Изпращане на мейл до участниците</a></li>
																	<li><a target="_blank" href="${pageContext.request.contextPath}/events/generatePDF/${event.event.id}"><i
																			class="fa fa-file-pdf-o"></i> Генерирай списък с участниците(PDF)</a></li>
																	<li><a href="${pageContext.request.contextPath}/events/generateExcel/${event.event.id}"><i
																			class="fa fa-file-excel-o"></i> Генерирай списък с участниците(Excel)</a></li>
																</ul>
															</div>
														</td>
													</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<div id="myEventsPast" class="tab-pane fade">
									<table class="myEventsTable table table-striped table-bordered">
										<thead>
											<tr>
												<th>Title</th>
												<th>Created</th>
												<th>Modified</th>
												<th>Participants/Max</th>
												<th>Country</th>
												<th>City</th>
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
																		<span class="glyphicon glyphicon-search">Преглед</span>
																	</button>
																</a>
															</div>
															<div class="btn-group actions col-md-6">
																<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
																	<span class="glyphicons glyphicons-cogwheel">Действие</span>
																</button>
																<ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu">
																	<li><a href="${pageContext.request.contextPath}/events/editEvent/${event.event.id}"><i
																			class="fa fa-pencil"></i> Редакция </a></li>
																	<li><a data-toggle="modal" data-target="#confirmDelete${event.event.id}" href="#"> <i
																			class="glyphicon glyphicon-remove"></i> Изтриване
																	</a></li>
																	<li><a data-toggle="modal" data-target="#eventParticipantModal${event.event.id}" href=""><i
																			class="fa fa-home"></i> Участници </a></li>
																	<li><a data-toggle="modal" data-target="#sendMailForm${event.event.id}" href=""><i
																			class="fa fa-envelope-o"></i> Изпращане на мейл до участниците</a></li>
																</ul>
															</div>
														</td>
													</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div id="myEventsAll" class="tab-pane fade">
									<table class="myEventsTable table table-striped table-bordered">
										<thead>
											<tr>
												<th>Title</th>
												<th>Created</th>
												<th>Modified</th>
												<th>Participants/Max</th>
												<th>Country</th>
												<th>City</th>
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
																	<span class="glyphicon glyphicon-search">Преглед</span>
																</button>
															</a>
														</div>
														<div class="btn-group actions col-md-6">
															<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
																<span class="glyphicons glyphicons-cogwheel">Действие</span>
															</button>
															<ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu">
																<li><a href="${pageContext.request.contextPath}/events/editEvent/${event.event.id}"><i
																		class="fa fa-pencil"></i> Редакция </a></li>
																<li><a data-toggle="modal" data-target="#confirmDelete${event.event.id}" href="#"> <i
																		class="glyphicon glyphicon-remove"></i> Изтриване
																</a></li>
																<li><a data-toggle="modal" data-target="#eventParticipantModal${event.event.id}" href=""><i
																		class="fa fa-home"></i> Участници </a></li>
																<li><a data-toggle="modal" data-target="#sendMailForm${event.event.id}" href=""><i
																		class="fa fa-envelope-o"></i> Изпращане на мейл до участниците</a></li>
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
							<div class="modal fade col-md-12" id="eventParticipantModal${event.event.id}" tabindex="-1"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-wide100">
									<div class="modal-content col-md-10">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
											<h3>${event.event.title}</h3>
										</div>
										<form action="${pageContext.request.contextPath}/events/updateParticipants" method="POST">
											<div class="modal-body col-md-12">
												<table id="eventParticipantTable${event.event.id}"
													class="eventParticipantTable table table-striped table-bordered">
													<thead>
														<tr>
															<th>Име</th>
															<th>Фамилия</th>
															<th>Пол</th>
															<th></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="participant" items="${event.event.eventsParticipants}" varStatus="participantStatus">
															<tr>
																<td>${participant.individual.firstName }</td>
																<td>${participant.individual.lastName }</td>
																<td>${participant.individual.isMale ? 'Мъж' : 'Жена' }</td>
																<td>
																	<div class="col-md-12">
																		<div class="col-md-2">
																			<a target="_blank"
																				href="${pageContext.request.contextPath}/users/viewUser/${participant.individual.userId}">
																				<button type="button" class="btn btn-info">
																					<span class="glyphicon glyphicon-search">Преглед</span>
																				</button>
																			</a>
																		</div>
																		<div class="col-md-2">
																			<a data-toggle="modal" data-target="#applicationFrom${participantStatus.index}" href="">
																				<button type="button" class="btn btn-info">
																					<span class="fa fa-eye">Форма</span>
																				</button>
																			</a>
																		</div>
																		<div class="col-md-3">
																			<a data-toggle="modal" data-target="#sendMailFormTo${participant.userId}" href="">
																				<button type="button" class="btn btn-info">
																					<span class="fa fa-envelope-o">Изпрати мейл</span>
																				</button>
																			</a>
																		</div>
																		<div class="btn-group col-md-5" data-toggle="buttons">
																			<input type="hidden" name="participantsList[${participantStatus.index}].eventId"
																				value="${participant.eventId}" /> <input type="hidden"
																				name="participantsList[${participantStatus.index}].userId" value="${participant.userId}" /> <input
																				type="hidden" name="participantsList[${participantStatus.index}].status"
																				value="${participant.status}" class="status" /> <label
																				class="btn btn-success ${participant.status == 1 ? 'active' : ''}"> <input type="radio"
																				name="event.event.eventsParticipants[${participantStatus.index}].status"
																				value="${participant.status}" onchange="switchStatus(this,1)"> Одобри <span
																				class="glyphicon glyphicon-ok"></span>
																			</label> <label class="btn btn-danger ${participant.status == 2 ? 'active' : ''}"> <input
																				type="radio" name="event.event.eventsParticipants[${participantStatus.index}].status"
																				value="${participant.status}" onchange="switchStatus(this,2)"> Откажи <span
																				class="glyphicon glyphicon-ok"></span>
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
												<button type="submit" class="btn btn-primary save">Save</button>
												<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
											</div>
										</form>
									</div>
								</div>
							</div>

							<div class="modal fade" id="confirmDelete${event.event.id}" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">

										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel">Confirm Delete</h4>
										</div>

										<div class="modal-body">
											<p>
												You are about to delete <strong>${event.event.title}</strong>, this procedure is irreversible.
											</p>
											<p>Do you want to proceed?</p>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
											<a href="${pageContext.request.contextPath}/events/deleteEvent/${event.event.id}"
												class="btn btn-danger danger">Delete</a>
										</div>
									</div>
								</div>
							</div>

							<!-- Email FORM -->
							<div class="modal fade col-md-12" id="sendMailForm${event.event.id}" tabindex="-1" aria-labelledby="myModalLabel"
								aria-hidden="true">
								<div class="modal-dialog modal-wide60">
									<form:form modelAttribute="mailTemplate"
										action="${pageContext.request.contextPath}/events/myEvents/sendMailToParticipants/${event.event.id}"
										method="POST">
										<div class="modal-content col-md-10">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h3>Изпращане на имейл до участниците в ${event.event.title}</h3>
											</div>
											<div class="modal-body col-md-12">
												<input type="hidden" name="eventId" value="${event.event.id}" />
												<div class="col-md-12">
													<form:label path="subject">Тема:</form:label>
												</div>
												<div class="col-md-12">
													<form:input path="subject" required="required" />
												</div>
												<div class="col-md-12">
													<form:label path="content">Съобщение:</form:label>
													<form:textarea path="content" rows="5" required="required" />
												</div>
											</div>
											<div class="modal-footer">
												<button type="submit" class="btn btn-default">
													<i class="fa fa-envelope-o"></i>Изпрати
												</button>
												<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
											</div>
										</div>
									</form:form>
								</div>
							</div>
						</c:forEach>

						<c:forEach var="event" items="${events}">
							<c:forEach var="participant" items="${event.event.eventsParticipants}" varStatus="status">
								<!-- APPLICATION FORM -->
								<div class="modal fade col-md-12" id="applicationFrom${status.index}" tabindex="-1"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-wide60">
										<div class="modal-content col-md-10">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
												<h3>Аппликационна форма на ${participant.individual.firstName } ${participant.individual.lastName }</h3>
											</div>
											<div class="modal-body col-md-12">${participant.appForm}</div>
											<div class="modal-footer">
												<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
											</div>
										</div>
									</div>
								</div>

								<!-- Email FORM -->
								<div class="modal fade col-md-12" id="sendMailFormTo${participant.userId}" tabindex="-1"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-wide60">
										<form:form modelAttribute="mailTemplate"
											action="${pageContext.request.contextPath}/events/myEvents/sendMailToParticipants/${event.event.id}/${participant.userId}"
											method="POST">
											<div class="modal-content col-md-10">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
													<h3>Изпращане на имейл до ${participant.individual.firstName } ${participant.individual.lastName }</h3>
												</div>
												<div class="modal-body col-md-12">
													<div class="col-md-12">
														<form:label path="subject">Тема:</form:label>
													</div>
													<div class="col-md-12">
														<form:input path="subject" required="required" />
													</div>
													<div class="col-md-12">
														<form:label path="content">Съобщение:</form:label>
														<form:textarea path="content" rows="5" required="required" />
													</div>
												</div>
												<div class="modal-footer">
													<button type="submit" class="btn btn-default">
														<i class="fa fa-envelope-o"></i>Изпрати
													</button>
													<button type="button" data-dismiss="modal" class="btn btn-default">Close</button>
												</div>
											</div>
										</form:form>
									</div>
								</div>
							</c:forEach>
						</c:forEach>

					</div>
					<jsp:include page="../reklams.jsp" />
				</div>
			</div>
		</div>
		<!-- End main content -->
		<jsp:include page="../layout/footer.jsp" />
	</div>
	<!-- End container -->
	<script>
		function switchStatus(e, status) {
			console.log("status:" + status);
			console.log(e);
			$(e).parents('td').find('.status').val(status);
		}
		$(document).ready(

				$('input[type=radio]').on('change', function() {
					var optionId = $(this).val();
					console.log(optionId);
				}),

				function() {
					$('.myEventsTable').DataTable(
							{
								"aoColumnDefs" : [ {
									'bSortable' : false,
									'aTargets' : [ -1 ]
								} ],
								"aLengthMenu" : [ [ 5, 10, 25, 50, -1 ],
										[ 5, 10, 25, 50, "All" ] ]
							});

					$('.eventParticipantTable').DataTable(
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