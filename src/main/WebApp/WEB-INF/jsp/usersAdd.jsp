<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content">
			<div class="popup_size">
				<div class="register">
					<fieldset>
						<div id="register_titles">
							<div class="register_user col-md-6 active">
								<span class="register_image"> <img alt="" src="imgURL/register_user.png">
								</span> <span class="register_text">User registration</span>
							</div>

							<div class="register_company col-md-6 inactive ">
								<span class="register_image"> <img alt="" src="imgURL/register_company.png">
								</span> <span class="register_text">Register Company</span>
							</div>
						</div>

						<div class="register_user_inputs">
							<form method="post" action="<c:url value='${pageContext.request.contextPath}/users/addIndividual' />">
								<div class="register_left">
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="username" placeholder="username" />
										</div>
										<div class="col-md-6 div-text">
											<span>Username hint</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="password" placeholder="password" type="password" />
										</div>
										<div class="col-md-6 div-text">
											<span>Password hint</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="password_confirm" placeholder="Confirm password" type="password" />
										</div>
										<div class="col-md-6 div-text">
											<span>Confirm password"</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="email" placeholder="email" />
										</div>
										<div class="col-md-6 div-text">
											<span>email</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="firstname" placeholder="firstname" />
										</div>
										<div class="col-md-6 div-text">
											<span>first name hint</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="lastname" placeholder="lastname" />
										</div>
										<div class="col-md-6 div-text">
											<span>last name hint</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="gender" placeholder="gender" />
										</div>
										<div class="col-md-6 div-text">
											<span>gender</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_gender" class="form-control" name="contact_gender">
												<option>Пол</option>
												<option value="f">Жена</option>
												<option value="m">Мъж</option>
											</select>
											<div class="col-md-6 div-text">
												<span>gender</span>
											</div>
										</div>
									</div>

									<div class="col-md-12 wr date-select">
										<div class="col-md-6 div-input">
											<input id="birthday" name="birthday" class="form-control datepicker margin-top-none" type="text"
												placeholder="23/9/2013">
										</div>
										<div class="col-md-6 div-text">
											<span>birthdate</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_contacttotype_contacttype" class="form-control" multiple=""
												name="contact_contacttotype_contacttype[]" style="display: none;">
												<option value="1">Продавач</option>
												<option value="2">Купувач</option>
												<option value="3">Наемодател</option>
												<option value="4">Наемател</option>
												<option value="5">Агенция</option>
												<option value="6">Брокер</option>
												<option value="7">Строител</option>
												<option value="8">Приятел</option>
												<option value="9">Упълномощител</option>
											</select>
											<div class="chosen-container chosen-container-multi chosen-with-drop chosen-container-active"
												style="width: 332px;" title="" id="contact_contacttotype_contacttype_chosen">
												<ul class="chosen-choices">
													<li class="search-field"><input type="text" value="Изберете едно или повече" class="default"
														autocomplete="off" style="width: 186px;"></li>
												</ul>
												<div class="chosen-drop">
													<ul class="chosen-results">
														<li class="active-result" style="" data-option-array-index="0">Продавач</li>
														<li class="active-result" style="" data-option-array-index="1">Купувач</li>
														<li class="active-result" style="" data-option-array-index="2">Наемодател</li>
														<li class="active-result" style="" data-option-array-index="3">Наемател</li>
														<li class="active-result" style="" data-option-array-index="4">Агенция</li>
														<li class="active-result" style="" data-option-array-index="5">Брокер</li>
														<li class="active-result" style="" data-option-array-index="6">Строител</li>
														<li class="active-result highlighted" style="" data-option-array-index="7">Приятел</li>
														<li class="active-result" style="" data-option-array-index="8">Упълномощител</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-6 div-text">
											<span>Country</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_contacttotype_contacttype" class="form-control" multiple=""
												name="contact_contacttotype_contacttype[]" style="display: none;">
												<option value="1">Продавач</option>
												<option value="2">Купувач</option>
												<option value="3">Наемодател</option>
												<option value="4">Наемател</option>
												<option value="5">Агенция</option>
												<option value="6">Брокер</option>
												<option value="7">Строител</option>
												<option value="8">Приятел</option>
												<option value="9">Упълномощител</option>
											</select>
											<div class="chosen-container chosen-container-multi chosen-with-drop chosen-container-active"
												style="width: 332px;" title="" id="contact_contacttotype_contacttype_chosen">
												<ul class="chosen-choices">
													<li class="search-field"><input type="text" value="Изберете едно или повече" class="default"
														autocomplete="off" style="width: 186px;"></li>
												</ul>
												<div class="chosen-drop">
													<ul class="chosen-results">
														<li class="active-result" style="" data-option-array-index="0">Продавач</li>
														<li class="active-result" style="" data-option-array-index="1">Купувач</li>
														<li class="active-result" style="" data-option-array-index="2">Наемодател</li>
														<li class="active-result" style="" data-option-array-index="3">Наемател</li>
														<li class="active-result" style="" data-option-array-index="4">Агенция</li>
														<li class="active-result" style="" data-option-array-index="5">Брокер</li>
														<li class="active-result" style="" data-option-array-index="6">Строител</li>
														<li class="active-result highlighted" style="" data-option-array-index="7">Приятел</li>
														<li class="active-result" style="" data-option-array-index="8">Упълномощител</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-6 div-text">
											<span>City</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_contacttotype_contacttype" class="form-control" multiple=""
												name="contact_contacttotype_contacttype[]" style="display: none;">
												<option value="1">Продавач</option>
												<option value="2">Купувач</option>
												<option value="3">Наемодател</option>
												<option value="4">Наемател</option>
												<option value="5">Агенция</option>
												<option value="6">Брокер</option>
												<option value="7">Строител</option>
												<option value="8">Приятел</option>
												<option value="9">Упълномощител</option>
											</select>
											<div class="chosen-container chosen-container-multi chosen-with-drop chosen-container-active"
												style="width: 332px;" title="" id="contact_contacttotype_contacttype_chosen">
												<ul class="chosen-choices">
													<li class="search-field"><input type="text" value="Изберете едно или повече" class="default"
														autocomplete="off" style="width: 186px;"></li>
												</ul>
												<div class="chosen-drop">
													<ul class="chosen-results">
														<li class="active-result" style="" data-option-array-index="0">Продавач</li>
														<li class="active-result" style="" data-option-array-index="1">Купувач</li>
														<li class="active-result" style="" data-option-array-index="2">Наемодател</li>
														<li class="active-result" style="" data-option-array-index="3">Наемател</li>
														<li class="active-result" style="" data-option-array-index="4">Агенция</li>
														<li class="active-result" style="" data-option-array-index="5">Брокер</li>
														<li class="active-result" style="" data-option-array-index="6">Строител</li>
														<li class="active-result highlighted" style="" data-option-array-index="7">Приятел</li>
														<li class="active-result" style="" data-option-array-index="8">Упълномощител</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-6 div-text">
											<span>Education</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_contacttotype_contacttype" class="form-control" multiple=""
												name="contact_contacttotype_contacttype[]" style="display: none;">
												<option value="1">Продавач</option>
												<option value="2">Купувач</option>
												<option value="3">Наемодател</option>
												<option value="4">Наемател</option>
												<option value="5">Агенция</option>
												<option value="6">Брокер</option>
												<option value="7">Строител</option>
												<option value="8">Приятел</option>
												<option value="9">Упълномощител</option>
											</select>
											<div class="chosen-container chosen-container-multi chosen-with-drop chosen-container-active"
												style="width: 332px;" title="" id="contact_contacttotype_contacttype_chosen">
												<ul class="chosen-choices">
													<li class="search-field"><input type="text" value="Изберете едно или повече" class="default"
														autocomplete="off" style="width: 186px;"></li>
												</ul>
												<div class="chosen-drop">
													<ul class="chosen-results">
														<li class="active-result" style="" data-option-array-index="0">Продавач</li>
														<li class="active-result" style="" data-option-array-index="1">Купувач</li>
														<li class="active-result" style="" data-option-array-index="2">Наемодател</li>
														<li class="active-result" style="" data-option-array-index="3">Наемател</li>
														<li class="active-result" style="" data-option-array-index="4">Агенция</li>
														<li class="active-result" style="" data-option-array-index="5">Брокер</li>
														<li class="active-result" style="" data-option-array-index="6">Строител</li>
														<li class="active-result highlighted" style="" data-option-array-index="7">Приятел</li>
														<li class="active-result" style="" data-option-array-index="8">Упълномощител</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-6 div-text">
											<span>Activities</span>
										</div>
									</div>

								</div>
								<button type="submit" class="btn">Register</button>
							</form>
						</div>


						<div class="register_company_inputs hide">
							<form id="orgForm" method="post"
								action="<c:url value='${pageContext.request.contextPath}/users/addOrganization' />">
								<div class="register_left">
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="username" placeholder="username" />
										</div>
										<div class="col-md-6 div-text">
											<span>Username hint</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="password" placeholder="password" type="password" />
										</div>
										<div class="col-md-6 div-text">
											<span>Password hint</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="password_confirm" placeholder="Confirm password" type="password" />
										</div>
										<div class="col-md-6 div-text">
											<span>Confirm password"</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="email" placeholder="email" />
										</div>
										<div class="col-md-6 div-text">
											<span>email</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="name" placeholder="name" />
										</div>
										<div class="col-md-6 div-text">
											<span>name</span>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="address" placeholder="address" />
										</div>
										<div class="col-md-6 div-text">
											<span>address</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<input id="address" placeholder="address" type="" />
										</div>
										<div class="col-md-6 div-text">
											<span>address</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_gender" class="form-control" name="contact_gender">
												<option>Пол</option>
												<option value="f">A</option>
												<option value="m">B</option>
												<option value="m">C</option>
												<option value="m">D</option>
											</select>
											<div class="col-md-6 div-text">
												<span>Organization type</span>
											</div>
										</div>
									</div>
									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_contacttotype_contacttype" class="form-control" multiple=""
												name="contact_contacttotype_contacttype[]" style="display: none;">
												<option value="1">Продавач</option>
												<option value="2">Купувач</option>
												<option value="3">Наемодател</option>
												<option value="4">Наемател</option>
												<option value="5">Агенция</option>
												<option value="6">Брокер</option>
												<option value="7">Строител</option>
												<option value="8">Приятел</option>
												<option value="9">Упълномощител</option>
											</select>
											<div class="chosen-container chosen-container-multi chosen-with-drop chosen-container-active"
												style="width: 332px;" title="" id="contact_contacttotype_contacttype_chosen">
												<ul class="chosen-choices">
													<li class="search-field"><input type="text" value="Изберете едно или повече" class="default"
														autocomplete="off" style="width: 186px;"></li>
												</ul>
												<div class="chosen-drop">
													<ul class="chosen-results">
														<li class="active-result" style="" data-option-array-index="0">Продавач</li>
														<li class="active-result" style="" data-option-array-index="1">Купувач</li>
														<li class="active-result" style="" data-option-array-index="2">Наемодател</li>
														<li class="active-result" style="" data-option-array-index="3">Наемател</li>
														<li class="active-result" style="" data-option-array-index="4">Агенция</li>
														<li class="active-result" style="" data-option-array-index="5">Брокер</li>
														<li class="active-result" style="" data-option-array-index="6">Строител</li>
														<li class="active-result highlighted" style="" data-option-array-index="7">Приятел</li>
														<li class="active-result" style="" data-option-array-index="8">Упълномощител</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-6 div-text">
											<span>Country</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_contacttotype_contacttype" class="form-control" multiple=""
												name="contact_contacttotype_contacttype[]" style="display: none;">
												<option value="1">Продавач</option>
												<option value="2">Купувач</option>
												<option value="3">Наемодател</option>
												<option value="4">Наемател</option>
												<option value="5">Агенция</option>
												<option value="6">Брокер</option>
												<option value="7">Строител</option>
												<option value="8">Приятел</option>
												<option value="9">Упълномощител</option>
											</select>
											<div class="chosen-container chosen-container-multi chosen-with-drop chosen-container-active"
												style="width: 332px;" title="" id="contact_contacttotype_contacttype_chosen">
												<ul class="chosen-choices">
													<li class="search-field"><input type="text" value="Изберете едно или повече" class="default"
														autocomplete="off" style="width: 186px;"></li>
												</ul>
												<div class="chosen-drop">
													<ul class="chosen-results">
														<li class="active-result" style="" data-option-array-index="0">Продавач</li>
														<li class="active-result" style="" data-option-array-index="1">Купувач</li>
														<li class="active-result" style="" data-option-array-index="2">Наемодател</li>
														<li class="active-result" style="" data-option-array-index="3">Наемател</li>
														<li class="active-result" style="" data-option-array-index="4">Агенция</li>
														<li class="active-result" style="" data-option-array-index="5">Брокер</li>
														<li class="active-result" style="" data-option-array-index="6">Строител</li>
														<li class="active-result highlighted" style="" data-option-array-index="7">Приятел</li>
														<li class="active-result" style="" data-option-array-index="8">Упълномощител</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-6 div-text">
											<span>City</span>
										</div>
									</div>

									<div class="col-md-12 wr">
										<div class="col-md-6 div-input">
											<select id="contact_contacttotype_contacttype" class="form-control" multiple=""
												name="contact_contacttotype_contacttype[]" style="display: none;">
												<option value="1">Продавач</option>
												<option value="2">Купувач</option>
												<option value="3">Наемодател</option>
												<option value="4">Наемател</option>
												<option value="5">Агенция</option>
												<option value="6">Брокер</option>
												<option value="7">Строител</option>
												<option value="8">Приятел</option>
												<option value="9">Упълномощител</option>
											</select>
											<div class="chosen-container chosen-container-multi chosen-with-drop chosen-container-active"
												style="width: 332px;" title="" id="contact_contacttotype_contacttype_chosen">
												<ul class="chosen-choices">
													<li class="search-field"><input type="text" value="Изберете едно или повече" class="default"
														autocomplete="off" style="width: 186px;"></li>
												</ul>
												<div class="chosen-drop">
													<ul class="chosen-results">
														<li class="active-result" style="" data-option-array-index="0">Продавач</li>
														<li class="active-result" style="" data-option-array-index="1">Купувач</li>
														<li class="active-result" style="" data-option-array-index="2">Наемодател</li>
														<li class="active-result" style="" data-option-array-index="3">Наемател</li>
														<li class="active-result" style="" data-option-array-index="4">Агенция</li>
														<li class="active-result" style="" data-option-array-index="5">Брокер</li>
														<li class="active-result" style="" data-option-array-index="6">Строител</li>
														<li class="active-result highlighted" style="" data-option-array-index="7">Приятел</li>
														<li class="active-result" style="" data-option-array-index="8">Упълномощител</li>
													</ul>
												</div>
											</div>
										</div>
										<div class="col-md-6 div-text">
											<span>Activities</span>
										</div>
									</div>
								</div>
								<?php echo $this->Form->end(__('register')); ?>
						</div>
						<textarea form="orgForm" name="desc" id="desc" rows="5" cols="80" wrap="soft"></textarea>
					</fieldset>
				</div>
			</div>
			<!-- INSERT MAIN CONTENT HERE -->
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>



<!-- <?php -->
<!-- //AJAX for Dynamic Drop down -->
<!-- //$this->Js->get('.country_id')->event('change',  -->
<!-- //    $this->Js->request(array( -->
<!-- //      'controller'=>'users', -->
<!-- //      'action' =>'getCitiesByCountries', -->
<!-- //    ), array( -->
<!-- //        'update' =>'.city_id', -->
<!-- //        'async' => true, -->
<!-- //        'method' => 'Post', -->
<!-- //        'dataExpression'=>true, -->
<!-- //        'data'=> $this->Js->serializeForm(array( -->
<!-- //        'isForm' => true, -->
<!-- //        'inline' => true -->
<!-- //      )) -->
<!-- //    )) -->
<!-- //); -->
<!-- // -->
<!-- //// END AJAX -->
<!-- ?> -->

<!-- <script> -->
<!-- // 	$(document).ready( -->
<!-- // 			function() { -->
<!-- // 				$(".country_id").bind( -->
<!-- // 						"change", -->
<!-- // 						function(event) { -->
<!-- // 							var $targetCity = $(this).parent().parent() -->
<!-- // 									.parent().find('.city_id'); -->
<!-- // 							var $data = "country_id=" + $(this).val(); -->

<!-- // 							$.ajax({ -->
<!-- // 								async : true, -->
<!-- // 								data : $data, -->
<!-- // 								dataType : "html", -->
<!-- // 								success : function(data, textStatus) { -->
<!-- // 									$targetCity.html(data); -->
<!-- // 								}, -->
<!-- // 								type : "Post", -->
<!-- // 								url : "\/Podobri\/users\/getCitiesByCountries" -->
<!-- // 							}); -->
<!-- // 							return false; -->

<!-- // 						}); -->
<!-- // 			}); -->
<!-- </script> -->


<!-- <option>---Изберете град---</option> -->
<?php foreach ($cities as $key => $value): ?>
<%-- <option value="<?php echo $key; ?>"><?php echo $value; ?></option> --%>
<?php endforeach; ?>