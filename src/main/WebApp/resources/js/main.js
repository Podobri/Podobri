jQuery(function($) {

	$(function() {
		$('#main-slider.carousel').carousel({
			interval : 10000,
			pause : false
		});
	});

	// Ajax contact
	var form = $('.contact-form');
	form.submit(function() {
		$this = $(this);
		$.post($(this).attr('action'), function(data) {
			$this.prev().text(data.message).fadeIn().delay(3000).fadeOut();
		}, 'json');
		return false;
	});

	// smooth scroll
	/*
	 * 
	 * $('.navbar-nav > li').click(function(event) { event.preventDefault(); var
	 * target = $(this).find('>a').prop('hash'); $('html, body').animate({
	 * scrollTop: $(target).offset().top }, 500); });
	 */
	// scrollspy
	$('[data-spy="scroll"]').each(function() {
		var $spy = $(this).scrollspy('refresh')
	})

	// PrettyPhoto
	$("a.preview").prettyPhoto({
		social_tools : false
	});

	// Isotope
	$(window).load(function() {
		$portfolio = $('.portfolio-items');
		$portfolio.isotope({
			itemSelector : 'li',
			layoutMode : 'fitRows'
		});
		$portfolio_selectors = $('.portfolio-filter >li>a');
		$portfolio_selectors.on('click', function() {
			$portfolio_selectors.removeClass('active');
			$(this).addClass('active');
			var selector = $(this).attr('data-filter');
			$portfolio.isotope({
				filter : selector
			});
			return false;
		});
	});
});

$(document).ready(function() {
	$("#flexisel").flexisel({
		visibleItems : 5,
		animationSpeed : 1000,
		autoPlay : true,
		autoPlaySpeed : 3000,
		pauseOnHover : true,
		enableResponsiveBreakpoints : true,
		responsiveBreakpoints : {
			portrait : {
				changePoint : 480,
				visibleItems : 1
			},
			landscape : {
				changePoint : 640,
				visibleItems : 2
			},
			tablet : {
				changePoint : 768,
				visibleItems : 3
			}
		}
	});
});

$(document).ready(
		function() {
			$('#register_titles').find('div').click(
					function() {
						if (!$(this).hasClass('active')) {
							$(this).parent().find('div').toggleClass(
									'active inactive');
							$('.register_user_inputs,.register_company_inputs')
									.toggleClass('hide');

						}
					});
			$('#activitiesCompany').next('div').css('width', "100%");
		});

// $(document).ready(function setTagsManager(id) {
// var container = id + 'container';
// $('#' + id).tagsManager({
// tagsContainer : '#' + container,
// hiddenTagListName : '#' + id,
// tagClass : 'tm-tag-info',
// preventSubmitOnEnter : true
// });
// });
function makeAjaxCall(selector, path, event, targetSelector, textKey) {
	$('#' + selector).on(event, function() {
		var optionId = $(this).val();
		$.ajax({
			type : "GET",
			url : 'ajax/'+path + '/'+optionId,
			success : function(response) {
				console.log('Success');
			},
			error : function(e) {
				alert('Error: ' + e);
			}
		}).done(function(data) {
			makeOptionList(data, targetSelector, textKey);
		})
	});
}

function makeOptionList(data, selector, textKey) {
	if (!data) {
		data = [ {
			"id" : -1,
			textKey : "Няма намерени резултати"
		} ];
	}
	if (data) {
		$('#' + selector).html('');
		$.each(data, function(index, item) {
			$('#' + selector).append(
					$('<option></option>').text(item[textKey]).val(item.id));
		});
	}
}
