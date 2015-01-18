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

<div id="events" class="container">
  <div class="row">
    <div id="actual-events-label" class="col-md-10">
      <h2><?php echo __('actual events'); ?></h2> <hr />

      <!-- FILTER -->
      <div class="row">
        <div id="eventsFilter" class="col-md-12">
          <div class="panel-group" id="accordion">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#accordion" href="#eventsFilterPanel">
                    <?php echo __('filter'); ?> &nbsp<span class="glyphicon glyphicon-chevron-down"></span>
                  </a>
                </h4>
              </div>
              <div id="eventsFilterPanel" class="panel-collapse collapse">
                <div class="panel-body">
                  <div class="container">
                    <div class="row">
                      <div class="col-md-4 wr">
                        <span> <?php echo __('category'); ?></span>
                        <?php echo $this->Form->input('opportunity_categories_id', array('label' => false, 'class' => 'opportunity_categories_id', 'empty' => __('category'), 'options' => $opportunityCategories)); ?>
                      </div>

                      <div class="col-md-4 wr">
                        <span> <?php echo __('opportunity'); ?></span>
                        <?php echo $this->Form->input('opportunity_id', array('label' => false, 'class' => 'opportunity_id', 'empty' => __('opportunities'))); ?>
                      </div>

                      <div class="col-md-4 wr">
                        <span> <?php echo __('activity') ?></span>
                        <?php echo $this->Form->input('Activity', array('label' => false, 'class' => 'directions', 'multiple' => 'multiple', 'size' => '6', 'options' => array(__('activities') => $activities))); ?>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-4 wr">
                        <span> <?php echo __('start'); ?> </span>
                        <?php echo $this->Form->input("date_from", array('label' => false, 'class' => 'datetimepicker', 'placeholder' => 'Дата и час', 'type' => 'text', 'error' => false, 'id' => 'date_from')); ?>
                      </div>

                      <div class="col-md-4 wr">
                        <span> <?php echo __('end'); ?> </span>
                        <?php echo $this->Form->input("deadline", array('label' => false, 'class' => 'datetimepicker', 'placeholder' => 'Дата и час', 'type' => 'text', 'error' => false, 'id' => 'date_from')); ?>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6 wr">
                        <span> <?php echo __('country'); ?> </span>
                        <?php echo $this->Form->input('country_id', array('label' => false, 'class' => 'country_id', 'empty' => __('country'), 'options' => $countries)); ?>
                      </div>

                      <div class="col-md-6 wr">
                        <span> <?php echo __('city'); ?> </span>
                        <?php echo $this->Form->input('city_id', array('label' => false, 'class' => 'city_id', 'empty' => __('city'))); ?>
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-4 wr">
                        <span> <?php echo __('finance'); ?> </span>
                        <?php echo $this->Form->input('event_cost_types_id', array('label' => false, 'empty' => __('expences'), 'options' => $eventCostTypes)); ?>
                      </div>

                      <div class="col-md-8 wr">
                        <button type="button" class="btn btn-primary btn-lg">
                          <span class="glyphicon glyphicon-search"></span> <?php echo __('search'); ?>
                        </button>
                      </div>
                    </div>

                  </div>

                </div>
              </div>
            </div>
          </div>
        </div> <!-- END OF FILTER -->
      </div>

      <div class="row">
        <div class="col-md-12 eventItem">
          <div class="media">
            <div class="eventPicture pull-left">
                 <a data-toggle="modal" data-target = "#eventView" href="">
                     <?php echo $this->Html->image("team1_256x256.jpg"); ?>
              </a>
            </div>
            <div class="media-body caption">
              <h4 class="media-heading">Subject</h4>
              <hr />
              <p> 
                This is some sample text. This is some sample text. <br />
                This is some sample text. This is some sample text.
              </p>
              <hr />
              <p> <span>Event category | event opportunity</span> </p>
              <p>
                <span><?php echo $this->Html->image("thumblines/calendar_24x24.png", array("alt" => "date")); ?> 6 юни</span>
                <span><?php echo $this->Html->image("thumblines/location_24x24.png", array("alt" => "location")); ?> София</span>
                <span><?php echo $this->Html->image("thumblines/views.png", array("alt" => "views")); ?> 44</span>
                <span><?php echo $this->Html->image("thumblines/time_24x24.png", array("alt" => "views")); ?> 14:00</span>
              </p>
              <p> <span> Organizator: TU-Sofia </span>> </p>
            </div>
          </div>
        </div>
      </div>

      <div class="row">
        <div class="col-md-12 eventItem">
          <div class="media">
            <a class="pull-left" href="events/view/1">
              <?php echo $this->Html->image("team1_256x256.jpg"); ?>
            </a>
            <div class="media-body caption">
              <h4 class="media-heading">Subject</h4>
              <p> 
                This is some sample text. This is some sample text. <br />
                This is some sample text. This is some sample text. <br />
                This is some sample text. This is some sample text.
              </p>
              <hr />
              <p> <a>Event category | event opportunity</a> </p>
              <p>
                <span>
                  <?php echo $this->Html->image("thumblines/calendar_24x24.png", array("alt" => "date")); ?> 
                  6 юни
                </span>
                <span>
                  <?php echo $this->Html->image("thumblines/location_24x24.png", array("alt" => "location")); ?> 
                  София
                </span>
                <span>
                  <?php echo $this->Html->image("thumblines/views.png", array("alt" => "views")); ?> 
                  44
                </span>
                <span>
                  <?php echo $this->Html->image("thumblines/time_24x24.png", array("alt" => "views")); ?> 
                  14:00
                </span>
              </p>
              <p> <a> Organizator: TU-Sofia </a> </p>
            </div>
          </div>
        </div>
      </div>


      <!-- MODAL FOR EVERY ITEM -->
      <div class="modal fade col-md-12" id="eventView" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true"> <!-- <?php echo h($event['id']); ?> -->
        <div class="modal-dialog modal-wide70">
          <div class="modal-content col-md-10">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
              <h3>Спортуването като начин на живот</h3> <!-- <?php echo h($event['name']); ?> -->
            </div>
            <div class="modal-body">
              <div class="container">
                <div class="row">
                  <div id="EventViewPictureSection">
                    <a href="#x" class="thumbnail"> <?php echo $this->Html->image("team1.jpg", array("alt" => "Part1")); ?></a>
                  </div>
                </div>
                <div class="row">
                  <div class="EventViewMainInfo">
                    <?php echo $this->Html->image("thumblines/location_24x24.png", array("alt" => "location")); ?>  Варна, бул.Генерал Колев 45
                    <?php echo $this->Html->image("thumblines/calendar_24x24.png", array("alt" => "date")); ?> 15 май 2014
                    <?php echo $this->Html->image("thumblines/time_24x24.png", array("alt" => "views")); ?> 14:00-17:00
                    <?php echo $this->Html->image("thumblines/views.png", array("alt" => "views")); ?> 110
                  </div>
                </div>
                <div class="row">
                  <div class="EventViewShortDescription col-md-7">
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.This is some sample text. This is some sample text.
                    This is some sample text. This is some sample text.
                  </div>
                  <div class="EventViewMoreInfo col-md-5">
                    <div class="EventViewOrganizator col-md-12">
                      <p><h4> ОРГАНИЗАТОР: </h4></p><!-- <?php echo __('ORGANIZATOR_LABEL'); ?> -->
                      <p> ADM Bulgaria </p> <!-- <?php echo h($event['User']['name']); ?> -->
                    </div>
                    <div class="EventViewIntendedFor col-md-12">
                      <p><h4> ПРЕДНАЗНАЧЕНО ЗА: </h4></p> <!-- <?php echo __('INTENDED_FOR_LABEL'); ?> -->
                      <p> sportisti, uchenici, atlelti, deputati, text, text, text </p>
                    </div>
                    <div class="EventViewSocial col-md-12 social-links">
                      <?php echo $this->Html->image("thumblines/fb_32.png", array("alt" => "views")); ?>
                      <?php echo $this->Html->image("thumblines/twitter_32.png", array("alt" => "views")); ?>
                      <?php echo $this->Html->image("thumblines/linkedin_32.png", array("alt" => "views")); ?>
                      <?php echo $this->Html->image("thumblines/google_32.png", array("alt" => "views")); ?>
                      <?php echo $this->Html->image("thumblines/skype_32.png", array("alt" => "views")); ?>
                    </div>
                    <div class="EventViewFullDescription col-md-12">
                      <button type="button" class="btn btn-primary btn-lg">
                        ПЪЛНО ОПИСАНИЕ<!-- <?php __('EVENT_VIEW_FULL_DESC'); ?> -->
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div> <!-- END OF MODAL -->

      <div class="pagination">
        <ul class="pagination">
          <li class="disabled"><a href="#">&laquo;</a></li>
          <?php
          echo $this->Paginator->numbers(array('separator' => '', 'class' => 'pagination'));
          ?>
          <li class="disabled"><a href="#">&raquo;</a></li>
        </ul>

      </div>

    </div>  <!-- actual-events -->
    <div class="col-md-2 reklam">
      <div>Рекламирайте при нас</div>
      <div>Рекламирайте при нас</div>
      <div>Рекламирайте при нас</div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-12 actions">
      <h3><?php echo __('Actions'); ?></h3>
      <ul>
        <li><?php echo $this->Html->link(__('New Event'), array('action' => 'add')); ?></li>
      </ul>
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
        success: function (data, textStatus)
        {
          $targetCity.html(data);
        },
        type: "Post", url: "\/Podobri\/events\/getCitiesByCountries"
      });
      return false;
    });

    $(".opportunity_categories_id").bind("change", function (event) {
      var $targetOpportunity = $(this).parent().parent().parent().find('.opportunity_id');
      var $data = "opportunity_categories_id=" + $(this).val();

      $.ajax({
        async: true,
        data: $data,
        dataType: "html",
        success: function (data, textStatus)
        {
          $targetOpportunity.html(data);
        },
        type: "Post", url: "\/Podobri\/events\/getOpportunitiesByCategory"
      });
      return false;
    });
  });

  function toggleChevron(e) {
    $(e.target)
            .prev('.panel-heading')
            .find("span")
            .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
  }
  $('#accordion').on('hidden.bs.collapse', toggleChevron);
  $('#accordion').on('shown.bs.collapse', toggleChevron);
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
          dayOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
        }
      },
      value: '<?php echo __('choose date'); ?>',
      defaultDate: new Date(),
      format: 'd/m/Y H:i',
    });
  });
</script>