$(document).ready(function(){
	// Create slider input to existing factors
	$('.js-slider').slider({
		value: $(this).parents('.importance-container').find('.js-importance-input').val(),
		min: 0,
		max: 10,
		step: 1,
		slide: function(event, ui) {
			$(this).parents('.importance-container').find('.js-importance-input').val(ui.value);
			$(this).parents('.importance-container').find('.js-slider-caption').html(ui.value);
		}
	});

	updateSliders();

	$('.factors-container').on('click', '.row.with-text', function(){
		window.location.href = $(this).find('.js-link-to-factor').attr('href');
	});

	$('.factors-container input, .factors-container .placebo-button').click(function() {
		return false;
	});

	$('.factors-container input').change(function() {
		$(this).parents('.othsys-input-hoverable').find('.placebo-button').addClass('js-input-touched');
	});

	$('.factors-container .placebo-button').click(function() {
		var newName = $(this).parents('.text-inputs-container').find('.js-name-input').val();
		$(this).removeClass('js-input-touched');
		$(this).parents('.text-inputs-container').removeClass('edit');
		$(this).parents('.text-inputs-container').find('.factor-name-display').html(newName);
	});

	$('.factors-container').on('click', '.placebo-button', function() {
		var temporaryName = $(this).parents('.text-inputs-container').find('.js-name-input').val();
		$(this).addClass('submitted');
		$(this).parents('.text-inputs-container').find('input').addClass('hidden');
		$(this).parents('.text-inputs-container').find('.only-inputs-box').addClass('compacted-box');
		$(this).parents('.text-inputs-container').find('.factor-name-display').html(temporaryName);
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
		updateSliders();
	});

	//Update sliders with values stored in database
	function updateSliders() {
		$('.js-slider').each(function(){
			$(this).slider('option', 'value', $(this).parents('.importance-container').find('.js-importance-input').val());
			$(this).parents('.importance-container').find('.js-slider-caption').html($(this).slider('value'));
		});
	}

	// composed input's behavior
	$('.factors-container').on('click', '.contract-button', function() {
		if ($(this).hasClass('fa-chevron-down')) {
			$(this).removeClass('fa-chevron-down');
			$(this).addClass('fa-chevron-up');
			$(this).parents('.text-inputs-container').addClass('expanded');
		} else {
			$(this).removeClass('fa-chevron-up');
			$(this).addClass('fa-chevron-down');
			$(this).parents('.text-inputs-container').removeClass('expanded');
		}
		return false;
	});

	$('.factors-container').on('click', '.edit-button', function() {
		if ($(this).parents('.text-inputs-container').hasClass('edit')) {
			$(this).parents('.text-inputs-container').removeClass('edit');
		} else {
			$(this).parents('.text-inputs-container').addClass('edit');
		}
		return false;
	});
});