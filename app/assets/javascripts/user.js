$(document).ready(function() {
	$('.js_submit_button').click(function() {
		$(this).parents("form").submit();
	});

	$('.left_menu_item').hover(function() {
		$(this).find(".glyphicon, .caption").addClass("js_white_color");
		return false;
	}, function() {
		$(this).find(".glyphicon, .caption").removeClass("js_white_color");
		return false;
	});
});