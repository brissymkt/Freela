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
});