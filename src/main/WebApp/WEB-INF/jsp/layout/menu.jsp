<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<c:url var="rootURL" value="/" />
<c:url var="imgURL" value="/resources/images/" />
<header id="header" role="banner">
	<div id="navbar" class="navbar navbar-default navbar-inverse headroom">
		<div class="row">
			<div id="logo" class="navbar-header">
				<!-- 				Button for smallest screens -->
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="nav-logo" href="${rootURL}">
					<img src="${imgURL}logo.jpg" alt="Podobri">
				</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav pull-right">
					<li><a href="${pageContext.request.contextPath}/"><spring:message
								code="menuHome" /></a></li>
					<li><a href="${pageContext.request.contextPath}/events"><spring:message
								code="menuEvents" /></a></li>
					<li><a href="${pageContext.request.contextPath}/organizations"><spring:message
								code="menuOrganizations" /></a></li>
					<li><a href="${pageContext.request.contextPath}/about"><spring:message
								code="menuAbout" /></a></li>
					<security:authorize access="isAuthenticated()">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><span
								class="glyphicon glyphicon-user pull-left"></span>&nbsp;&nbsp; <security:authentication
									property="principal.username" /> &nbsp;&nbsp;&nbsp;&nbsp;</a>
							<ul class="dropdown-menu col-md-12">
								<li><a
									href="${pageContext.request.contextPath}/users/myProfile"><spring:message
											code="menuMyProfile" /> <span
										class="glyphicon glyphicon-cog pull-right"></span></a></li>
								<li class="divider"></li>
								<security:authorize access="hasRole('ROLE_ORGANIZATION')">
									<li><a
										href="${pageContext.request.contextPath}/events/createEvent"><spring:message
												code="menuCreateEvent" /><span
											class="glyphicon glyphicon-plus pull-right"></span></a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/events/myEvents"><spring:message
												code="menuMyEvents" /><span
											class="glyphicon glyphicon-list-alt pull-right"></span></a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/forms/create"><spring:message
												code="menuCreateForm" /><span
											class="glyphicon glyphicon-plus pull-right"></span></a></li>
									<li class="divider"></li>
									<li><a
										href="${pageContext.request.contextPath}/forms/viewForms"><spring:message
												code="menuMyForms" /><span
											class="glyphicon glyphicon-list-alt pull-right"></span></a></li>
									<li class="divider"></li>
								</security:authorize>
								<security:authorize access="hasRole('ROLE_INDIVIDUAL')">
									<li><a
										href="${pageContext.request.contextPath}/events/createInitiative"><spring:message
												code="menuCreateInitiative" /><span
											class="glyphicon glyphicon-plus pull-right"></span></a></li>
									<li class="divider"></li>
								</security:authorize>
								<%-- 								<li><a href="#"><spring:message code="menuMessages" /> <span class="badge pull-right"> 12 </span></a></li> --%>
								<!-- 								<li class="divider"></li> -->
								<li><a
									href="${pageContext.request.contextPath}/j_spring_security_logout"><spring:message
											code="menuSignOut" /> <span
										class="glyphicon glyphicon-log-out pull-right"></span></a></li>
							</ul></li>
					</security:authorize>
					<security:authorize access="isAnonymous()">
						<li><a data-toggle="modal" data-target="#login" href="">
								<%-- 						<a href="${pageContext.request.contextPath}/login"> --%>
								<spring:message code="menuSignIn" /> <span
								class="glyphicon glyphicon-log-in pull-left"></span>
						</a></li>
					</security:authorize>
					<li><a href="?lang=en"> <img
							alt="<spring:message code="menuLanguageEn" />"
							src="${imgURL}en.png" /></a></li>
					<li><a href="?lang=bg"> <img
							alt="<spring:message code="menuLanguageBg" />"
							src="${imgURL}bg.png" /></a></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="../loginModal.jsp" />
</header>
<div id="settings_menu">
	<label for="settings_bg">Background</label>
	<input type="color" name="settings_bg" id="settings_bg" value="#edf6f6"/>
	
	<lable for="settings_view">View type 1,2,3</lable>
	<input type="radio" name="settings_type" value="1" id="settings_type_1" class="setting-type"/><label for="settings_type_1"> Type 1</label>
	<input type="radio" name="settings_type" value="2" id="settings_type_2" class="setting-type"/><label for="settings_type_2"> Type 2</label>
	<input type="radio" name="settings_type" value="3" id="settings_type_3" class="setting-type"/><label for="settings_type_3"> Type 3</label>
	
	<label for="settings_footer_bg">Footer BG</label>
	<input type="color" name="settings_footer_bg" id="settings_footer_bg" value="#82b1ea"/>
	
	<label for="settings_fs">font-size</label>
	<input type="number" name="settings_fs" id="settings_fs" value="14" max="32" min="8"/>
	
	<label for="settings_font">Font family</label>
	<input type="text" name="settings_font" id="settings_font" value="Arial" />
	
	<label for="settings_color">Text color</label>
	<input type="color" name="settings_color" id="settings_color" value="#fff" />
</div>
<script>
$('#settings_menu').on('mouseover',function(){
	$(this).css('width','100px');
});
$('#settings_menu').on('mouseout',function(){
	$(this).css('width','30px');
})
// background
$('#settings_bg').on('change',function(){
	$('body').css('background-color',$(this).val());
})
// footer background
$('#settings_footer_bg').on('change',function(){
	$('#footer-contacts').css('background',$(this).val());
})
// Font size
$('#settings_fs').on('change',function(){
	if($(this).val() <8 || $(this).val() > 32)
		$(this).val() = 14;
	$('body').css('font-size',$(this).val()+'px');
})
// text color
$('#settings_color').on('change',function(){
	$('body').css('color',$(this).val());
})
// text color
$('.setting-type').on('change',function(){
	var a = 100;
	switch($(this).val()){
		case '1' : break;
		case '2' : a = 90; break;
		case '3' : a = 80; break;
	};
	$('.container').css('width',a+'%');
})
$('#settings_font').on('keyup',function(){
	$('.container').css('font-family',$(this).val());
});

</script>