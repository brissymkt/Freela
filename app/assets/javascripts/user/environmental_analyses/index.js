yojs.define('OthsysUser.user.environmental_analyses.index', function() {
	$('.clickable').click(function(element) {
		if (!$(element.target).hasClass('js-exclusion-button')) {
			window.location.href = $(this).find('.js-link-to-edit').attr('href');
		}
	});
	$('.js-exclusion-button').click(function(element) {
		url = element.target.href;
		bootbox.confirm({
			title: $('title').html(),
			message: $(this).attr('data-message'),
			buttons: {
				cancel: {
					label: $(this).attr('data-no')
				},
				confirm: {
					label: $(this).attr('data-yes')
				}
			},
			callback: function(result) {
				if (result) {
					window.location.href = url;
				}
			}
		});
		return false;
	});
});