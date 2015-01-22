<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="/resources/images/" />
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content">
			<div id="eventViewFull" class="col-md-10">
				<div class="row">
					<div id="eventViewFullPicture">
						<div id="eventDate">25 Октомври</div>
						<div id="eventTime">14:00-16:00</div>
						<div id="eventApply">КАНДИДАТСТВАЙ</div>
						<div id="eventName">Организационни умения</div>
						<div id="eventTypeAndAddress">Семинар | София 9000, ул.Иван вазов 31-А</div>
					</div>
				</div>

				<div class="row">
					<div id="eventViewFullMenu" class="menuTabs">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#aboutEvent">За събитието</a></li>
							<li><a data-toggle="tab" href="#eventProgram">Програма</a></li>
							<li><a data-toggle="tab" href="#eventLectors">Лектори</a></li>
							<li><a data-toggle="tab" href="#eventOrganizator">Организатор</a></li>
						</ul>
					</div>
				</div>

				<div class="row">
					<div id="eventViewFullMenuContent" class="tab-content">

						<div id="aboutEvent" class="tab-pane fade in active">
							<p>
								<span>Изисквания към кандидатите: </span> няма
							</p>
							<p>
								<span>Разходи за събитието:</span> непоети
							</p>
							<p>
								<span>Организатор:</span> <u>Podobri</u>
							</p>
							<p>This is some sample text. This is some sample text.This is some sample text. This is some sample text.
								This is some sample text. This is some sample text.This is some sample text. This is some sample text. This is
								some sample text. This is some sample text.This is some sample text. This is some sample text. This is some
								sample text. This is some sample text. This is some sample text. This is some sample text.This is some sample
								text. This is some sample text. This is some sample text. This is some sample text.This is some sample text.
								This is some sample text. This is some sample text. This is some sample text.This is some sample text. This is
								some sample text. This is some sample text. This is some sample text. This is some sample text. This is some
								sample text.This is some sample text. This is some sample text. This is some sample text. This is some sample
								text.This is some sample text. This is some sample text. This is some sample text. This is some sample text.This
								is some sample text. This is some sample text. This is some sample text. This is some sample text.</p>
							<p>
								<span>Допълнителна информация:</span> Some sample text
							</p>
						</div>

						<div id="eventProgram" class="tab-pane fade">
							<div id="eventProgramContent">
								<p>
									<span>Програма</span>
								</p>
								<table class="table table-bordered table-striped">
									<thead>
										<tr>
											<th>Тема</th>
											<th>Начало</th>
											<th>Край</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Начало на семинара</td>
											<td>14:00</td>
											<td></td>
										</tr>
										<tr>
											<td>Some topic</td>
											<td>14:15</td>
											<td>15:00</td>
										</tr>
										<tr>
											<td>Почивка</td>
											<td>15:00</td>
											<td>15:15</td>
										</tr>
										<tr>
											<td>Some new topic after break</td>
											<td>15:15</td>
											<td>16:00</td>
										</tr>
										<tr>
											<td>Край на събитието(Почерпка)</td>
											<td>16:00</td>
											<td></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div id="eventProgramInfo">
								<p>
									<span>Допълнителна информация:</span>
								</p>
								<p>This is some sample text. This is some sample text.This is some sample text. This is some sample text.
									This is some sample text. This is some sample text.This is some sample text. This is some sample text. This is
									some sample text. This is some sample text.This is some sample text. This is some sample text. This is some
									sample text. This is some sample text.</p>
							</div>
						</div>

						<div id="eventLectors" class="tab-pane fade">
							<div id="lector1" class="eventLector">
								<div class="media">
									<a class="pull-left" href="#"> <?php echo $this->Html->image("team1_256x256.jpg"); ?>
									</a>
									<div class="media-body">
										<h4 class="media-heading">Стефан Иванов</h4>
										<h5>преподавател в СУ "Св.Климент Охридски</h5>
										<p>This is some sample text. This is some sample text.This is some sample text. This is some sample text.
											This is some sample text. This is some sample text.This is some sample text. This is some sample text.</p>
									</div>
								</div>
							</div>

							<div id="lector2" class="eventLector">
								<div class="media">
									<a class="pull-left" href="#"> <?php echo $this->Html->image("team2.jpg"); ?>
									</a>
									<div class="media-body">
										<h4 class="media-heading">Мирослава Пенева</h4>
										<h5>управител на "Wasd123" OOД</h5>
										<p>This is some sample text. This is some sample text.This is some sample text. This is some sample text.
											This is some sample text. This is some sample text.This is some sample text. This is some sample text.</p>
										<p>
											<span>личен блог:</span> <a href="#">somerandomblog.blogsport.com </a>
										</p>
									</div>
								</div>
							</div>

						</div>

						<div id="eventOrganizator" class="tab-pane fade">
							<p>
								<span>Организатор:</span> <u>Podobri</u>
							</p>
						</div>

					</div>
				</div>
			</div>
			<!-- End eventViewFull -->
			<jsp:include page="reklams.jsp" />
		</div>
		<!-- End main content -->
		<jsp:include page="footer.jsp" />
	</div>
	<!-- End container -->
</body>
</html>