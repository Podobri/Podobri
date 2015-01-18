<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<div id="calendar-container">
		<div class="center">
			<p>Календар на събитията през този месец.</p>
		</div>

<!-- 	<div class="row"> -->
		<div id="calendar">
			<div class="cal-left col-md-7">
				<div class="row">
					<div class="cal-header">
						<div class="cal-title">
							<span>НОЕМВРИ 2013</span>
							<div class="cal-month-buttons">
								<a href="#"> </a> <a href="#"> </a>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="cal-weekdays">
						<div class="col-md-1">П</div>
						<div class="col-md-1">В</div>
						<div class="col-md-1">С</div>
						<div class="col-md-1">Ч</div>
						<div class="col-md-1">П</div>
						<div class="col-md-1">С</div>
						<div class="col-md-1">Н</div>
					</div>
				</div>

				<div class="row">
					<!-- Six rows are pretty much enough to display all months, from 28 to up to 31 days -->
					<div class="days">
						<div class="cal-row">

							<!-- Class "cal-event" is set only when the number of events in the circle is != 0 0-->

							<!-- Classes "cal-past-month" and "cal-next-month" should be called upon presenting
                  the past and upcoming months. (a.k.a months != than the current month) -->

							<!-- Classes "cal-event-past" and "cal-event-next" are used upon presenting the 
                  events number for the past or next month. "cal-event" is used for the current month -->

							<div class="col-md-1 cal-item cal-past-month">
								<div>28</div>
								<div class="cal-event-past">
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-past-month">
								<div>29</div>
								<div class="cal-event-past">
									<span>3</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-past-month">
								<div>30</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-past-month">
								<div>31</div>
								<div class="cal-event-past">
									<span>4</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>1</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>2</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>3</div>
								<div>
									<span>0</span>
								</div>
							</div>
						</div>

						<div class="cal-row">
							<div class="col-md-1 cal-item">
								<div>4</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>5</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>6</div>
								<div class="cal-event">
									<span>1</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>7</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>8</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>9</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>10</div>
								<div>
									<span>0</span>
								</div>
							</div>
						</div>

						<div class="cal-row">
							<div class="col-md-1 cal-item">
								<div>12</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>13</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-today">
								<div>14</div>
								<div class="cal-event">
									<span>3</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>15</div>
								<div class="cal-event">
									<span>19</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>16</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>17</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>18</div>
								<div>
									<span>0</span>
								</div>
							</div>
						</div>

						<div class="cal-row">
							<div class="col-md-1 cal-item">
								<div>19</div>
								<div class="cal-event">
									<span>1</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>20</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>21</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>22</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>23</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>24</div>
								<div class="cal-event">
									<span>5</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>25</div>
								<div class="cal-event">
									<span>7</span>
								</div>
							</div>
						</div>

						<div class="cal-row">
							<div class="col-md-1 cal-item">
								<div>26</div>
								<div class="cal-event">
									<span>1</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>27</div>
								<div class="cal-event">
									<span>1</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>28</div>
								<div class="cal-event">
									<span>4</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>29</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>30</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item">
								<div>31</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-next-month">
								<div>1</div>
								<div>
									<span>0</span>
								</div>
							</div>
						</div>

						<div class="cal-row">
							<div class="col-md-1 cal-item cal-next-month">
								<div>2</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-next-month">
								<div>3</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-next-month">
								<div>4</div>
								<div class="cal-event-next">
									<span>2</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-next-month">
								<div>5</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-next-month">
								<div>6</div>
								<div class="cal-event-next">
									<span>12</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-next-month">
								<div>7</div>
								<div>
									<span>0</span>
								</div>
							</div>
							<div class="col-md-1 cal-item cal-next-month">
								<div>8</div>
								<div>
									<span>0</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END cal-left -->

			<div class="cal-right col-md-5">
				<div class="row">
					<div class="cal-date-info">
						<div id="cal-event-date" class="col-md-4">
							<div>Сряда</div>
							<div>14</div>
						</div>
						<div id="cal-events-stat" class="col-md-8">
							<div>
								<span>42</span> събития
							</div>
							<div>този месец</div>
							<div>
								<span>3</span> събития днес
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="cal-events-list-container">
						<div class="cal-browse-event">
							<div class="col-md-3">
								<a href=""><img class="cal-event-image" src="${imgURL}/img1.jpg" /></a>
							</div>
							<div class="col-md-8">
								<div class="row">
									<div class="bold col-md-12">
										<a href="#">Научна среща - представяне на...</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										Конференция от <a href="#" class="bold">ArtTech Ltd</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<img alt="location" src="${imgURL}/thumblines/location_16x16.png" />Варна, бул. Симеон Велики 21
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div>
											<img alt="time" src="${imgURL}/thumblines/time_16x16.png" /> 14:00-18:00 &nbsp;
										</div>
										<div>
											<img alt="views" src="${imgURL}/thumblines/views_16x16.png" /> 72
										</div>
									</div>

								</div>
							</div>
						</div>

						<div class="cal-browse-event">
							<div class="col-md-3">
								<a href=""><img class="cal-event-image" src="${imgURL}/img1.jpg" /></a>
							</div>
							<div class="col-md-8">
								<div class="row">
									<div class="bold col-md-12">
										<a href="#">Българските университети ...</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										Конференция от <a href="#" class="bold">Университет за националн...</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<img alt="location" src="${imgURL}/thumblines/location_16x16.png" />София, бул. Цар Освободител 48
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div>
											<img alt="time" src="${imgURL}/thumblines/time_16x16.png" /> 14:00-18:00 &nbsp;
										</div>
										<div>
											<img alt="views" src="${imgURL}/thumblines/views_16x16.png" /> 55
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="cal-browse-event">
							<div class="col-md-3">
								<a href=""><img class="cal-event-image" src="${imgURL}/img1.jpg" /></a>
							</div>
							<div class="col-md-8">
								<div class="row">
									<div class="bold col-md-12">
										<a href="#">Future of IT Education Abroad</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										Форум от <a href="#" class="bold">Microsoft България</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<img alt="location" src="${imgURL}/thumblines/location_16x16.png" />София, бул. Цар Освободител 16
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div>
											<img alt="time" src="${imgURL}/thumblines/time_16x16.png" /> 14:00-18:00 &nbsp;
										</div>
										<div>
											<img alt="views" src="${imgURL}/thumblines/views_16x16.png" /> 150
										</div>
									</div>

								</div>
							</div>
						</div>

						<div class="cal-browse-event">
							<div class="col-md-3">
								<a href=""><img class="cal-event-image" src="${imgURL}/img1.jpg" /></a>
							</div>
							<div class="col-md-8">
								<!--<div class="cal-right-side-wrapper">-->
								<div class="row">
									<div class="bold col-md-12">
										<a href="#">Научна среща - представяне на...</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										Конференция от <a href="#" class="bold">ArtTech Ltd</a>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<img alt="location" src="${imgURL}/thumblines/location_16x16.png" />Варна, бул. Симеон Велики 21
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div>
											<img alt="time" src="${imgURL}/thumblines/time_16x16.png" /> 14:00-18:00 &nbsp;
										</div>
										<div>
											<img alt="views" src="${imgURL}/thumblines/views_16x16.png" /> 72
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			<!-- END cal-right -->
		</div>
		<!-- END calendar -->
<!-- 	</div> -->
</div>