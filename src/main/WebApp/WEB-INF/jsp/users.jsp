<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content" class="col-md-12">

			<div id="users">
				<div class="row">
					<div id="actual-events-label" class="col-md-10">
						<h2>Потребители</h2>
						<hr />
						<table id="users-table"
							class="table table-striped table-bordered">
							<thead>
								<tr>
									<th>Username</th>
									<th>Email</th>
									<th>Created</th>
									<th>Modified</th>
									<th>Country</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="user" items="${users}">
									<tr>
										<td>${user.username }</td>
										<td>${user.email }</td>
										<td>${user.individual.firstName }</td>
										<td>${user.userInfo.country.country }</td>
										<td>${user.userInfo.city.city }</td>
										<td>
											<div class="btn-group actions">
												<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
													<span class="glyphicons glyphicons-cogwheel">Действие</span>
												</button>
												<ul class="dropdown-menu checkbox-persist pull-right text-left" role="menu">
													<li><a href="${pageContext.request.contextPath}/users/viewUser/${user.id}"><i class="fa fa-user"></i> Преглед </a></li>
													<li><a href="${pageContext.request.contextPath}/users/editUser/${user.id}"><i class="fa fa-pencil"></i> Редакция </a></li>
													<li><a href="${pageContext.request.contextPath}/users/deleteUser/${user.id}"><i class="fa fa-pencil"></i> Изтриване </a></li>
													<li><a href="http://higps.org:8000/ibrokers/software/contact/simpleMail?contactID=2"><i class="fa fa-envelope-o"></i> Изпращане на мейл </a></li>
													<li><a href="http://higps.org:8000/ibrokers/software/property/addAdv?contactID=2&contactName=Иван Петрович34"><i class="fa fa-home"></i> Нова обява </a></li>
													<li><a href="http://higps.org:8000/ibrokers/software/search/add?contactID=2&contactName=Иван Петрович34"><i class="fa fa-search"></i> Ново търсене </a></li>
													<li><a href="http://higps.org:8000/ibrokers/software/event/add?contactID=2&contactName=Иван Петрович34"><i class="fa fa-calendar"></i> Ново събитие </a></li>
												</ul>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="col-md-2 reklam">
						<div>Рекламирайте при нас</div>
						<div>Рекламирайте при нас</div>
						<div>Рекламирайте при нас</div>
					</div>
				</div>
			</div>
			<!-- End main content -->
			<jsp:include page="footer.jsp" />
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
