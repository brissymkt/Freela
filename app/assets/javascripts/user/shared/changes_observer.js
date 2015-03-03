yojs.define('OthsysUser.user.changesObserver',function(){
	alertForChanges = false;

	$('.can-alert-changes').change(function(){
		alertForChanges = true;
	});

	$('.changes-observer').click(function(element){
		if (alertForChanges) {
			url = $(this).attr('href');
			bootbox.confirm({
				title: $('title').html(),
				message: $(this).attr('data-message'),
				buttons: {
					cancel: {
						label: $(this).attr('data-option-no')
					},
					confirm: {
						label: $(this).attr('data-option-yes')
					}
				},
				callback: function(result) {
					if (result) {
						window.location.href = url;
					}
				}
			});
			return false;
		}
	});
});