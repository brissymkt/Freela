yojs.define('OthsysUser.user.contractButton', function(containerName) {
	$('.'+containerName+'-container').on('click', '.contract-button', function() {
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
});