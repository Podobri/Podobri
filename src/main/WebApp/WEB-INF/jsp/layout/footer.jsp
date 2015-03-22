<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:url var="rootURL" value="/" />
<c:url var="resURL" value="/resources" />
<footer>
	<div class="row">
		<div id="partners">
			<ul id="flexisel" class="col-md-10 col-md-offset-1">
				<li><img alt="Partners" src="${rootURL}/resources/images/partners/1.png" /></li>
				<li><img alt="Partners" src="${rootURL}/resources/images/partners/2.png" /></li>
				<li><img alt="Partners" src="${rootURL}/resources/images/partners/3.png" /></li>
				<li><img alt="Partners" src="${rootURL}/resources/images/partners/4.png" /></li>
				<li><img alt="Partners" src="${rootURL}/resources/images/partners/5.png" /></li>
			</ul>
		</div>
	</div>

	<div class="row">
		<div id="footer-contacts">
			<div class="col-md-3 ">
				<h4><spring:message code="footerAboutTitle" /></h4>
				<p>
					Създадена през 2014 организацията, Създадена през 2014 организацията. Създадена през 2014 организацията,
					Създадена през 2014 организацията, Създадена през 2014 организацията. Създадена през 2014 организацията,
					Създадена през 2014 организацията, Създадена през 2014 организацията. <a href="#">Read more</a>
				</p>
			</div>
			<div class="col-md-3 ">
				<h4><spring:message code="footerNewsTitle" /></h4>
				<p><spring:message code="footerNewsSubTitle" /></p>
				<form name="SubscibeEmail" action="Subscribe">
					<div class="input-group">
						<input id="emailForSubscribe" type="text" class="form-control" placeholder="email"> <span
							class="input-group-btn">
							<button class="btn btn-warning" type="button"><span class="glyphicon glyphicon-ok"></span><spring:message code="footerSubscribeBtn" /></button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-md-2">
				<div class="col-md-12">
					<h4 class="align-center"><spring:message code="titlePodobri" /></h4>
				</div>
				<ul class="col-md-12">
					<li><h5><a href="${pageContext.request.contextPath}/"><spring:message code="menuHome" /></a></h5></li>
					<li><h5><a href="${pageContext.request.contextPath}/events"><spring:message code="menuEvents" /></a></h5></li>
					<li><h5><a href="${pageContext.request.contextPath}/users"><spring:message code="menuOrganizations" /></a></h5></li>
					<li><h5><a href="${pageContext.request.contextPath}/about"><spring:message code="menuAbout" /></a></h5></li>
					<li><h5><a href="${pageContext.request.contextPath}/about/tos"><spring:message code="footerToS" /></a></h5></li>
				</ul>
			</div>
			<div class="col-md-4">
				<h4><spring:message code="footerContactUsTitle" /></h4>
				<p>
					<spring:message code="footerPodobriTitle" /><br> <i class="icon-map-marker"></i> <spring:message code="footerAddress" /><br> <i
						class="icon-envelope"></i> podobri@gmail.com <br> <i class="icon-phone"></i> +359 888 999 911
				</p>
				<p class="social-links">
					<a href="http://facebook.com" target="_blank"> 
						<img alt="Facebook" src="${rootURL}/resources/images/social/fb.png" />
					</a> 
					<a href="http://twitter.com" target="_blank"> 
						<img alt="Twitter" src="${rootURL}/resources/images/social/twitter.png" />
					</a> 
					<a href="http://skype.com" target="_blank"> 
						<img alt="Skype" src="${rootURL}/resources/images/social/skype.png" />
					</a> 
					<a href="http://plus.google.com" target="_blank"> 
						<img alt="Google+" src="${rootURL}/resources/images/social/googleplus.png" />
					</a> 
					<a href="http://linkedin.com" target="_blank"> 
						<img alt="LinkedIn" src="${rootURL}/resources/images/social/linkedin.png" />
					</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="copyright" class="col-md-12">Podobri 2015 &copy; All rights reserved</div>
	</div>
</footer>
<script>
</script>
<script src="${resURL}/js/bootstrap.min.js"></script>
<script src="${resURL}/js/jquery.dataTables.js"></script>
<script src="${resURL}/js/jquery.isotope.min.js"></script>
<script src="${resURL}/js/jquery.prettyPhoto.js"></script>
<script src="${resURL}/js/jquery.flexisel.js"></script>
<script src="${resURL}/js/jquery.datetimepicker.js"></script>
<script src="${resURL}/js/main.js"></script>
<script src="${resURL}/js/chosen.jquery.min.js"></script>
<script src="${resURL}/js/verify.js"></script>