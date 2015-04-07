<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<c:url var="rootURL" value="/" />
<header id="header" role="banner">
	<div id="navbar" class="navbar navbar-default navbar-inverse headroom">
		<div class="row">
			<div id="logo" class="navbar-header">
				<!-- 				Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="nav-logo" href="${rootURL}"><img src="${rootURL}/resources/images/logo.jpg" alt="Podobri"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="${pageContext.request.contextPath}/"><spring:message code="menuHome" /></a></li>
					<li><a href="${pageContext.request.contextPath}/events"><spring:message code="menuEvents" /></a></li>
					<li><a href="${pageContext.request.contextPath}/users"><spring:message code="menuOrganizations" /></a></li>
					<li><a href="${pageContext.request.contextPath}/about"><spring:message code="menuAbout" /></a></li>
					<security:authorize access="isAuthenticated()">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
								class="glyphicon glyphicon-user pull-left"></span>&nbsp;&nbsp; <security:authentication
									property="principal.username" /> &nbsp;&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu col-md-12">
								<li><a href="${pageContext.request.contextPath}/users/myProfile"><spring:message code="menuMyProfile" /> <span
										class="glyphicon glyphicon-cog pull-right"></span></a></li>
								<li class="divider"></li>
								<security:authorize access="hasRole('ROLE_ORGANIZATION')">
									<li><a href="${pageContext.request.contextPath}/events/createEvent"><spring:message code="menuCreateEvent" /><span
											class="glyphicon glyphicon-plus pull-right"></span></a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/events/myEvents"><spring:message code="menuMyEvents" /><span
											class="glyphicon glyphicon-list-alt pull-right"></span></a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/forms/create"><spring:message code="menuCreateForm" /><span
											class="glyphicon glyphicon-plus pull-right"></span></a></li>
									<li class="divider"></li>
									<li><a href="${pageContext.request.contextPath}/forms/viewForms"><spring:message code="menuMyForms" /><span
											class="glyphicon glyphicon-list-alt pull-right"></span></a></li>
											<li class="divider"></li>
								</security:authorize>
								<security:authorize access="hasRole('ROLE_INDIVIDUAL')">
									<li><a href="${pageContext.request.contextPath}/events/createInitiative"><spring:message code="menuCreateInitiative" /><span
											class="glyphicon glyphicon-plus pull-right"></span></a></li>
									<li class="divider"></li>
								</security:authorize>
<%-- 								<li><a href="#"><spring:message code="menuMessages" /> <span class="badge pull-right"> 12 </span></a></li> --%>
<!-- 								<li class="divider"></li> -->
								<li><a href="${pageContext.request.contextPath}/j_spring_security_logout"><spring:message code="menuSignOut" /> <span
										class="glyphicon glyphicon-log-out pull-right"></span></a></li>
							</ul></li>
					</security:authorize>
					<security:authorize access="isAnonymous()">
						<li>
						<a data-toggle="modal" data-target="#login" href="">
<%-- 						<a href="${pageContext.request.contextPath}/login"> --%>
						<spring:message code="menuSignIn" /> <span
								class="glyphicon glyphicon-log-in pull-left"></span></a></li>
					</security:authorize>
					<li><a href="?lang=en"> <img alt="<spring:message code="menuLanguageEn" />" src="${rootURL}/resources/images/en.png" /></a></li>
					<li><a href="?lang=bg"> <img alt="<spring:message code="menuLanguageBg" />" src="${rootURL}/resources/images/bg.png" /></a></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../loginModal.jsp" />
</header>