$(document).ready(function(){
	// Create slider input to existing factors
	$('.js-sub-factor-importance-slider').slider({
		value: $(this).parents('.importance-container').find('.js-importance-input').val(),
		min: 0,
		max: 10,
		step: 1,
		slide: function(event, ui) {
			$(this).parents('.importance-container').find('.js-importance-input').val(ui.value);
			$(this).parents('.importance-container').find('.js-slider-caption').html(ui.value);
		}
	});

	$('.js-situation-slider').slider({
		value: $(this).parents('.situation-container').find('.js-importance-input').val(),
		min: 0,
		max: 10,
		step: 1,
		slide: function(event, ui) {
			$(this).parents('.situation-container').find('.js-situation-input').val(ui.value);
			$(this).parents('.situation-container').find('.js-slider-caption').html(ui.value);
		}
	});

	updateSliders();

	//Function to add sliders. If slider exists, it will be updated. Otherwise, a slider will be greated
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
		updateSliders();
	});

	//Update sliders with values stored in database
	function updateSliders() {
		$('.js-sub-factor-importance-slider').each(function(){
			$(this).slider('option', 'value', $(this).parents('.importance-container').find('.js-importance-input').val());
			$(this).parents('.importance-container').find('.js-slider-caption').html($(this).slider('value'));
		});
		$('.js-situation-slider').each(function(){
			$(this).slider('option', 'value', $(this).parents('.situation-container').find('.js-situation-input').val());
			$(this).parents('.situation-container').find('.js-slider-caption').html($(this).slider('value'));
		});
	}


	$('.sub-factors-container').on('click', '.contract-button', function() {
		if ($(this).hasClass('fa-chevron-down')) {
			$(this).removeClass('fa-chevron-down');
			$(this).addClass('fa-chevron-up');
			$(this).parents('.text-inputs-container').addClass('expanded');
		} else {
			$(this).removeClass('fa-chevron-up');
			$(this).addClass('fa-chevron-down');
			$(this).parents('.text-inputs-container').removeClass('expanded');
		}
	});



	$('.sub-factors-container').on('click', '.edit-button', function() {
		if ($(this).parents('.text-inputs-container').hasClass('edit')) {
			$(this).parents('.text-inputs-container').removeClass('edit');
		} else {
			$(this).parents('.text-inputs-container').addClass('edit');
		}
	});

	$('.sub-factors-container input').keyup(function() {
		$(this).parents('.othsys-input-hoverable').find('.placebo-button').addClass('js-input-touched');
	});

	$('.sub-factors-container .placebo-button').click(function() {
		var newName = $(this).parents('.text-inputs-container').find('.js-name-input').val();
		console.log(newName);
		$(this).removeClass('js-input-touched');
		$(this).parents('.text-inputs-container').removeClass('edit');
		$(this).parents('.text-inputs-container').find('.sub-factor-name-display').html(newName);
	});

	$('.sub-factors-container').on('click', '.placebo-button', function() {
		var temporaryName = $(this).parents('.text-inputs-container').find('.js-name-input').val();
		$(this).addClass('submitted');
		$(this).parents('.text-inputs-container').find('input').addClass('hidden');
		$(this).parents('.text-inputs-container').find('.only-inputs-box').addClass('compacted-box');
		$(this).parents('.text-inputs-container').find('.sub-factor-name-display').html(temporaryName);
	});
});