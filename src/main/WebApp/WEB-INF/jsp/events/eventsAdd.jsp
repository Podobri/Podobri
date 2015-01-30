<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="imgURL" value="resources/images/" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
	<div class="container">
		<jsp:include page="../layout/menu.jsp" />
		<div id="content">
			<div id="createEvent" class="col-md-10">
				<div class="row">
					<div id="createEventTitle">
						<h3>
							<strong>Create event</strong>
						</h3>
					</div>
				</div>

				<div class="row">
					<div id="uploadEventPicture" class="uploadEventPictureSection">
						<input type="file" name="eventPicture" class="notVisible" />
						<div id="uploadEventPicturePhoto"></div>
						<div id="uploadEventPictureLabel">Качете снимка</div>
					</div>
				</div>

				<div class="row">
					<div id="createNewEvent">
						<form:errors path="event.*" />
						<form:form id="createEventForm" modelAttribute="event" method="post" enctype="multipart/form-data"
							action="${pageContext.request.contextPath}/events/createEventSubmit">
							<fieldset>
								<div class="row">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4>Обща информация</h4>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<form:label path="title" cssClass="control-label">Title</form:label>
												<form:input id="title" path="title" required="required" cssClass="form-control" />
											</div>

											<div class="form-group">
												<form:label path="description" cssClass="control-label">Description</form:label>
												<form:input id="description" path="description" placeholder="Enter Short Description" required="required"
													cssClass="form-control" />
											</div>

											<div class="form-group">
												<form:label path="activities" cssClass="control-label">Activity</form:label>
												<form:select id="activities" path="activities" multiple="true" required="required" cssClass="form-control">
													<form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
												</form:select>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<form:label path="opportunityCategory.id" cssClass="control-label">Category</form:label>
												<form:select id="opportunityCategoryId" path="opportunityCategory.id" required="required"
													cssClass="form-control">
													<form:option id="opportunityCategoryNone" value="-1">---Категория---</form:option>
													<form:options items="${categoriesList}" itemValue="id" itemLabel="category" />
												</form:select>
											</div>
											<div class="form-group">
												<form:label path="opportunity.id" cssClass="control-label">Opportunity</form:label>
												<form:select id="opportunityId" path="opportunity.id" required="required" cssClass="form-control">
													<form:option id="opportunityNone" value="-1">---изберете категория---</form:option>
													<%-- 													<form:options items="${opportunitiesList}" itemValue="id" itemLabel="opportunity" /> --%>
												</form:select>
											</div>
											<div class="form-group">
												<form:label path="eventCostType" cssClass="control-label">Financing</form:label>
												<form:select id="eventCostType" path="eventCostType.id" cssClass="form-control">
													<form:options items="${costTypesList}" itemValue="id" itemLabel="cost" />
												</form:select>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4>Локация</h4>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<form:label path="country.id" cssClass="control-label">Country</form:label>
												<form:select id="countryId" path="country.id" required="required" cssClass="form-control">
													<form:option id="countryNone" value="-1">---Държава---</form:option>
													<form:options items="${countriesList}" itemValue="id" itemLabel="country" />
												</form:select>
											</div>

											<div class="form-group">
												<form:label path="city.id" cssClass="control-label">City</form:label>
												<form:select id="cityId" path="city.id" required="required" cssClass="form-control">
													<form:option id="cityNone" value="-1">---изберете държава---</form:option>
													<%-- 													<form:options items="${citiesList}" itemValue="id" itemLabel="city" /> --%>
												</form:select>
											</div>

											<div class="form-group">
												<form:label path="address" cssClass="control-label">Address</form:label>
												<form:input id="address_street" path="address" cssClass="form-control" />
											</div>
										</div>
										<div id="googleMaps" class="col-md-6">
											<div id="map-canvas" style="height: 320px"></div>
											<br /> <input id="address_lat" class="form-control " type="hidden" placeholder="" name="address_lat"
												value=""> <input id="address_lon" class="form-control " type="hidden" placeholder=""
												name="address_lon" value="">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4>Дата</h4>
										</div>
										<div class="form-group col-md-4">
											<form:label path="dateFrom" cssClass="control-label">Start date</form:label>
											<form:input id="startDate" path="dateFrom" type="datetime-local"
												cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
										</div>
										<div class="form-group col-md-4">
											<form:label path="dateTo" cssClass="control-label">End date</form:label>
											<form:input id="dateTo" path="dateTo" type="datetime-local"
												cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
										</div>
										<div class="form-group col-md-4">
											<form:label path="deadline" cssClass="control-label">Deadline</form:label>
											<form:input id="deadline" path="deadline" type="datetime-local"
												cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4>Допълнителна информация</h4>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<form:label path="maxParticipants" cssClass="control-label">Maximum participants</form:label>
												<form:input id="maxParticipants" path="maxParticipants" type="number" min="0" max="500"
													cssClass="form-control" />
											</div>
											<div class="form-group">
												<form:label path="website" cssClass="control-label">Website</form:label>
												<form:input id="website" path="website" placeholder="http://" cssClass="form-control" />
											</div>
											<div class="form-group">
												<form:label path="facebook" cssClass="control-label">Facebook</form:label>
												<form:input id="facebook" path="facebook" cssClass="form-control" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<form:label path="applicationFormRequire" cssClass="control-label">Require applications?</form:label>
												<form:checkbox id="applicationFormRequire" path="applicationFormRequire" cssClass="form-control" />
											</div>
											<form:select id="formId" path="form.name"  cssClass="form-control">
												<form:option id="formNone" value="">---Аппликационна форма---</form:option>
												<form:options items="${forms}" itemValue="name" itemLabel="name" />
											</form:select>
										</div>
										<div class="form-group col-md-12">
											<form:label path="additionalInfo" cssClass="control-label">Additional information</form:label>
											<form:textarea id="additionalInfo" path="additionalInfo" cssClass="col-md-12 form-control" rows="5" />
										</div>
									</div>
								</div>

								<div class="row">
									<div class="panel-heading">
										<h4 id="programTitle">Програма на събитието</h4>
									</div>
								</div>

								<div class="row">
									<div id="addProgramRow" class="form-group">
										<button id="addProgram" type="button" class="btn btn-success">
											<span class="glyphicon glyphicon-plus"></span>Добави елемент
										</button>
									</div>
								</div>

								<div class="row">
									<div class="panel-heading">
										<h4 id="lectorsTitle">Лектори на събитието</h4>
									</div>
								</div>

								<div class="row">
									<div id="addLectorRow" class="form-group">
										<button id="addLector" type="button" class="btn btn-success">
											<span class="glyphicon glyphicon-plus"></span>Добави елемент
										</button>
									</div>
								</div>

								<div class="row">
									<div class="panel-heading">
										<h4 id="sponsorsTitle">Спонсори на събитието</h4>
									</div>
								</div>

								<div class="row">
									<div id="addSponsorRow" class="form-group">
										<button id="addSponsor" type="button" class="btn btn-success">
											<span class="glyphicon glyphicon-plus"></span>Добави елемент
										</button>
									</div>
								</div>

								<div class="row">
									<div class="form-group text-center">
										<button id="createEventSubmit" class="btn btn-success btn-lg" type="submit">СЪЗДАЙ СЪБИТИЕ</button>
									</div>
								</div>
							</fieldset>
						</form:form>
					</div>
				</div>
			</div>
			<!-- End createEvent -->
			<jsp:include page="../reklams.jsp" />
		</div>
		<!-- End main content -->
		<jsp:include page="../layout/footer.jsp" />
	</div>
	<!-- End container -->
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
	<script src="/Podobri/resources/js/gmaps.js"></script>
	<script src="/Podobri/resources/js/eventsAddElement.js"></script>
	<script>
		makeAjaxCall('countryId', 'getCitiesByCountry', 'change', "cityId",
				"city");
		makeAjaxCall('opportunityCategoryId', 'getOpportunitiesByCategory',
				'change', "opportunityId", "opportunity");
		$(document).ready($(function() {
			addElement(0, 0, 0);
		}));
		$('#activities').chosen();
	</script>
</body>
</html>