<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="imgURL" value="resources/images/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp" />
<body>
	<div class="container">
		<jsp:include page="menu.jsp" />
		<div id="content" class="col-md-12">
		<!-- INSERT MAIN CONTENT HERE -->
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>

<div class="container">
  <div class="row">

    <form role="form">
      <div class="form-group">
        <label for="exampleInputEmail1">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
      </div>
      <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
      </div>
      <div class="form-group">
        <label for="exampleInputFile">File input</label>
        <input type="file" id="exampleInputFile">
        <p class="help-block">Example block-level help text here.</p>
      </div>
      <div class="checkbox">
        <label>
          <input type="checkbox"> Check me out
        </label>
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>

    <div id="editUser" class="col-md-8 center">
      <?php echo $this->Form->create('User', array('inputDefaults' => array('label' => false, 'id' => false), 'role' => 'form', 'class' => 'form-horizontal')); ?>
      <fieldset>
        <legend><?php echo __('Edit User'); ?></legend>

        <div class="form-group">
          <label for="InputUsername" class="col-md-4 control-label">Username</label>
          <div class="col-md-8">
            <?php echo $this->Form->input('username', array('id' => 'InputUsername', 'class' => 'form-control', 'placeholder' => 'Enter username', 'disabled' => 'disabled')); ?>
          </div>
        </div>
        
        <div class="form-group">
          <label for="InputEmail" class="col-md-4 control-label">Email address</label>
          <div class="col-md-8">
            <?php echo $this->Form->input('email', array('id' => 'InputEmail', 'class' => 'form-control', 'type' => 'email', 'placeholder' => 'Enter email')); ?>
          </div>
        </div>
        
        <div class="form-group">
          <label for="InputPassword" class="col-md-4 control-label">Password</label>
          <div class="col-md-8">
            <?php echo $this->Form->input('password', array('id' => 'InputPassword', 'class' => 'form-control', 'type' => 'password', 'placeholder' => 'Enter password', 'default' => '')); ?>
          </div>
        </div>
        
        <div class="form-group">
          <label for="InputPasswordConfirm" class="col-md-4 control-label">Password confirm</label>
          <div class="col-md-8">
            <?php echo $this->Form->input('password_confirm', array('id' => 'InputPasswordConfirm', 'class' => 'form-control', 'type' => 'password', 'placeholder' => 'Enter password again', 'default' => '')); ?>
          </div>
        </div>

        <div class="col-md-12 wr">
          <div class="col-md-6 div-input">
            <?php echo $this->Form->input('email', array('placeholder' => __('email'))); ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('email hint') ?>
            </span>
          </div>
        </div>

        <div class="col-md-12 wr">
          <div class="col-md-6 div-input">
            <?php echo $this->Form->input('Individual.0.first_name', array('placeholder' => __('name'))); ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('first name hint') ?>
            </span>
          </div>
        </div>

        <div class="col-md-12 wr">
          <div class="col-md-6 div-input">
            <?php echo $this->Form->radio('Individual.0.gender', array((int) 1 => __('male'), (int) 2 => __('female')), array('legend' => __('i am'))); ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('gender hint') ?>
            </span>
          </div>
        </div>

        <div class="col-md-12 wr date-select">
          <div class="col-md-6 div-input">
            <?php
            echo $this->Form->input('Individual.0.birthdate', array(
                'type' => 'date',
                'dateFormat' => 'DMY',
                'empty' => array('month' => __('month'), 'day' => __('day'), 'year' => __('year')),
                'minYear' => date('Y') - 150,
                'maxYear' => date('Y') - 13,
                'options' => array('1', '2')
            ));
            ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('birthdate hint') ?>
            </span>
          </div>
        </div>

        <div class="col-md-12 wr">
          <div class="col-md-6 div-input">
            <?php echo $this->Form->input('UserInfo.0.country_id', array('class' => 'country_id', 'empty' => __('country'), 'options' => $countries)); ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('country hint') ?>
            </span>
          </div>
        </div>

        <div class="col-md-12 wr">
          <div class="col-md-6 div-input">
            <?php echo $this->Form->input('UserInfo.0.city_id', array('class' => 'city_id', 'empty' => __('city'))); ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('city hint') ?>
            </span>
          </div>
        </div>

        <div class="col-md-12 wr">
          <div class="col-md-6 div-input">
            <?php echo $this->Form->input('Individual.0.education_id', array('id' => 'education_id', 'empty' => __('education'), 'options' => $educations)); ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('education hint') ?>
            </span>
          </div>
        </div>

        <div class="col-md-12 wr">
          <div class="col-md-6 div-input">
            <?php echo $this->Form->input('Activity', array('multiple' => 'multiple', 'options' => array(__('interests') => $activities))); ?>
          </div>
          <div class="col-md-6 div-text">
            <span>
              <?php __('interests hint') ?>
            </span>
          </div>
        </div>

      </fieldset>
      <?php echo $this->Form->end(__('Submit')); ?>
    </div>
  </div>
</div>
<script>

  $(document).ready(function () {
    $(".country_id").bind("change", function (event) {
      var $targetCity = $(this).parent().parent().parent().find('.city_id');
      var $data = "country_id=" + $(this).val();

      $.ajax({
        async: true,
        data: $data,
        dataType: "html",
        success: function (data, textStatus) {
          $targetCity.html(data);
        },
        type: "Post", url: "\/Podobri\/users\/getCitiesByCountries"
      });
      return false;

    });
  });

</script>
