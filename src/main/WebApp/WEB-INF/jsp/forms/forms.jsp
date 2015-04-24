<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html>
<html>
<jsp:include page="../layout/head.jsp" />
<body>
  <div class="container">
    <jsp:include page="../layout/menu.jsp" />
    <div id="content" class="col-md-12">
      <div id="users">
        <div class="row">
          <div id="actual-events-label" class="col-md-10">
            <h3>
              <strong><spring:message code="menuMyForms" /></strong>
            </h3>
            <hr />
            <table id="forms-table" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th><spring:message code="formName" /></th>
                  <th><spring:message code="created" /></th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="form" items="${forms}">
                  <tr>
                    <td>${form.name }</td>
                    <td>${form.created }</td>
                    <td><a target="_blank" href="${pageContext.request.contextPath}/forms/viewForm/${form.name}">
                        <button type="button" class="btn btn-info">
                          <span class="fa fa-eye"><spring:message code="viewBtn" /></span>
                        </button>
                    </a></td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
          <jsp:include page="../ads.jsp" />
        </div>
      </div>
      <!-- End main content -->
      <jsp:include page="../layout/footer.jsp" />
    </div>
  </div>
  <!-- End container -->
  <script>
			$(document).ready(
					function() {
						$('#forms-table').DataTable(
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
