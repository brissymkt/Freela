yojs.define('OthsysUser.user.placeboButton', function(containerName){
	$('.'+containerName+'-container .placebo-button').click(function() {
		var newName = $(this).parents('.text-inputs-container').find('.js-name-input').val();
		$(this).removeClass('js-input-touched');
		$(this).parents('.text-inputs-container').removeClass('edit');
		$(this).parents('.text-inputs-container').find('.name-display').html(newName);
		if ($(this).parents('.text-inputs-container').find('.js-description-input').val() != '') {
			$(this).parents('.text-inputs-container').find('.description-display').html($(this).parents('.text-inputs-container').find('.js-description-input').val());
		}
		return false;
	});

	$('.'+containerName+'-container').on('click', '.placebo-button', function() {
		var temporaryName = $(this).parents('.text-inputs-container').find('.js-name-input').val();
		$(this).addClass('submitted');
		$(this).parents('.text-inputs-container').find('input, .edit-button').addClass('hidden');
		$(this).parents('.text-inputs-container').find('.only-inputs-box').addClass('compacted-box');
		$(this).parents('.text-inputs-container').find('.name-display').html(temporaryName);
		return false;
	});
	
});