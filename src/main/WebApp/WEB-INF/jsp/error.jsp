<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<%-- 	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%> --%>
<%-- 	<%@ page import="com.seeburger.seefx.security.util.Settings, java.net.URL" %> --%>
<%-- 	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%--     <%@ taglib prefix="s" uri="http://www.seeburger.com/portal/taglib/commons" %> --%>
<!-- 	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> -->
<%--     <title><s:i18n key="com.seeburger.seefx.security.i18n.ErrorI18N.windowTitle"/></title> --%>
<%-- 	<link rel="stylesheet" type="text/css" href="<c:out value='${pageContext.request.contextPath}'/>/VAADIN/themes/default/login.css" /> --%>
<%-- 	<link rel="stylesheet" type="text/css" media="only screen and ( max-width :650px)" href="<c:out value='${pageContext.request.contextPath}'/>/VAADIN/themes/default/mobileLogin.css" /> --%>
<%-- 	<link rel="stylesheet" type="text/css" href="<c:out value='${pageContext.request.contextPath}'/>/custom/login.css" /> --%>
<!-- </head> -->
<!-- <body class="loginScreen"> -->
<%-- <% --%>
// 	URL reconstructedAdminConsoleURL = new URL(request.getScheme(),
// 	request.getServerName(),
// 	request.getServerPort(),
// 	"/admin-console");
<%-- %> --%>
<!--     <div class="loginForm" id="loginForm"> -->
<!--         <div class="header"> -->
<!--             <div class="margin"> -->
<!--                 <div class="logo"></div> -->
<!--             </div> -->
<!--         </div> -->
<!-- 		<div class="main"> -->
<!-- 			<div class="form"> -->
<%-- 				<c:choose> --%>
<%-- 					<c:when --%>
<%-- 						test='${400 == requestScope["javax.servlet.error.status_code"]}'> --%>
<!-- 						<div class="caption"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.clientErrorCaption" /> --%>
<!-- 						</div> -->
<!-- 						<div class="row"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.clientErrorText" /> --%>
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:when --%>
<%-- 						test='${401 == requestScope["javax.servlet.error.status_code"]}'> --%>
<!-- 						<div class="caption"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.authenticationRequiredCaption" /> --%>
<!-- 						</div> -->
<!-- 						<div class="row"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.authenticationRequiredText" /> --%>
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:when --%>
<%-- 						test='${403 == requestScope["javax.servlet.error.status_code"]}'> --%>
<!-- 						<div class="caption"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.forbiddenCaption" /> --%>
<!-- 						</div> -->
<!-- 						<div class="row"> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test='${!empty requestScope["FORBIDDENMESSAGEKEY"]}'> --%>
<%-- 									<s:i18n key='${requestScope["FORBIDDENMESSAGEKEY"]}' /> --%>
<%-- 								</c:when> --%>
<%-- 								<c:when test="${!empty FORBIDDENMESSAGEKEY}"> --%>
<%-- 									<s:i18n key="${FORBIDDENMESSAGEKEY}" /> --%>
<!-- 									default (page) scope -->
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 									<s:i18n --%>
<%-- 										key="com.seeburger.seefx.security.i18n.ErrorI18N.forbiddenText" /> --%>
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:when --%>
<%-- 						test='${404 == requestScope["javax.servlet.error.status_code"]}'> --%>
<!-- 						<div class="caption"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.notFoundCaption" /> --%>
<!-- 						</div> -->
<!-- 						<div class="row"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.notFoundText" /> --%>
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:when test='${!empty requestScope["license_error_user"]}'> --%>
<!-- 						<div class="caption"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.licenseUserCaption" /> --%>
<!-- 						</div> -->
<!-- 						<div class="row"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.licenseUserText" /> --%>
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:when test='${!empty requestScope["license_error_admin"]}'> --%>
<!-- 						<div class="caption"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.licenseAdminCaption" /> --%>
<!-- 						</div> -->
<!-- 						<div class="row"> -->
<!-- 							<p> -->
<%-- 								<s:i18n --%>
<%-- 									key="com.seeburger.seefx.security.i18n.ErrorI18N.licenseAdminText" /> --%>
<!-- 								<br /> -->
<%-- 								<s:i18n --%>
<%-- 									key="com.seeburger.seefx.security.i18n.ErrorI18N.licenseStatusAdminText" /> --%>
<%-- 								&nbsp;<b style="color: red"><c:out --%>
<%-- 										value='${requestScope.license_error_admin}' /></b> --%>
<!-- 							</p> -->
<!-- 							<p> -->
<%-- 								<s:i18n --%>
<%-- 									key="com.seeburger.seefx.security.i18n.ErrorI18N.licenseStatusAdminActionText" /> --%>
<!-- 								&nbsp;<br /> -->
<%-- 								Hidden until the Admin Console is available
<%--                            <a href='<%=reconstructedAdminConsoleURL%>'>Admin Console</a></b> --%>
<%--                            --%> --%>
<!-- 							</p> -->
<!-- 						</div> -->
<%-- 					</c:when> --%>
<%-- 					<c:otherwise> --%>
<!-- 						<div class="caption"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.internalErrorCaption" /> --%>
<!-- 						</div> -->
<!-- 						<div class="row"> -->
<%-- 							<s:i18n --%>
<%-- 								key="com.seeburger.seefx.security.i18n.ErrorI18N.internalErrorText" /> --%>
<!-- 						</div> -->
<%-- 					</c:otherwise> --%>
<%-- 				</c:choose> --%>
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="loginBoxFooter"> -->
<%--             <s:customLinks name="link.login" locale="${param.locale}" /> --%>
<!--         </div> -->
<!--     </div> -->
<!-- </body> -->
<!-- </html> -->