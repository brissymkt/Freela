yojs.define('OthsysUser.user.environmental_analyses.new', function() {
	var today = new Date();
	if ($('body').attr('data-locale') == 'pt-BR') {
		$('.js-datepicker').each(function(){
				yojs.call('OthsysUser.user.brDatepicker', this);
		});
	} else {
		$('.js-datepicker').each(function(){
			yojs.call('OthsysUser.user.enDatepicker', this);
		});
	}
});