<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="imgURL" value="/resources/images/" />
<c:url var="images" value="/images/" />
<c:url var="thumb128" value="/images/thumbnail128x128/" />
<c:url var="thumb450" value="/images/thumbnail400x25/" />
<%@page session="true"%>
<html>
<jsp:include page="layout/head.jsp" />
<body>
	<div class="container">
		<jsp:include page="layout/menu.jsp" />
		<div id="content">
			<div id="main" class="col-md-12">
				<div id="main-slider" class="row">
					<div class="quick-search col-md-12">
						<div class="big-title">
							<h2>
								<spring:message code="quickSearchTitle" />
							</h2>
						</div>
						<div class="mini-title">
							<h3>
								<spring:message code="quickSearchSubTitle" />
							</h3>
						</div>
						<div class="form">
							<form:form id="eventsFilterForm" modelAttribute="eventsFilter" method="post"
								action="${pageContext.request.contextPath}/events/search/main">
								<div class="quick-search-inputs col-md-9">
									<div class="col-md-6">
										<form:select id="opportunityCategoryId" path="categoryId" cssClass="form-control">
											<form:option id="opportunityCategoryNone" value="-1">---<spring:message code="quickSearchWhat" />---</form:option>
											<form:options items="${categoriesList}" itemValue="id" itemLabel="category" />
										</form:select>
									</div>
									<div class="col-md-6">
										<form:select id="opportunityId" path="opportunityId" cssClass="form-control">
											<form:option id="opportunityNone" value="-1">---<spring:message code="quickSearchType" />---</form:option>
<%-- 											<form:options items="${opportunitiesList}" itemValue="id" itemLabel="opportunity" /> --%>
										</form:select>
									</div>
									<div class="col-md-6">
										<form:select id="eventCostTypesId" path="costTypeId" cssClass="form-control">
											<form:option id="eventCostTypesNone" value="-1" selected="selected">
												<spring:message code="financing" />
											</form:option>
											<form:options items="${costTypesList}" itemValue="id" itemLabel="cost" />
										</form:select>
									</div>
									<div class="col-md-6">
										<form:select id="activities" path="activities" multiple="false" cssClass="form-control">
											<form:option id="activityNone" value="-1" selected="selected">
												<spring:message code="quickSearchActivity" />
											</form:option>
											<form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
										</form:select>
									</div>
								</div>
								<div class="quick-search-find col-md-3">
									<span class="glyphicon glyphicon-search"></span>
									<input type="submit" class="form-control btn btn-success" value="<spring:message code="quickSearchSearch" />" />
								</div>
							</form:form>
						</div>
					</div>
					<!-- end quick-search -->
					<div class="carousel">
						<div class="carousel-inner">
							<%-- 								<c:forEach var="teaminfo" items="${teaminfos}" varStatus="status"> --%>
							<%-- 									<div class="item ${status.first ? 'active' : '' }"> --%>
							<!-- 										<div class="container"> -->
							<!-- 											<div class="carousel-content"> -->
							<!-- 												<a data-toggle="modal" data-target="#${teaminfo.firstname}" href=""> -->
							<%-- 													<h1>${teaminfo.fullname}</h1> --%>
							<!-- 												</a> -->
							<%-- 												<p class="lead">${teaminfo.position}</p> --%>
							<!-- 											</div> -->
							<!-- 										</div> -->
							<!-- 									</div> -->
							<%-- 								</c:forEach> --%>
						</div>

						<a class="prev" href="#main-slider" data-slide="prev"> <i class="glyphicon glyphicon-chevron-left"></i></a> <a class="next"
							href="#main-slider" data-slide="next"> <i class="glyphicon glyphicon-chevron-right"></i></a>
					</div>
					<!-- END slide -->
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
								<div class="carousel-inner" role="listbox" width="387"> <!--  Have to be removed -->
									<c:forEach var="closestEventGroup" items="${closestEventsGroup}" varStatus="status">
										<div class="item ${status.first ? 'active' : '' }">
											<div class="row">
												<c:forEach var="closestEvent" items="${closestEventGroup}" varStatus="status">
													<c:choose>
														<c:when test="${not empty closestEvent.event.picture}">
															<c:set value="${thumb450}${closestEvent.event.picture}" var="picture" />
														</c:when>
														<c:otherwise>
															<c:set value="${imgURL}thumb450.gif" var="picture" />
														</c:otherwise>
													</c:choose>
													<div class="item col-md-4">
														<div class="thumbnail">
															<a data-toggle="modal" data-target="#eventView" href=""><img class="group list-group-image"
																src="${picture }" alt="" /></a>
															<div class="caption">
																<a data-toggle="modal" data-target="#eventView" href="">
																	<h4 class="group inner list-group-item-heading">${closestEvent.event.title }</h4>
																</a>
																<p>
																	<spring:message code="from" />
																	: ${closestEvent.event.user.username }
																</p>
																<p class="thumbnail_footer">
																	<span class="thumbnail_date"> <img alt="date" src="${imgURL}/thumblines/date.png">
																		${closestEvent.dateFromDayOfMonth } ${closestEvent.dateFromMonth }
																	</span> <span class="thumbnail_location"> <img alt="location" src="${imgURL}/thumblines/location.png">
																		${closestEvent.event.city.city }
																	</span>
																	<security:authorize access="hasRole('ROLE_ADMINISTRATOR')"> 
																		<span class="thumbnail_views"> 
																			<img alt="views" src="${imgURL}/thumblines/views.png"> ${closestEvent.eventParticipantsSize}
																		</span>
																	</security:authorize>
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
	<script>
			makeAjaxCall('opportunityCategoryId', 'getOpportunitiesByCategory',
					'change', "opportunityId", "opportunity");
	</script>
</body>
</html>



