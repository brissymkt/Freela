yojs.define('OthsysUser.user.environmental_analyses.edit', function() {
	yojs.call('OthsysUser.user.changesObserver', 'factors-container');
	// Create slider input to existing factors
	yojs.call('OthsysUser.user.sliderSetup', 'importance', 'importance');

	yojs.call('OthsysUser.user.updateSliders', 'importance', 'importance');

	yojs.call('OthsysUser.user.contractButton', 'factors');
	yojs.call('OthsysUser.user.editButton', 'factors');
	yojs.call('OthsysUser.user.placeboButton', 'factors');


	$('.factors-container').on('click', '.row.with-text', function(element){
		if (!$(element.target).hasClass('my-button') && !$(element.target).hasClass('can-alert-changes') && !$(element.target).hasClass('hidden-delete-button')) {
			window.location.href = $(this).find('.js-link-to-factor').attr('href');
		}
	});

	$('.factors-container input, .factors-container .placebo-button').click(function() {
		return false;
	});

	$('.js-remove-button').click(function(event) {
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
			callback: function(hasToBeDeleted) {
				if (hasToBeDeleted) {
					$(event.target).siblings('.hidden-delete-button').click();
				}
			}
		});
	});

	//Function to add sliders. If slider exists, it will be updated. Otherwise, a slider will be greated
	$('.factors-container').on('cocoon:after-insert', function(e, insertedElement){
		$(insertedElement).find('.js-slider').slider({ 
			value: $(this).parents('.importance-container').find('.js-importance-input').val(),
			min: 0,
			max: 10,
			step: 1,
			slide: function(event, ui) {
				$(this).parents('.importance-container').find('.js-importance-input').val(ui.value);
				$(this).parents('.importance-container').find('.js-slider-caption').html(ui.value);
			}
		});
		yojs.call('OthsysUser.user.updateSliders', 'importance', 'importance');
	});

});