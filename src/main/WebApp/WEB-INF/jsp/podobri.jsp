<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<script>
	$(document).ready(function() {
		$('.cal-item').on('click', function() {
			$('.cal-events-list-container').slideUp(300).slideDown(300);
		});
	});
</script>
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content">
			<div id="main">
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

			<div id="closestEvents" class="col-md-10">
				<div class="well col-md-offset-1 col-md-10">
					<div id="myCarousel" class="carousel slide">

						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						</ol>

						<!-- Carousel items -->
						<div class="carousel-inner">
							<div class="item active">
								<div class="row-fluid">
									<div class="span3 col-md-4">
										<a href="#x" class="thumbnail"> <img alt="" src="${imgURL}/team1.jpg">
										</a>
										<div class="caption">
											<h4>Новина 1</h4>
											<p>От : Технически Университет - София</p>

											<p class="thumbnail_footer">
												<span class="thumbnail_date"> <img alt="date" src="${imgURL}/thumblines/date.png"> 27 май
												</span> <span class="thumbnail_location"> <img alt="location" src="${imgURL}/thumblines/location.png">
													София
												</span> <span class="thumbnail_views"> <img alt="views" src="${imgURL}/thumblines/views.png"> 44
												</span>
											</p>
										</div>
									</div>

									<div class="span3 col-md-4">
										<a href="#x" class="thumbnail"> <img alt="" src="${imgURL}/team1.jpg">
										</a>
										<div class="caption">
											<h4>Новина 1</h4>
											<p>От : Технически Университет - София</p>

											<p class="thumbnail_footer">
												<span class="thumbnail_date"> <img alt="date" src="${imgURL}/thumblines/date.png"> 27 май
												</span> <span class="thumbnail_location"> <img alt="location" src="${imgURL}/thumblines/location.png">
													София
												</span> <span class="thumbnail_views"> <img alt="views" src="${imgURL}/thumblines/views.png"> 44
												</span>
											</p>
										</div>
									</div>

									<div class="span3 col-md-4">
										<a href="#x" class="thumbnail"> <img alt="" src="${imgURL}/team1.jpg">
										</a>
										<div class="caption">
											<h4>Новина 1</h4>
											<p>От : Технически Университет - София</p>

											<p class="thumbnail_footer">
												<span class="thumbnail_date"> <img alt="date" src="${imgURL}/thumblines/date.png"> 27 май
												</span> <span class="thumbnail_location"> <img alt="location" src="${imgURL}/thumblines/location.png">
													София
												</span> <span class="thumbnail_views"> <img alt="views" src="${imgURL}/thumblines/views.png"> 44
												</span>
											</p>
										</div>
									</div>
								</div>
							</div>

							<div class="item">
								<div class="row-fluid">
									<c:forEach var="event" items="${events}">
										<div class="span3 col-md-4">
											<a href="#x" class="thumbnail"> <img alt="" src="${event.picture}"></a>

											<div class="caption">
												<h4>${event.name}</h4>
												<p>${event.description}</p>

												<p class="thumbnail_footer">
													<span class="thumbnail_date"> <img alt="date" src="${imgURL}/thumblines/date.png">
														${event.date_from}
													</span> <span class="thumbnail_location"> <img alt="location" src="${imgURL}/thumblines/location.png">
														${event.city}
													</span> <span class="thumbnail_views"> <img alt="views" src="${imgURL}/thumblines/views.png"> 44
													</span>
												</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END closesEvents -->
			<jsp:include page="mainCalendar.jsp" />
		</div>
		<!-- end main container -->
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>



