yojs.define('OthsysUser.user.changesObserver',function(containerName){
	alertForChanges = false;

	$('.'+containerName).on('keyup', '.can-alert-changes', function(){
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
	function goodbye(e) {
    if (alertForChanges) {
    	if(!e) e = window.event;
	    //e.cancelBubble is supported by IE - this will kill the bubbling process.
	    e.cancelBubble = true;
	    e.returnValue = $('body').attr('data-confirm-exit'); //This is displayed on the dialog

	    //e.stopPropagation works in Firefox.
	    if (e.stopPropagation) {
	        e.stopPropagation();
	        e.preventDefault();
	    }
	  }
	}
	window.onbeforeunload=goodbye; 
});