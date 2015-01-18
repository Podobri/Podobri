<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="rootURL" value="/" />
<header id="header" role="banner">
	<div id="navbar" class="navbar navbar-default navbar-inverse headroom">
	<div class="container">
		<div id="logo" class="navbar-header"> 
<!-- 				Button for smallest screens -->
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
			<a class="navbar-brand" href="index.html"><img src="${rootURL}/resources/images/logo.jpg" alt="Podobri"></a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav pull-right">
				<li><a href="${pageContext.request.contextPath}/"><spring:message code="menuHome" /></a></li>
				<li><a href="${pageContext.request.contextPath}/events"><spring:message code="menuEvents" /></a></li>
				<li><a href="${pageContext.request.contextPath}/users"><spring:message code="menuUsers" /></a></li>
				<li><a href="${pageContext.request.contextPath}/about"><spring:message code="menuAbout" /></a></li>
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">More Pages <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="sidebar-left.html">Left Sidebar</a></li>
						<li><a href="sidebar-right.html">Right Sidebar</a></li>
					</ul>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/login">
						<img alt="Enter profile" src="${rootURL}/resources/images/profile.png" /> 
					</a>
				</li>
				<li><a href="?lang=en"> <img alt="" src="${rootURL}/resources/images/en.png" /></a></li>
				<li><a href="?lang=bg"> <img alt="" src="${rootURL}/resources/images/bg.png" /></a></li>
			  </ul>
			</div>
		</div>
	</div>
</header>