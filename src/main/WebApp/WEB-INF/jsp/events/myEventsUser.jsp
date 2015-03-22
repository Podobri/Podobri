<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div id="profileMyEvents" class="tab-pane fade">
	<div class="row">
		<div id="myEvents" class="menuTabs col-md-5">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#myEventsIncoming"><spring:message code="myEventsUpcoming" /></a></li>
				<li><a data-toggle="tab" href="#myEventsPast"><spring:message code="myEventsPast" /></a></li>
				<li><a data-toggle="tab" href="#myEventsAll"><spring:message code="myEventsAll" /></a></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div id="myEventsContent" class="tab-content col-md-12">
			<div id="myEventsIncoming" class="tab-pane fade in active">
				<table class="myEventsTable table table-striped table-bordered">
					<thead>
						<tr>
							<th><spring:message code="eventTitle" /></th>
							<th><spring:message code="eventStart" /></th>
							<th><spring:message code="eventEnd" /></th>
							<th><spring:message code="country" /></th>
							<th><spring:message code="city" /></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="event" items="${events}">
							<c:if test="${event.event.title == 'MyEvent'}">
								<tr>
									<td>${event.event.title }</td>
									<td>${event.dateFromDayOfMonth }${event.dateFromMonth }</td>
									<td>${event.dateFromTime }</td>
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
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div id="myEventsPast" class="tab-pane fade">
				<table class="myEventsTable table table-striped table-bordered">
					<thead>
						<tr>
							<th><spring:message code="eventTitle" /></th>
							<th><spring:message code="eventStart" /></th>
							<th><spring:message code="eventEnd" /></th>
							<th><spring:message code="country" /></th>
							<th><spring:message code="city" /></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="event" items="${events}">
							<c:if test="${event.event.title != 'MyEvent'}">
								<tr>
									<td>${event.event.title }</td>
									<td>${event.dateFromDayOfMonth }${event.dateFromMonth }</td>
									<td>${event.dateFromTime }</td>
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
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="myEventsAll" class="tab-pane fade">
				<table class="myEventsTable table table-striped table-bordered">
					<thead>
						<tr>
							<th><spring:message code="eventTitle" /></th>
							<th><spring:message code="eventStart" /></th>
							<th><spring:message code="eventEnd" /></th>
							<th><spring:message code="country" /></th>
							<th><spring:message code="city" /></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="event" items="${events}">
							<tr>
								<td>${event.event.title }</td>
								<td>${event.dateFromDayOfMonth }${event.dateFromMonth }</td>
								<td>${event.dateFromTime }</td>
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
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>