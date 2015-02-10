$(document).ready(function(){
	// Create slider input to existing factors
	$('.js_importance_slider').slider({
		value: $(this).parents('.importance_container').find('.js_importance_input').val(),
		min: 1,
		max: 10,
		step: 1,
		slide: function(event, ui) {
			$(this).parents('.importance_container').find('.js_importance_input').val(ui.value);
			$(this).parents('.importance_container').find('.js_slider_caption').html(ui.value);
		}
	});

	$('.js_situation_slider').slider({
		value: $(this).parents('.situation_container').find('.js_importance_input').val(),
		min: 1,
		max: 10,
		step: 1,
		slide: function(event, ui) {
			$(this).parents('.situation_container').find('.js_situation_input').val(ui.value);
			$(this).parents('.situation_container').find('.js_slider_caption').html(ui.value);
		}
	});

	updateSliders();

	//Function to add sliders. If slider exists, it will be updated. Otherwise, a slider will be greated
	$('.sub_factors_container').on('cocoon:after-insert', function(e, insertedElement){
		$(insertedElement).find('.js_importance_slider').slider({ 
			value: $(this).parents('.importance_container').find('.js_importance_input').val(),
			min: 1,
			max: 10,
			step: 1,
			slide: function(event, ui) {
				$(this).parents('.importance_container').find('.js_importance_input').val(ui.value);
				$(this).parents('.importance_container').find('.js_slider_caption').html(ui.value);
			}
		});
		$(insertedElement).find('.js_situation_slider').slider({ 
			value: $(this).parents('.situation_container').find('.js_situation_input').val(),
			min: 1,
			max: 10,
			step: 1,
			slide: function(event, ui) {
				$(this).parents('.situation_container').find('.js_situation_input').val(ui.value);
				$(this).parents('.situation_container').find('.js_slider_caption').html(ui.value);
			}
		});
		updateSliders();
	});

	//Update sliders with values stored in database
	function updateSliders() {
		$('.js_importance_slider').each(function(){
			$(this).slider('option', 'value', $(this).parents('.importance_container').find('.js_importance_input').val());
			$(this).parents('.importance_container').find('.js_slider_caption').html($(this).slider('value'));
		});
		$('.js_situation_slider').each(function(){
			$(this).slider('option', 'value', $(this).parents('.situation_container').find('.js_situation_input').val());
			$(this).parents('.situation_container').find('.js_slider_caption').html($(this).slider('value'));
		});
	}


	$('.sub_factors_container').on('click', '.contract_button', function() {
		console.log('started');
		if ($(this).hasClass('fa-chevron-down')) {
			console.log('change to up');
			$(this).removeClass('fa-chevron-down');
			$(this).addClass('fa-chevron-up');
			$(this).parents('.sub_factor_text_inputs_container').addClass('expanded');
		} else {
			console.log('change to down');
			$(this).removeClass('fa-chevron-up');
			$(this).addClass('fa-chevron-down');
			$(this).parents('.sub_factor_text_inputs_container').removeClass('expanded');
		}
	});



	$('.sub_factors_container').on('click', '.edit_button', function() {
		if ($(this).parents('.sub_factor_text_inputs_container').hasClass('edit')) {
			$(this).parents('.sub_factor_text_inputs_container').removeClass('edit');
		} else {
			$(this).parents('.sub_factor_text_inputs_container').addClass('edit');
		}
	});
});