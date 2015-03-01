yojs.define('OthsysUser.user.editButton', function(containerName) {
	$('.'+containerName+'-container').on('click', '.edit-button', function() {
		if ($(this).parents('.text-inputs-container').hasClass('edit')) {
			$(this).parents('.text-inputs-container').removeClass('edit');
		} else {
			$(this).parents('.text-inputs-container').addClass('edit');
		}
		return false;
	});
	$('.'+containerName+'-container input').keyup(function() {
		$(this).parents('.othsys-input-hoverable').find('.placebo-button').addClass('js-input-touched');
	});
	
});