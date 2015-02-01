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
				<a class="navbar-brand" href="${rootURL}"><img src="${rootURL}/resources/images/logo.jpg" alt="Podobri"></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="${pageContext.request.contextPath}/"><spring:message code="menuHome" /></a></li>
					<li><a href="${pageContext.request.contextPath}/events"><spring:message code="menuEvents" /></a></li>
					<li><a href="${pageContext.request.contextPath}/users"><spring:message code="menuUsers" /></a></li>
					<li><a href="${pageContext.request.contextPath}/about"><spring:message code="menuAbout" /></a></li>
					<security:authorize access="isAuthenticated()">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><span
								class="glyphicon glyphicon-user pull-left"></span>&nbsp;&nbsp; <security:authentication property="principal.username" /> &nbsp;&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu col-md-12">
								<li><a href="${pageContext.request.contextPath}/users/myProfile">Моят профил <span
										class="glyphicon glyphicon-cog pull-right"></span></a></li>
								<li class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/events/createEvent">Създай събитие<span
										class="glyphicon glyphicon-plus pull-right"></span></a></li>
								<li class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/events/createInitiative">Създай инициатива<span
										class="glyphicon glyphicon-plus pull-right"></span></a></li>
								<li class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/events/myEvents">Моите събития<span
										class="glyphicon glyphicon-list-alt pull-right"></span></a></li>
								<li class="divider"></li>
								<security:authorize access="hasRole('ROLE_ORGANIZATION')">
									<li><a href="${pageContext.request.contextPath}/forms/create">Създай форма<span
											class="glyphicon glyphicon-plus pull-right"></span></a></li>
									<li class="divider"></li>
								</security:authorize>
								<li><a href="#">Messages <span class="badge pull-right"> 42 </span></a></li>
								<li class="divider"></li>
								<li><a href="${pageContext.request.contextPath}/j_spring_security_logout">Sign Out <span
										class="glyphicon glyphicon-log-out pull-right"></span></a></li>
							</ul></li>
					</security:authorize>
					<security:authorize access="isAnonymous()"> <!-- isAuthenticated() -->
					
					</security:authorize>
					<!-- 					<li><a data-toggle="modal" data-target="#login" href=""> <img alt="Enter profile" -->
					<%-- 							src="${rootURL}/resources/images/profile.png" /> --%>
					<!-- 					</a></li> -->
					<li><a href="?lang=en"> <img alt="" src="${rootURL}/resources/images/en.png" /></a></li>
					<li><a href="?lang=bg"> <img alt="" src="${rootURL}/resources/images/bg.png" /></a></li>
				</ul>
			</div>
		</div>
		<%-- 		<jsp:include page="login.jsp" /> --%>
	</div>
</header>