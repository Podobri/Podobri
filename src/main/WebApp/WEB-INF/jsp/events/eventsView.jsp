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
			<div id="eventViewFull" class="col-md-10">
				<div class="row">
					<div id="eventViewFullPicture">
						<div class="col-md-12">
							<div id="eventFullViewDate" class="col-md-2">
								<div id="eventFullViewDateNo">
									<h1>
										<span>${event.dateFromDayOfMonth }</span>
									</h1>
								</div>
								<div id="eventFullViewDateMonth">
									<h4>
										<span>${event.dateFromMonth }</span>
									</h4>
								</div>
							</div>

							<div id="eventTime" class="col-md-12">
								<h5>
									<span class="glyphicon glyphicon-time"></span><span>${event.dateFromTime }</span>
								</h5>
							</div>
							<div id="eventApply" class="col-md-12">
								<a href="${pageContext.request.contextPath}/events/apply/${event.event.id}">
									<button type="button" class="btn btn-primary btn-lg">
										<div class="col-md-6">
											<span id="eventApply" class="glyphicon glyphicon-ok-sign"></span> КАНДИДАТСТВАЙ
										</div>
									</button>
								</a>
							</div>
							<div id="eventNameInfo" class="col-md-12">
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
					<div id="eventViewFullMenu" class="menuTabs">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#eventInformation">За събитието</a></li>
							<li><a data-toggle="tab" href="#eventProgram">Програма</a></li>
							<li><a data-toggle="tab" href="#eventLectors">Лектори</a></li>
							<li><a data-toggle="tab" href="#eventSponsors">Спонсори</a></li>
						</ul>
					</div>
				</div>

				<div class="row">
					<div id="eventViewFullMenuContent" class="tab-content">
						<div id="eventInformation" class="tab-pane fade in active">
							<p>
								<label>Категория:</label><span> ${event.category }</span> <br /> <label>Сфери на дейност:</label>
								<c:forEach varStatus="status" var="eventActivity" items="${event.event.activities}">
									<span> ${eventActivity.type } <c:if test="${!status.last}">,</c:if>
									</span>
								</c:forEach>
							</p>
							<p>
								<label>Начало:</label><span> ${event.event.dateFrom }</span> <br /> <label>Край:</label><span>
									${event.event.dateTo }</span> <br /> <label>Краен срок за кандидатстване:</label><span> ${event.event.deadline }</span>
							</p>
							<p>
								<label>Разходи за събитието:</label><span> ${event.costType }</span> <br /> <label>Организатор:</label><span>
									<u>${event.organizator } </u>
								</span>
							</p>
							<p>
								<label>Описание:</label><span> ${event.event.description }</span>
							</p>
							<p>
								<label>Допълнителна информация:</label><span> ${event.event.additionalInfo } </span> <br /> <label>Брой
									участници:</label><span> ${event.eventParticipantsSize } </span> <br /> <label>Уеб сайт:</label><span> <a
									href="${event.event.website}">${event.event.website }</a>
								</span> <br /> <label>Фейсбук:</label><span> <a href="${event.event.facebook}">${event.event.facebook }</a></span> <br />
								<label>Набира съорганизатори? </label><span> ${event.event.recruitCoorganizators ? 'Да' : 'Не'  }</span> <br />
								<label>Изисква аппликационна форма? </label><span>${event.event.applicationFormRequire ? 'Да' : 'Не' } </span>
							</p>
						</div>

						<div id="eventProgram" class="tab-pane fade">
							<div id="eventProgramContent">
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Тема</th>
											<th>Начало</th>
											<th>Край</th>
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

						<div id="eventLectors" class="tab-pane fade">
							<c:forEach items="${event.event.lectors}" var="lector">
								<div id="${lector.id}" class="eventLector">
									<div class="media">
										<div class="media-left">
											<a href="#"> <img class="media-object" src="${lector.picture}" alt="...">
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

						<div id="eventSponsors" class="tab-pane fade">
							<c:forEach items="${event.event.sponsors}" var="sponsor">
								<div class="col-md-3">
									<div class="col-md-12 text-center">
										<img class="img-circle" alt="" src="${sponsor.picture}" />
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
			<jsp:include page="../reklams.jsp" />
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