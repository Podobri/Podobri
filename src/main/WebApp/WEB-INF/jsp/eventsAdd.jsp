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
		</div> <!-- End main content -->
		<jsp:include page="footer.jsp" />
	</div> <!-- End container -->
</body>
</html>

<div class="event-add col-md-12">
  <div class="event-add-form col-md-8 col-md-offset-1">
    <div class="event-image-upload"></div>
    <div class="event-inputs register">
    <?php echo $this->Form->create('Event', array('inputDefaults' => array('label' => false, 'id' => false, 'div' => 'col-md-7 div-input'))); ?>
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('name', array('placeholder' => 'Заглавие')); ?>
        <div class="col-md-5 div-text"><span> 4-60 символа </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <div class="col-md-7 div-input">
          <?php echo $this->Form->textarea('description', array('rows' => 5, 'cols' => 20, 'placeholder' => 'Описание')); ?>
        </div>
        <div class="col-md-5 div-text"><span> Въведете описание на събитието, което ще се показва на основната страница </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('opportunity_categories_id', array('class' => 'opportunity_categories_id', 'empty' =>'---Категория---', 'options' =>$opportunityCategories)); ?>
        <div class="col-md-5 div-text"><span> Категория </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('opportunity_id', array('class' => 'opportunity_id', 'empty' =>'---Възможност---')); ?>
        <div class="col-md-5 div-text"><span> Възможност </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('country_id', array('class' => 'country_id', 'empty' =>'---Държава---', 'options' => $countries )); ?>
        <div class="col-md-5 div-text"><span> Изберете държава на пребиваване от падащото меню </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('city_id', array('class' => 'city_id', 'empty' =>'---Град---')); ?>
        <div class="col-md-5 div-text"><span> Изберете град от падащото меню(*Трябва да сте избрали държава) </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('address', array('placeholder' => 'Адрес')); ?>
        <div class="col-md-5 div-text"><span> Посочете адреса където ще се провежда събитието </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <div>
            <?php echo $this->Form->input("date_from", array('class' => 'datetimepicker','placeholder' => 'Дата и час', 'type' => 'text', 'error' => false, 'id' => 'date_from')); ?>
        </div>
        <div class="col-md-5 div-text">
          <span> Нaчало </span>
        </div>
      </div>
      
      <div class="col-md-12 wr">
        <div>
            <?php echo $this->Form->input("date_to", array('class' => 'datetimepicker', 'placeholder' => 'Дата и час', 'type' => 'text', 'error' => false, 'id' => 'date_from')); ?>
        </div>
        <div class="col-md-5 div-text">
          <span> Край </span>
        </div>
      </div>
      
      <div class="col-md-12 wr">
        <div>
            <?php echo $this->Form->input("deadline", array('class' => 'datetimepicker' , 'placeholder' => 'Дата и час', 'type' => 'text', 'error' => false, 'id' => 'date_from')); ?>
        </div>
        <div class="col-md-5 div-text">
          <span> След тази дата потребителите не могат да се записват </span>
        </div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('Activity',array('class' => 'directions', 'multiple' => 'multiple','options' =>array('Направления'=>$activities))); ?>
        <div class="col-md-5 div-text"><span> Посочете направления за събитието </span></div>
      </div>
          
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('event_cost_types_id', array('empty' =>'---Разходи---', 'options' =>$eventCostTypes)); ?>
        <div class="col-md-5 div-text"><span> Разходи </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('max_participants', array('placeholder' => 'Максимален брой участници', 
                                                            'type' => 'number', 'min' => '0', 'max' => '200', 'default' => '1')); ?>
        <div class="col-md-5 div-text"><span> Посочете максимален брой участници в събитието </span></div>
      </div>
        
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('additional_info', array('placeholder' => 'Допълнителна информация')); ?>
        <div class="col-md-5 div-text"><span> Допълнителна информация </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('website', array('placeholder' => 'Уеб сайт')); ?>
        <div class="col-md-5 div-text"><span> Уеб сайт </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('facebook', array('placeholder' => 'facebook')); ?>
        <div class="col-md-5 div-text"><span> facebook </span></div>
      </div>
      
      <div class="col-md-12 wr cb">
        <?php echo $this->Form->checkbox('recruit_coorganizators', array('id' => 'recruitCoorganizators')) ?>
        <label for="recruitCoorganizators"> Набира съорганизатори </label>
      </div>
      
      <div class="col-md-12 wr cb">
        <?php echo $this->Form->checkbox('applicationFormRequire', array('id' => 'applicationFormRequire')) ?>
        <label for="applicationFormRequire"> Изисква се форма за кандидатстване/CV </label>
      </div>

      
      <h3 class="col-md-12 wr programTitle"> Програма на събитието <hr /></h3>
      
      <div class="schedule">
          <div class="col-md-8 wr">
            <?php echo $this->Form->input('EventsProgram.0.subject', array('type' => 'text', 'placeholder' => 'Тема', 'div' => false)); ?>
          </div>
          <div class="col-md-2 wr">
            <?php echo $this->Form->input('EventsProgram.0.date_from', array('type' => 'text', 'placeholder' => 'Начало', 'div' => false)); ?>
          </div>
          <div class="col-md-2 wr">
            <?php echo $this->Form->input('EventsProgram.0.date_to', array('type' => 'text', 'placeholder' => 'Край', 'div' => false)); ?>
          </div>
        <div class="col-md-12 wr">
          <div class="col-md-12 div-input">
            <?php echo $this->Form->textarea('EventsProgram.0.information', array('rows' => 3, 'cols' => 30, 'placeholder' => 'Информация')); ?>
          </div>
        </div>
      </div>
      <div class="col-md-12 wr p15">
        <span class="addElement">Добави елемент...</span>
      </div>
      
      <h3 class="col-md-12 wr lectorsTitle"> Лектори на събитието <hr /></h3>
      
      <div class="lector">
        <div class="col-md-4 wr">
          <?php echo $this->Form->input('Lector.0.first_name', array('placeholder' => 'Име', 'div' => false)); ?>
        </div>
        <div class="col-md-4 wr">
          <?php echo $this->Form->input('Lector.0.last_name', array('placeholder' => 'Фамилия', 'div' => false)); ?>
        </div>
        <div class="col-md-4 wr">
          <?php echo $this->Form->input('Lector.0.job', array('placeholder' => 'Длъжност', 'div' => false)); ?>
        </div>
        <div class="col-md-12 wr">
          <div class="col-md-7 lectorDesc">
            <?php echo $this->Form->textarea('Lector.0.information', array('rows' => 3, 'cols' => 30, 'placeholder' => 'Информация', 'div' => false)); ?>
          </div>
          <div class="col-md-4">
            <?php echo $this->Form->file('Lector.0.picture', array('placeholder' => 'Снимка', 'div' => false)); ?>
          </div> 
        </div>
      </div>
      
      <div class="col-md-12 wr p15">
        <span class="addElement">Добави лектор...</span>
      </div>
      
      <h3 class="col-md-12 wr sponsorsTitle"> Спонсори на събитието <hr /></h3>
      
      <div class="sponsor">
        <div class="col-md-12 wr">
          <?php echo $this->Form->input('Sponsor.0.name', array('placeholder' => 'Наименование', 'div' => false)); ?>
        </div>
        <div class="col-md-12 wr">
          <?php echo $this->Form->file('Sponsor.0.picture', array('placeholder' => 'Снимка', 'div' => false)); ?>
        </div> 
      </div>
      
      <div class="col-md-12 wr p15">
        <span class="addElement">Добави спонсор...</span>
      </div>
      <?php echo $this->Form->end('Създай събитие'); ?>
    </div>
  </div>

  <div class="ads col-md-3">
    <div>Рекламирайте при нас</div>
    <div>Рекламирайте при нас</div>
    <div>Рекламирайте при нас</div>
  </div>

</div>

<script>
  $(document).ready(function() {
    $(".country_id").bind("change", function(event) {
      var $targetCity = $(this).parent().parent().parent().find('.city_id');
      var $data = "country_id=" + $(this).val();

      $.ajax({
        async: true,
        data: $data,
        dataType: "html",
        success: function(data, textStatus) 
        {
          $targetCity.html(data);
        },
        type: "Post", url: "\/Podobri\/events\/getCitiesByCountries"
      });
      return false;
    });
    
    $(".opportunity_categories_id").bind("change", function (event) {
      var $targetOpportunity = $(this).parent().parent().parent().find('.opportunity_id');
      var $data = "opportunity_categories_id="+$(this).val();
 
      $.ajax({
        async:true, 
        data: $data, 
        dataType:"html", 
        success:function (data, textStatus) 
        {
          $targetOpportunity.html(data);
        }, 
        type:"Post", url:"\/Podobri\/events\/getOpportunitiesByCategory"
      });
      return false;
    });
  });

  $('.addElement').on('click', function() {
    $divNewElement = $(this).parent('div').prev();
    $new = $divNewElement.toHtmlString();
    $(this).parent('div').before($new);
  });

  jQuery.fn.toHtmlString = function() {
    return $('<div></div>').html($(this).clone()).html();
  };
</script>
<script>
 $(document).ready(function () {
     var lang = '<?php echo $this->Session->read('Config.language'); ?>';
     console.log(lang);
    jQuery('.datetimepicker').datetimepicker({
      lang: lang,
      i18n: {
        bul: {
          months: [
            'Януари', 'Февруари', 'Март', 'Април',
            'Май', 'Юни', 'Юли', 'Авгус',
            'Септември', 'Октомври', 'Ноември', 'Декември',
          ],
          dayOfWeek: [
            "Нед", "Пон", "Втор", "Ср",
            "Четв", "Пет", "Съб.",
          ]
        },
        eng: {
          months: [
              'January', 'February', 'March', 'April', 'May', 'June',
	      'July', 'August', 'September', 'October', 'November', 'December'
          ],
          dayOfWeek: ['Su','Mo','Tu','We','Th','Fr','Sa']
        }
      },
      value: '<?php echo __('choose date'); ?>',
      defaultDate: new Date(),
      format: 'd/m/Y H:i',
    });
  });
  </script>
  
  <option>---Изберете град---</option>
 <?php foreach ($cities as $key => $value): ?>
 <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
 <?php endforeach; ?>
 
 <option>---Възможност---</option>
 <?php foreach ($opportunities as $key => $value): ?>
 <option value="<?php echo $key; ?>"><?php echo $value; ?></option>
 <?php endforeach; ?>