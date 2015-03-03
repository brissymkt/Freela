yojs.define('OthsysUser.user.factors.edit', function(){
	yojs.call('OthsysUser.user.changesObserver');
	// Create slider input to existing factors
	yojs.call('OthsysUser.user.sliderSetup', 'sub-factor-importance', 'importance');
	yojs.call('OthsysUser.user.sliderSetup', 'situation', 'situation');

	yojs.call('OthsysUser.user.updateSliders', 'sub-factor-importance', 'importance');
	yojs.call('OthsysUser.user.updateSliders', 'situation', 'situation');

	yojs.call('OthsysUser.user.contractButton', 'sub-factors');
	yojs.call('OthsysUser.user.editButton', 'sub-factors');
	yojs.call('OthsysUser.user.placeboButton', 'sub-factors');

	//Function to add sliders. If slider exists, it will be updated. Otherwise, a slider will be created
	$('.sub-factors-container').on('cocoon:after-insert', function(e, insertedElement){
		$(insertedElement).find('.js-sub-factor-importance-slider').slider({ 
			value: $(this).parents('.importance-container').find('.js-importance-input').val(),
			min: 0,
			max: 10,
			step: 1,
			slide: function(event, ui) {
				$(this).parents('.importance-container').find('.js-importance-input').val(ui.value);
				$(this).parents('.importance-container').find('.js-slider-caption').html(ui.value);
			}
		});
		$(insertedElement).find('.js-situation-slider').slider({ 
			value: $(this).parents('.situation-container').find('.js-situation-input').val(),
			min: 0,
			max: 10,
			step: 1,
			slide: function(event, ui) {
				$(this).parents('.situation-container').find('.js-situation-input').val(ui.value);
				$(this).parents('.situation-container').find('.js-slider-caption').html(ui.value);
			}
		});
		yojs.call('OthsysUser.user.updateSliders', 'sub-factor-importance', 'importance');
		yojs.call('OthsysUser.user.updateSliders', 'situation', 'situation');
	});

});