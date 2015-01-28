<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html>
<html>
<jsp:include page="layout/head.jsp" />
<body>
	<div class="container">
		<jsp:include page="layout/menu.jsp" />
		<div id="content">
			<div id="main" class="col-md-12">
				<div class="row">
					<div id="slide">
						<section id="main-slider" class="carousel">
							<div class="carousel-inner">
								<c:forEach var="teaminfo" items="${teaminfos}" varStatus="status">
									<div class="item ${status.first ? 'active' : '' }">
										<div class="container">
											<div class="carousel-content">
												<a data-toggle="modal" data-target="#${teaminfo.firstname}" href="">
													<h1>${teaminfo.fullname}</h1>
												</a>
												<p class="lead">${teaminfo.position}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>

							<a class="prev" href="#main-slider" data-slide="prev"> <i class="icon-angle-left"></i></a> <a class="next"
								href="#main-slider" data-slide="next"> <i class="icon-angle-right"></i></a>
						</section>
					</div>
					<!-- END slide -->

					<c:forEach var="teaminfo" items="${teaminfos}">
						<div class="modal fade col-md-12" id="${teaminfo.firstname}" tabindex="-1" aria-labelledby="myModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-wide60">
								<div class="modal-content col-md-10">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
										<h3>${teaminfo.fullname}</h3>
										${teaminfo.position}
									</div>
									<div class="modal-body col-md-12">
										<div class="AboutPictureSection col-md-5">
											<a href="#x" class="thumbnail"> <img alt="View" src="${imgURL}/team1.jpg">
											</a>
										</div>
										<div class="AboutInformationSection col-md-7">
											<div class="AboutInformationText">
												<p>${teaminfo.info}</p>
											</div>
											<div class="AboutInformationContacts">
												<h2>
													<a> Contact </a>
												</h2>
												<p class="icon-phone">
													<a> ${teaminfo.phone} </a>
												</p>
												<br />
												<p class="icon-envelope">
													<a> ${teaminfo.email} </a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

				<div class="row">
					<div id="closestEvents col-md-offset-1 col-md-10">
						<div class="well">
							<div id="closestEvents-carousel" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<c:forEach var="closestEventGroup" items="${closestEventsGroup}" varStatus="status">
										<li data-target="#closestEvents-carousel" data-slide-to="${status.index }"
											${status.first ? 'class="active"' : '' }></li>
									</c:forEach>
								</ol>
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<c:forEach var="closestEventGroup" items="${closestEventsGroup}" varStatus="status">
										<div class="item ${status.first ? 'active' : '' }">
											<div class="row">
												<c:forEach var="closestEvent" items="${closestEventGroup}" varStatus="status">
													<div class="item col-md-4">
														<div class="thumbnail">
															<a data-toggle="modal" data-target="#eventView" href=""><img class="group list-group-image"
																src="http://placehold.it/400x250/000/fff" alt="" /></a>
															<div class="caption">
																<a data-toggle="modal" data-target="#eventView" href="">
																	<h4 class="group inner list-group-item-heading">${closestEvent.event.title }</h4>
																</a>
																<p>От : ${closestEvent.event.user.username }</p>
																<p class="thumbnail_footer">
																	<span class="thumbnail_date"> <img alt="date" src="${imgURL}/thumblines/date.png">
																		${closestEvent.dateFromDayOfMonth } ${closestEvent.dateFromMonth }
																	</span> <span class="thumbnail_location"> <img alt="location" src="${imgURL}/thumblines/location.png">
																		${closestEvent.event.city.city }
																	</span> <span class="thumbnail_views"> <img alt="views" src="${imgURL}/thumblines/views.png">
																		${closestEvent.eventParticipantsSize}
																	</span>
																</p>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<!-- END closesEvents -->
				</div>
				<jsp:include page="mainCalendar.jsp" />
			</div>
		</div>
		<jsp:include page="layout/footer.jsp" />
	</div>
	<!-- end main container -->
</body>
</html>



