<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="rootURL" value="/" />
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
			<div class="col-md-3 col-md-offset-1">
				<h4>За "По-добри"</h4>
				<p>
					Създадена през 2014 организацията, Sapien augue lobortis nunc, in vehicula ante ante vitae orci. Sed euismod,
					tellus quis commodo suscipit, nisl erat vulputate nunc, aliquam viverra elit nibh a urna. Donec diam lacus, mollis
					sit amet porttitor sed, blandit at lectus. <a href="#">Read more</a>
				</p>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<h4>НОВИНИ И АБОНАМЕНТ</h4>
				<p>Абонирайте се за новини и нови събития</p>
				<form name="SubscibeEmail" action="Subscribe">
					<input id="emailForSubscribe" type="text" placeholder="Email" /> <input id="subscibe" type="submit"
						value="Subscibe" />
				</form>
			</div>
			<div class="col-md-3 col-md-offset-1">
				<h4>СВЪРЖЕТЕ СЕ С НАС</h4>
				<p>
					Сдружение "По-добри"<br> <i class="icon-map-marker"></i> ул. Васил Левски 21, София 1000 <br> <i
						class="icon-envelope"></i> podobri@gmail.com <br> <i class="icon-phone"></i> +359 888 999 911
				</p>
				<p class="social-links">
					<a href="http://facebook.com" target="_blank"> <img alt="Facebook"
						src="${rootURL}/resources/images/social/fb.png" />
					</a> <a href="http://twitter.com" target="_blank"> <img alt="Twitter"
						src="${rootURL}/resources/images/social/twitter.png" />
					</a> <a href="http://skype.com" target="_blank"> <img alt="Skype"
						src="${rootURL}/resources/images/social/skype.png" />
					</a> <a href="http://plus.google.com" target="_blank"> <img alt="Google+"
						src="${rootURL}/resources/images/social/googleplus.png" />
					</a> <a href="http://linkedin.com" target="_blank"> <img alt="LinkedIn"
						src="${rootURL}/resources/images/social/linkedin.png" />
					</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div id="copyright" class="col-md-12">Podobri 2015 &copy; All rights reserved</div>
	</div>
</footer>
