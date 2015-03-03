yojs.define('OthsysUser.user.environmental_analyses.index', function() {
	$('.clickable').click(function(element) {
		if (!$(element.target).hasClass('js-exclusion-button')) {
			window.location.href = $(this).find('.js-link-to-edit').attr('href');
		}
	});
});