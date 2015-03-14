yojs.define('OthsysUser.user.editButton', function(containerName) {
	$('.'+containerName+'-container').on('click', '.edit-button', function() {
		if ($(this).parents('.text-inputs-container').hasClass('edit')) {
			$(this).parents('.text-inputs-container').removeClass('edit');
			$(this).parents('.text-inputs-container').find('.name-display').show();
			$(this).parents('.text-inputs-container').find('.description-display').show();
		} else {
			$(this).parents('.text-inputs-container').addClass('edit');
			$(this).parents('.text-inputs-container').find('.name-display').hide();
			$(this).parents('.text-inputs-container').find('.description-display').hide();
		}
		return false;
	});
	$('.'+containerName+'-container input,'+'.'+containerName+'-container textarea').keyup(function() {
		$(this).parents('.othsys-input-hoverable').find('.placebo-button').addClass('js-input-touched');
		$(this).parents('.othsys-input-hoverable').find('.edit-button').hide();
	});
	
});