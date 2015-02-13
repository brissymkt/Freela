$(document).ready(function(){
	// Create slider input to existing factors
	$('.js_slider').slider({
		value: $(this).parents('.importance_container').find('.js_importance_input').val(),
		min: 0,
		max: 10,
		step: 1,
		slide: function(event, ui) {
			$(this).parents('.importance_container').find('.js_importance_input').val(ui.value);
			$(this).parents('.importance_container').find('.js_slider_caption').html(ui.value);
		}
	});

	updateSliders();

	//Function to add sliders. If slider exists, it will be updated. Otherwise, a slider will be greated
	$('.factors_container').on('cocoon:after-insert', function(e, insertedElement){
		$(insertedElement).find('.js_slider').slider({ 
			value: $(this).parents('.importance_container').find('.js_importance_input').val(),
			min: 0,
			max: 10,
			step: 1,
			slide: function(event, ui) {
				$(this).parents('.importance_container').find('.js_importance_input').val(ui.value);
				$(this).parents('.importance_container').find('.js_slider_caption').html(ui.value);
			}
		});
		updateSliders();
	});

	//Update sliders with values stored in database
	function updateSliders() {
		$('.js_slider').each(function(){
			$(this).slider('option', 'value', $(this).parents('.importance_container').find('.js_importance_input').val());
			$(this).parents('.importance_container').find('.js_slider_caption').html($(this).slider('value'));
		});
	}
});