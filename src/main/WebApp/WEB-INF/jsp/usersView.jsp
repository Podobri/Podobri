<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html">
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content" class="col-md-12">

			<div class="row">
				<div id="userProfilePage" class="col-md-9 col-md-offset-1">
					<div class="row">
						<div id="pageTitle" class="title center">Начална страница</div>
					</div>
					<div class="row">
						<div id="pageWelcome" class="center">
							<p>
							<h1>Здравейте, Speech Community Bulgaria
						</div>
					</div>
					<div clas s="row">
						<div id="notifications">
							<div class="notify center">
								<p>Новини и известия</p>
							</div>
							<div class="notify row">
								<div class="notify-left col-md-2 center">
									<a href=""> <img class="img-circle" alt=""
										src="${imgURL}/profile.png">
									</a>
								</div>
								<div class="notify-right col-md-10">
									<p>GuyWith Glasses следва страницата на организация</p>
									<p>
										<a href="">Вижте профила</a> на GuyWith Glasses
									</p>
								</div>
							</div>

							<div class="notify row">
								<div class="notify-left col-md-2 center">
									<a href=""> <img class="img-circle" alt=""
										src="${imgURL}/profile_exit.png">
									</a>
								</div>
								<div class="notify-right col-md-10">
									<p>Милен Иванов кандидатства за членство.</p>
									<p>
										<a href="">Изтеглете</a> апликационната форма на кандидата
									</p>
									<p>
										<a href="">Вижте профила</a> на Милен Иванов
									</p>
								</div>
							</div>

							<div class="notify row">
								<div class="notify-left col-md-2 center">
									<a href=""> <?php echo $this->Html->image("logo.png", array("alt" => "Part1", 'class' => 'img-circle')); ?>
									</a>
								</div>
								<div class="notify-right col-md-10">
									<p>13 потребители следват страницата на организацията.</p>
								</div>
							</div>

							<div class="notify row">
								<div class="notify-left col-md-2 center">
									<a href=""> <img class="img-circle" alt=""
										src="${imgURL}/register_user.png">
									</a>
								</div>
								<div class="notify-right col-md-10">
									<p>24 потребители са потвърили участието си за Семинар
										"Организационни умения".</p>
									<p>
										<a href="">Вижте събитието</a> "Организационни умения".
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div id="reklam" class="col-md-2">
					<div>Рекламирайте при нас</div>
					<div>Рекламирайте при нас</div>
					<div>Рекламирайте при нас</div>
					<div>Рекламирайте при нас</div>
					<div>Рекламирайте при нас</div>
					<div>Рекламирайте при нас</div>
				</div>
			</div>

		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>