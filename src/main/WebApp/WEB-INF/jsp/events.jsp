<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="/resources/images/" />
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content">
			<div id="actualEvents" class="col-md-10">
				<c:if test="">
					<div class="row">
						<div id="filteredEventsMessage">${filteredEventsMessage}</div>
					</div>
				</c:if>

				<div class="row">
					<div id="actualEventsLabel">
						<h2>Actual Events</h2>
					</div>
				</div>
				<!-- FILTER -->
				<div class="row">
					<div id="eventsFilter">
						<div id="accordion" class="panel-group">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#eventsFilterPanel"> Filter &nbsp<span
											class="glyphicon glyphicon-chevron-down"></span>
										</a>
									</h4>
								</div>
								<div id="eventsFilterPanel" class="panel-collapse "> <!-- collapse -->
									<div class="panel-body">
										<form:errors path="eventsFilter.*" />
										<form:form id="eventsFilterForm" modelAttribute="eventsFilter" method="post"
											action="${pageContext.request.contextPath}/events/search">
											<fieldset>
												<div class="row">
													<div class="form-group col-md-4">
														<form:select id="opportunityCategory" path="categoryId" cssClass="form-control">
															<form:option id="opportunityCategoryNone" value="-1">---Категория---</form:option>
															<form:options items="${categoriesList}" itemValue="id" itemLabel="category" />
														</form:select>
													</div>

													<div class="form-group col-md-4">
														<form:select id="opportunityId" path="opportunityId" cssClass="form-control">
															<form:option id="opportunityNone" value="-1">---Възможност---</form:option>
															<form:options items="${opportunitiesList}" itemValue="id" itemLabel="opportunity" />
														</form:select>
													</div>
													
													<div class="form-group col-md-4">
														<form:select id="activities" path="activities" multiple="true" cssClass="form-control">
															<form:option id="activityNone" value="-1" disabled="true">---Сфера---</form:option>
															<form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
														</form:select>
													</div>
												</div>

												<div class="row">
													<div class="form-group col-md-4">
														<form:select id="country" path="countryId" cssClass="form-control">
															<form:option id="countryNone" value="-1">---Държава---</form:option>
															<form:options items="${countriesList}" itemValue="id" itemLabel="country" />
														</form:select>
													</div>

													<div class="form-group col-md-4">
														<form:select id="city" path="cityId" cssClass="form-control">
															<form:option id="cityNone" value="-1">---Град---</form:option>
															<form:options items="${citiesList}" itemValue="id" itemLabel="city" />
														</form:select>
													</div>

													<div class="form-group col-md-4">
														<form:select id="eventCostTypesId" path="costTypeId" cssClass="form-control">
															<form:option id="costTypeNone" value="-1">---Финансиране---</form:option>
															<form:options items="${costTypesList}" itemValue="id" itemLabel="cost" />
														</form:select>
													</div>
												</div>

												<div class="row">
													<div class="control-group col-md-4">
														<div class="controls">
															<span> Start Date </span>
															<form:input id="startDate" path="startDate" type="date"
																cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
														</div>
													</div>
													<div class="form-group col-md-4">
														<span> End Date </span>
														<form:input id="deadline" path="deadline" type="date"
															cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
													</div>

													<div class="form-group col-md-4">
														<button id="filterEvents" class="btn btn-success btn-lg" type="submit">
															<span class="glyphicon glyphicon-search"></span>SEARCH
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

				<div class="row">
					<div id="eventItem">
						<div class="media">
							<div id="eventPicture" class="media-left col-md-3">
								<a data-toggle="modal" data-target="#eventView" href=""> <img alt="" src="${imgURL}team1_256x256.jpg" />
								</a>
							</div>
							<div class="media-body caption col-md-9">
								<a data-toggle="modal" data-target="#eventView" href="">
									<h4 class="media-heading">Subject</h4>
								</a>
								<hr />
								<p>
									This is some sample text. This is some sample text. <br /> This is some sample text. This is some sample text.
								</p>
								<hr />
								<p>
									<span>Event category | event opportunity</span>
								</p>
								<p>
									<span> <img alt="" src="${imgURL}thumblines/calendar_24x24.png" /> 6 юни
									</span> <span> <img alt="" src="${imgURL}thumblines/location_24x24.png" /> София
									</span> <span> <img alt="" src="${imgURL}thumblines/views_24x24.png" /> 44
									</span> <span> <img alt="" src="${imgURL}thumblines/time_24x24.png" /> 14:00
									</span>
								</p>
								<p>
									<span> Organizator: TU-Sofia </span>
								</p>
							</div>
						</div>
					</div>
					<!-- END OF eventItem -->

					<!-- MODAL FOR EVERY ITEM -->
					<div class="modal fade col-md-12" id="eventView" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-wide70">
							<div class="modal-content col-md-10">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
									<h3>Спортуването като начин на живот</h3>
									<!-- <?php echo h($event['name']); ?> -->
								</div>
								<div class="modal-body">
									<div class="row">
										<div id="EventViewPictureSection">
											<a href="#x" class="thumbnail"> <img alt="" src="${imgURL}team1.jpg" />
											</a>
										</div>
									</div>
									<div class="row">
										<div id="EventViewMainInfo">
											<img alt="" src="${imgURL}thumblines/location_24x24.png" /> Варна, бул.Генерал Колев 45 <img alt=""
												src="${imgURL}thumblines/calendar_24x24.png" /> 15 май 2014 <img alt=""
												src="${imgURL}thumblines/time_24x24.png" /> 14:00-17:00 <img alt=""
												src="${imgURL}thumblines/views_24x24.png" /> 110
										</div>
									</div>
									<div class="row">
										<div id="EventViewShortDescription" class="col-md-7">This is some sample text. This is some sample
											text.This is some sample text. This is some sample text. This is some sample text. This is some sample
											text.This is some sample text. This is some sample text. This is some sample text. This is some sample
											text.This is some sample text. This is some sample text. This is some sample text. This is some sample text.
											This is some sample text. This is some sample text.This is some sample text. This is some sample text. This
											is some sample text. This is some sample text.This is some sample text. This is some sample text. This is
											some sample text. This is some sample text.This is some sample text. This is some sample text. This is some
											sample text. This is some sample text. This is some sample text. This is some sample text.This is some sample
											text. This is some sample text. This is some sample text. This is some sample text.This is some sample text.
											This is some sample text. This is some sample text. This is some sample text.This is some sample text. This
											is some sample text. This is some sample text. This is some sample text.</div>
										<div id="EventViewMoreInfo" class="col-md-5">
											<div id="EventViewOrganizator" class="col-md-12">
												<p>
												<h4>ОРГАНИЗАТОР:</h4>
												</p>
												<!-- <?php echo __('ORGANIZATOR_LABEL'); ?> -->
												<p>ADM Bulgaria</p>
												<!-- <?php echo h($event['User']['name']); ?> -->
											</div>
											<div id="EventViewIntendedFor" class="col-md-12">
												<p>
												<h4>ПРЕДНАЗНАЧЕНО ЗА:</h4>
												</p>
												<!-- <?php echo __('INTENDED_FOR_LABEL'); ?> -->
												<p>sportisti, uchenici, atlelti, deputati, text, text, text</p>
											</div>
											<div id="EventViewSocial" class="col-md-12 social-links">
												<img alt="" src="${imgURL}thumblines/fb_32.png" /> <img alt="" src="${imgURL}thumblines/twitter_32.png" />
												<img alt="" src="${imgURL}thumblines/linkedin_32.png" /> <img alt=""
													src="${imgURL}thumblines/google_32.png" /> <img alt="" src="${imgURL}thumblines/skype_32.png" />
											</div>
											<div id="EventViewFullDescription" class="col-md-12">
												<a href="${pageContext.request.contextPath}/events/viewEvent/"> <!-- ${id} -->
													<button type="button" class="btn btn-primary btn-lg">
														ПЪЛНО ОПИСАНИЕ
														<!-- <?php __('EVENT_VIEW_FULL_DESC'); ?> -->
													</button>
												</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END OF MODAL -->
				</div>
			</div>
			<!-- END OF actualEvents -->
			<jsp:include page="reklams.jsp" />
		</div>
		<!-- End main content -->
		<jsp:include page="footer.jsp" />
	</div>
	<!-- End container -->
	<script>
		function toggleChevron(e) {
			$(e.target).prev('.panel-heading').find("span").toggleClass(
					'glyphicon-chevron-up glyphicon-chevron-down ');
		}
		$('#accordion').on('hidden.bs.collapse', toggleChevron);
		$('#accordion').on('shown.bs.collapse', toggleChevron);
		$('#activities').chosen();
	</script>
</body>
</html>
