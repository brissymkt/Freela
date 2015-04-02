yojs.define('OthsysUser.user.environmental_analyses.edit', function() {
	yojs.call('OthsysUser.user.changesObserver', 'factors-container');
	// Create slider input to existing factors
	yojs.call('OthsysUser.user.sliderSetup', 'importance', 'importance');

	yojs.call('OthsysUser.user.updateSliders', 'importance', 'importance');

	yojs.call('OthsysUser.user.contractButton', 'factors');
	yojs.call('OthsysUser.user.editButton', 'factors');
	yojs.call('OthsysUser.user.placeboButton', 'factors');

	hasShownUpdateMessage = yojs.get('shouldUpdate');

	$('.factors-container').on('click', '.row.with-text', function(element){
		if (!$(element.target).hasClass('my-button') && !$(element.target).hasClass('can-alert-changes') && !$(element.target).hasClass('hidden-delete-button')) {
			if (alertForChanges) {
				url = $(this).find('.js-link-to-factor').attr('href');
				bootbox.confirm({
					title: $('title').html(),
					message: $(this).find('.js-link-to-factor').attr('data-message'),
					buttons: {
						cancel: {
							label: $(this).find('.js-link-to-factor').attr('data-option-no')
						},
						confirm: {
							label: $(this).find('.js-link-to-factor').attr('data-option-yes')
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
		}
	});

	
	$('.factors-container').on('change', '.js-importance-input', function() {
		if (!hasShownUpdateMessage) {
			hasShownUpdateMessage = true;
			$('.outdated-container').toggle();
			$('.up-to-date-container').toggle();
		}
	});

	$('.refresh-button').click(function() {
		$('form').submit();
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