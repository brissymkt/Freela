$(document).ready(function() {
	$('.button_submit').click(function() {
		$(this).parents("form").submit();
	});

	$('.left_menu_item').hover(function() {
		$(this).find(".icon, .caption").addClass("js_white_color");
		return false;
	}, function() {
		$(this).find(".icon, .caption").removeClass("js_white_color");
		return false;
	});

	$('.factors_container').on('click', '.contract_button', function() {
		if ($(this).hasClass('glyphicon-arrow-down')) {
			$(this).removeClass('glyphicon-arrow-down');
			$(this).addClass('glyphicon-arrow-up');
			$(this).parents('.factor_text_inputs_container').addClass('expanded');
		} else {
			$(this).removeClass('glyphicon-arrow-up');
			$(this).addClass('glyphicon-arrow-down');
			$(this).parents('.factor_text_inputs_container').removeClass('expanded');
		}
	});

	$('.factors_container').on('click', '.edit_button', function() {
		if ($(this).parents('.factor_text_inputs_container').hasClass('edit')) {
			$(this).parents('.factor_text_inputs_container').removeClass('edit');
		} else {
			$(this).parents('.factor_text_inputs_container').addClass('edit');
		}
	});

	$('.js_normal').mouseover(function(){
		$(this).parents('.form_button').addClass('selected');
	});
	$('.js_selected').mouseout(function(){
		$(this).parents('.form_button').removeClass('selected');
	});
});