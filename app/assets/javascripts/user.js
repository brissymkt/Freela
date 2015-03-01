$(document).ready(function() {
	$('.button-submit').click(function() {
		$(this).parents("form").submit();
	});

	$('.left-menu-item').hover(function() {
		$(this).find(".icon, .caption").addClass("js-white-color");
		return false;
	}, function() {
		$(this).find(".icon, .caption").removeClass("js-white-color");
		return false;
	});


	$('.js-normal').mouseover(function(){
		$(this).parents('.form-button').addClass('selected');
	});
	$('.js-selected').mouseout(function(){
		$(this).parents('.form-button').removeClass('selected');
	});

	$('.js-exclusion-button').click(function(element) {
		url = element.target.href;
		bootbox.confirm({
			title: $('title').html(),
			message: $(this).attr('data-message'),
			buttons: {
				cancel: {
					label: $(this).attr('data-no')
				},
				confirm: {
					label: $(this).attr('data-yes')
				}
			},
			callback: function(result) {
				if (result) {
					window.location.href = url;
				}
			}
		});
		return false;
	});
	alertForChanges = false;

	$('.can-alert-changes').change(function(){
		alertForChanges = true;
	});

	$('.changes-observer').click(function(element){
		if (alertForChanges) {
			url = element.target.href;
			bootbox.confirm({
				title: $('title').html(),
				message: $(this).attr('data-message'),
				buttons: {
					cancel: {
						label: $(this).attr('data-option-no')
					},
					confirm: {
						label: $(this).attr('data-option-yes')
					}
				},
				callback: function(result) {
					if (result) {
						window.location.href = url;
					}
				}
			});
			return false;
		}
	});
});