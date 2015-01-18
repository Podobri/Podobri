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
        <?php echo $this->Form->input('name', array('placeholder' => __('title'))); ?>
        <div class="col-md-5 div-text"><span> 4-60 <?php echo __('symbols');?> </span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('country_id', array('class' => 'country_id', 'empty' => __('country'), 'options' => $countries )); ?>
        <div class="col-md-5 div-text"><span><?php echo __('country hint');?></span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('city_id', array('class' => 'city_id', 'empty' => __('city'))); ?>
        <div class="col-md-5 div-text"><span><?php echo __('city hint');?></span></div>
      </div>
      
      <div class="col-md-12 wr">
        <div>
            <?php echo $this->Form->input("date_from", array('class' => 'datetimepicker','placeholder' => 'Дата и час', 'type' => 'text', 'error' => false, 'id' => 'date_from')); ?>
        </div>
        <div class="col-md-5 div-text">
          <span><?php echo __('start');?></span>
        </div>
      </div>
        
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('made_for', array('placeholder' => __('made_for'))); ?>
        <div class="col-md-5 div-text"><span><?php echo __('made_for'); ?></span></div>
      </div>
      
      <div class="col-md-12 wr">
        <?php echo $this->Form->input('organizators', array('placeholder' => __('organizators'))); ?>
        <div class="col-md-5 div-text"><span><?php echo __('organizators'); ?></span></div>
      </div>
      
      <div class="col-md-12 wr">
        <div class="col-md-7 div-input">
          <?php echo $this->Form->textarea('description', array('rows' => 5, 'cols' => 20, 'placeholder' => __('desc'))); ?>
        </div>
        <div class="col-md-5 div-text"><span><?php echo __('desc'); ?></span></div>
      </div>
      
      <h3 class="col-md-12 wr programTitle"><?php echo __('event_program'); ?><hr /></h3>
      
      <div class="schedule">
          <div class="col-md-8 wr">
            <?php echo $this->Form->input('EventsProgram.0.subject', array('type' => 'text', 'placeholder' => __('subject'), 'div' => false)); ?>
          </div>
          <div class="col-md-2 wr">
            <?php echo $this->Form->input('EventsProgram.0.date_from', array('type' => 'text', 'class' => 'date-timepicker-start', 'placeholder' => __('start'), 'div' => false)); ?>
          </div>
          <div class="col-md-2 wr">
            <?php echo $this->Form->input('EventsProgram.0.date_to', array('type' => 'text',  'class' => 'date-timepicker-end', 'placeholder' => __('end'), 'div' => false)); ?>
          </div>
        <div class="col-md-12 wr">
          <div class="col-md-12 div-input">
            <?php echo $this->Form->textarea('EventsProgram.0.information', array('rows' => 3, 'cols' => 30, 'placeholder' => __('info'))); ?>
          </div>
        </div>
      </div>
      <div class="col-md-12 wr p15">
        <span class="addElement"><?php echo __('add_element');?></span>
      </div>
      <?php echo $this->Form->end(__('create_initiative')); ?>
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
    var a = $divNewElement.find('input');
    var name = a.attr('name');
    var stringName = name.replace('data[EventsProgram][', "").substring(0,1);
    var intName = parseInt(stringName);
    var newIntName = intName+1;
    var oldNumber = 'data[EventsProgram]['+stringName;
    var newNumber = 'data[EventsProgram]['+newIntName;
    var oldName = $divNewElement.find('input').attr('name');
    var newName = name.replace(oldNumber,newNumber);
    $divNewElement.find('input').attr('name',newName);
    $new = $divNewElement.toHtmlString();
    $divNewElement.find('input').attr('name',oldName);
    $('.schedule').last().after($new);
  });

  jQuery.fn.toHtmlString = function() {
    return $('<div></div>').html($(this).clone()).html();
  };
</script>
<script>
 $(document).ready(function () {
     var langugage = '<?php echo $this->Session->read('Config.language'); ?>';
     lang = (langugage)? langugage : 'bg';
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

<script>
//Range between too datetimepickers
jQuery(function(){
 jQuery('.date-timepicker-start').datetimepicker({
  format:'Y/m/d',
  onShow:function( ct ){
   this.setOptions({
    maxDate:jQuery('.date-timepicker-end').val()?jQuery('.date-timepicker-end').val():false
   })
  },
  timepicker:false
 });
 jQuery('.date-timepicker-end').datetimepicker({
  format:'Y/m/d',
  onShow:function( ct ){
   this.setOptions({
    minDate:jQuery('.date-timepicker-start').val()?jQuery('.date-timepicker-start').val():false
   })
  },
  timepicker:false
 });
});
</script>