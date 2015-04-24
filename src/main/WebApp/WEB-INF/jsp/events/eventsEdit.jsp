<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url var="imgURL" value="resources/images/" />
<html>
<jsp:include page="../layout/head.jsp" />
<body>
  <div class="container">
    <jsp:include page="../layout/menu.jsp" />
    <div id="content">
      <div id="create-event" class="col-md-10">
        <div class="row">
          <div id="create-event-title">
            <h3>
              <strong><spring:message code="eventEditTitle" /></strong>
            </h3>
          </div>
        </div>
        <div class="row">
          <div id="upload-event-picture" class="upload-event-picture-section">
            <div id="upload-event-picture-photo"></div>
            <div id="upload-event-picture-label">
              <spring:message code="uploadImage" />
            </div>
          </div>
        </div>
        <div class="row">
          <div id="create-new-event">
            <form:errors path="event.*" />
            <form:form id="create-event-form" modelAttribute="event" method="post"
              action="${pageContext.request.contextPath}/events/updateEvent">
              <fieldset>
                <div class="row">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4>
                        <spring:message code="commonInformation" />
                      </h4>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <form:label path="title" cssClass="control-label">
                          <spring:message code="eventTitle" />
                        </form:label>
                        <form:input id="title" path="title" required="required" cssClass="form-control" />
                      </div>
                      <div class="form-group">
                        <form:label path="description" cssClass="control-label">
                          <spring:message code="description" />
                        </form:label>
                        <form:input id="description" path="description"
                           required="required"
                          cssClass="form-control" />
                      </div>
                      <div class="form-group">
                        <form:label path="activities" cssClass="control-label">
                          <spring:message code="activity" />
                        </form:label>
                        <form:select id="activities" path="activities" multiple="true" required="required" cssClass="form-control">
                          <form:options items="${activitiesList}" itemValue="id" itemLabel="type" />
                        </form:select>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <form:label path="opportunityCategory.id" cssClass="control-label">
                          <spring:message code="category" />
                        </form:label>
                        <form:select id="opportunity-category" path="opportunityCategory.id" required="required"
                          cssClass="form-control">
                          <form:options items="${categoriesList}" itemValue="id" itemLabel="category" />
                        </form:select>
                      </div>
                      <div class="form-group">
                        <form:label path="opportunity.id" cssClass="control-label">
                          <spring:message code="opportunity" />
                        </form:label>
                        <form:select id="opportunity" path="opportunity.id" required="required" cssClass="form-control">
                          <form:options items="${opportunitiesList}" itemValue="id" itemLabel="opportunity" />
                        </form:select>
                      </div>
                      <div class="form-group">
                        <form:label path="eventCostType" cssClass="control-label">
                          <spring:message code="financing" />
                        </form:label>
                        <form:select id="event-cost-type" path="eventCostType.id" cssClass="form-control">
                          <form:options items="${costTypesList}" itemValue="id" itemLabel="cost" />
                        </form:select>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4>
                        <spring:message code="location" />
                      </h4>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <form:label path="country.id" cssClass="control-label">
                          <spring:message code="country" />
                        </form:label>
                        <form:select id="country" path="country.id" required="required" cssClass="form-control">
                          <form:options items="${countriesList}" itemValue="id" itemLabel="country" />
                        </form:select>
                      </div>
                      <div class="form-group">
                        <form:label path="city.id" cssClass="control-label">
                          <spring:message code="city" />
                        </form:label>
                        <form:select id="city" path="city.id" required="required" cssClass="form-control">
                          <form:options items="${citiesList}" itemValue="id" itemLabel="city" />
                        </form:select>
                      </div>
                      <div class="form-group">
                        <form:label path="address" cssClass="control-label">
                          <spring:message code="address" />
                        </form:label>
                        <form:input id="address_street" path="address" cssClass="form-control" />
                      </div>
                    </div>
                    <div id="google-maps" class="col-md-6">
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
                      <h4>
                        <spring:message code="date" />
                      </h4>
                    </div>
                    <div class="form-group col-md-4">
                      <form:label path="dateTo" cssClass="control-label">
                        <spring:message code="eventStartDate" />
                      </form:label>
                      <form:input id="date-to" path="dateTo" type="datetime-local"
                        cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
                    </div>
                    <div class="form-group col-md-4">
                      <form:label path="deadline" cssClass="control-label">
                        <spring:message code="eventDeadline" />
                      </form:label>
                      <form:input id="deadline" path="deadline" type="datetime-local"
                        cssClass="form-control date datepicker margin-top-none" placeholder="23/9/2013" />
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="panel panel-default">
                    <div class="panel-heading">
                      <h4>
                        <spring:message code="commonInformation" />
                      </h4>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <form:label path="website" cssClass="control-label">
                          <spring:message code="website" />
                        </form:label>
                        <form:input id="website" path="website" placeholder="http://" cssClass="form-control" />
                      </div>
                      <div class="form-group">
                        <form:label path="facebook" cssClass="control-label">
                          <spring:message code="facebook" />
                        </form:label>
                        <form:input id="facebook" path="facebook" cssClass="form-control" />
                      </div>
                    </div>
                    <div class="form-group col-md-12">
                      <form:label path="additionalInfo" cssClass="control-label">
                        <spring:message code="additionalInformation" />
                      </form:label>
                      <form:textarea id="additional-info" path="additionalInfo" cssClass="col-md-12 form-control" rows="5" />
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="panel-heading">
                    <h4 id="program-title">
                      <spring:message code="eventProgram" />
                    </h4>
                  </div>
                </div>
                <div class="row">
                  <c:forEach items="${event.eventsPrograms}" var="eventProgram" varStatus="status">
                    <div class='schedule element-wrapper'>
                      <div class='form-group col-md-6'>
                        <form:label path='eventsPrograms["${status.index}"].subject' class='control-label'>
                          <spring:message code="subject" />
                        </form:label>
                        <form:input path='eventsPrograms["${status.index}"].subject' type='text' class='form-control' />
                      </div>
                      <div class='form-group col-md-3'>
                        <form:label path='eventsPrograms["${status.index}"].dateFrom' class='control-label'>
                          <spring:message code="eventStart" />
                        </form:label>
                        <form:input path='eventsPrograms["${status.index}"].dateFrom' type='datetime-local'
                          class='form-control date datepicker margin-top-none' placeholder='23/9/2013' />
                      </div>
                      <div class='form-group col-md-3'>
                        <form:label path='eventsPrograms["${status.index}"].dateTo' class='control-label'>
                          <spring:message code="eventEnd" />
                        </form:label>
                        <form:input path='eventsPrograms["${status.index}"].dateTo' type='datetime-local'
                          class='form-control date datepicker margin-top-none' placeholder='23/9/2013' />
                      </div>
                      <div class='form-group col-md-12'>
                        <form:label path='eventsPrograms["${status.index}"].information' cssClass='control-label'>
                          <spring:message code="description" />
                        </form:label>
                        <form:textarea path='eventsPrograms["${status.index}"].information' class='col-md-12 form-control'
                          rows='5'></form:textarea>
                      </div>
                    </div>
                  </c:forEach>
                  <div id="add-program-row" class="form-group">
                    <button id="add-program" type="button" class="btn btn-success">
                      <span class="glyphicon glyphicon-plus"></span>
                      <spring:message code="eventAddElementBtn" />
                    </button>
                  </div>
                </div>
                <div class="row">
                  <div class="panel-heading">
                    <h4 id="lectors-title">
                      <spring:message code="eventLectors" />
                    </h4>
                  </div>
                </div>
                <div class="row">
                  <div id="add-lector-row" class="form-group">
                    <button id="add-lector" type="button" class="btn btn-success">
                      <span class="glyphicon glyphicon-plus"></span>
                      <spring:message code="eventAddElementBtn" />
                    </button>
                  </div>
                </div>
                <div class="row">
                  <div class="panel-heading">
                    <h4 id="sponsors-title">
                      <spring:message code="eventSponsors" />
                    </h4>
                  </div>
                </div>
                <div class="row">
                  <div id="add-sponsor-row" class="form-group">
                    <button id="add-sponsor" type="button" class="btn btn-success">
                      <span class="glyphicon glyphicon-plus"></span>
                      <spring:message code="eventAddElementBtn" />
                    </button>
                  </div>
                </div>
                <div class="row">
                  <div class="form-group text-center">
                    <button id="create-event-submit" class="btn btn-success btn-lg" type="submit">
                      <spring:message code="saveBtn" />
                    </button>
                  </div>
                </div>
              </fieldset>
            </form:form>
          </div>
        </div>
      </div>
      <!-- End edit Event -->
      <jsp:include page="../ads.jsp" />
    </div>
    <!-- End main content -->
    <jsp:include page="../layout/footer.jsp" />
  </div>
  <!-- End container -->
  <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&libraries=places"></script>
  <script src="/Podobri/resources/js/gmaps.js"></script>
  <script src="/Podobri/resources/js/eventsAddElement.js"></script>
  <script>
			$(document).ready($(function() {
				var programsIndex = "${fn:length(event.eventsPrograms)}";
				var lectorsIndex = "${fn:length(event.eventsPrograms)}";
				var sponsorsIndex = "${fn:length(event.eventsPrograms)}";
				addElement(programsIndex, lectorsIndex, sponsorsIndex);
			}));
			$('#activities').chosen();
		</script>
</body>
</html>
