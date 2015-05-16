
function makeAjaxCall(selector, path, event, targetSelector, textKey) {
	$('#' + selector).on(event, function() {
		var optionId = $(this).val();
		$.ajax({
			type : "GET",
			url : 'ajax/'+path + '/'+optionId,
			success : function(data) {
				makeOptionList(data, targetSelector, textKey);
			},
			error : function(e) {
				console.log('Error in ajax call')
			}
		}).done(function(data) {
			console.log('Ajax call finished');
		})
	});
};

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
jQuery( document ).ready(function($) {
	$('#main-slider.carousel').carousel({
		interval : 10000,
		pause : false
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

	$('[data-spy="scroll"]').each(function() {
		var $spy = $(this).scrollspy('refresh')
	})

	// PrettyPhoto
	$("a.preview").prettyPhoto({
		social_tools : false
	});

	// Isotope
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
	
	// FlexiSel
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


	$('#register-titles').find('div').click(function() {
		if (!$(this).hasClass('active')) {
			$(this).parent().find('div').toggleClass(
					'active inactive');
			$('.register-user-inputs, .register-company-inputs')
					.toggleClass('hide');
		}
	});
	
	$('.quick-search-find').find('span').on('click', function(){
		$(this).parents('form').submit();
	})
	
});
