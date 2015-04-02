yojs.define('OthsysUser.user.sliderSetup', function(sliderName, variableName) {
	$('.js-'+sliderName+'-slider').slider({
		value: $(this).parents('.'+variableName+'-container').find('.js-'+variableName+'-input').val(),
		min: 0,
		max: 10,
		step: 1,
		slide: function(event, ui) {
			$(this).parents('.'+variableName+'-container').find('.js-'+variableName+'-input').val(ui.value);
			$(this).parents('.'+variableName+'-container').find('.js-slider-caption').html(ui.value);
			alertForChanges = true;
			if (!hasShownUpdateMessage) {
				hasShownUpdateMessage = true;
				$('.outdated-container').toggle();
				$('.up-to-date-container').toggle();
			}
		}
	});
});
yojs.define('OthsysUser.user.updateSliders', function(sliderName, variableName) {
	$('.js-'+sliderName+'-slider').each(function(){
		$(this).slider('option', 'value', $(this).parents('.'+variableName+'-container').find('.js-'+variableName+'-input').val());
		$(this).parents('.'+variableName+'-container').find('.js-slider-caption').html($(this).slider('value'));
	});
});
