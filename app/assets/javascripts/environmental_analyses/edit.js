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
		console.log('link to factors page');
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
	});

	$('.factors-container').on('click', '.edit-button', function() {
		if ($(this).parents('.text-inputs-container').hasClass('edit')) {
			$(this).parents('.text-inputs-container').removeClass('edit');
		} else {
			$(this).parents('.text-inputs-container').addClass('edit');
		}
	});
});