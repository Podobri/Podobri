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
              <strong><spring:message code="organizations" /></strong>
            </h3>
            <hr />
            <table id="users-table" class="table table-striped table-bordered">
              <thead>
                <tr>
                  <th><spring:message code="organizationName" /></th>
                  <th><spring:message code="email" /></th>
                  <th><spring:message code="registered" /></th>
                  <th><spring:message code="country" /></th>
                  <th><spring:message code="city" /></th>
                  <!-- 									<th></th> -->
                </tr>
              </thead>
              <tbody>
                <c:forEach var="user" items="${users}">
                  <tr>
                    <td>${user.organization.name }</td>
                    <td>${user.email }</td>
                    <td>${user.userInfo.created }</td>
                    <td>${user.userInfo.country.country }</td>
                    <td>${user.userInfo.city.city }</td>
                    <!-- 										<td> -->
                    <!-- 											<div class="btn-group actions"> -->
                    <!-- 												<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown"> -->
                    <!-- 													<span class="glyphicons glyphicons-cogwheel">Действие</span> -->
                    <!-- 												</button> -->
                    <!-- 												<ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu"> -->
                    <%-- 													<li><a href="${pageContext.request.contextPath}/users/viewUser/${user.id}"><i class="fa fa-user"></i> Преглед </a></li> --%>
                    <%-- 													<li><a href="${pageContext.request.contextPath}/users/editUser/${user.id}"><i class="fa fa-pencil"></i> Редакция </a></li> --%>
                    <%-- 													<li><a href="${pageContext.request.contextPath}/users/deleteUser/${user.id}"><i class="fa fa-pencil"></i> Изтриване </a></li> --%>
                    <!-- 													<li><a href="http://higps.org:8000/ibrokers/software/contact/simpleMail?contactID=2"><i class="fa fa-envelope-o"></i> Изпращане на мейл </a></li> -->
                    <!-- 												</ul> -->
                    <!-- 											</div> -->
                    <!-- 										</td> -->
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
						$('#users-table').DataTable(
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
