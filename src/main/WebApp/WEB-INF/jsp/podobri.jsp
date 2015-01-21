<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
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
									<li data-target="#closestEvents-carousel" data-slide-to="0" class="active"></li>
									<li data-target="#closestEvents-carousel" data-slide-to="1"></li>
									<li data-target="#closestEvents-carousel" data-slide-to="2"></li>
								</ol>
								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<div class="item active">
										<div class="row">
											<!-- item 1 -->
											<div class="col-md-4">
												<div class="thumbnail">
													<a href="#x"> <img src="${imgURL}/team1.jpg" alt="..."></a>
													<div class="caption">
														<h3>Новина 1</h3>
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

											<!-- item 2 -->
											<div class="col-md-4">
												<div class="thumbnail">
													<a href="#x"> <img src="${imgURL}/team1.jpg" alt="..."></a>
													<div class="caption">
														<h3>Новина 1</h3>
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

											<!-- item 3 -->
											<div class="col-md-4">
												<div class="thumbnail">
													<a href="#x"> <img src="${imgURL}/team1.jpg" alt="..."></a>
													<div class="caption">
														<h3>Новина 1</h3>
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
									</div>
									<!-- second slide -->
									<div class="item">
										<div class="row">
											<div class="col-md-4">
												<div class="thumbnail">
													<a href="#x"> <img src="${imgURL}/team1.jpg" alt="..."></a>
													<div class="caption">
														<h3>Новина 1</h3>
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
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END closesEvents -->
				</div>
				<jsp:include page="mainCalendar.jsp" />
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
	<!-- end main container -->
</body>
</html>



