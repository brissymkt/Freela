yojs.define('OthsysUser.user.environmental_analyses.new', function() {
	var today = new Date();
	if ($('body').attr('data-locale') == 'pt-BR') {
		$('.js-datepicker').each(function(){
				yojs.call('OthsysUser.user.brDatepicker', this);
		});
		yojs.call('OthsysUser.user.brCurrencyInput');
	} else {
		$('.js-datepicker').each(function(){
			yojs.call('OthsysUser.user.enDatepicker', this);
		});
		yojs.call('OthsysUser.user.enCurrencyInput');
	}
	$('form').submit(function() {
		console.log('before submit form');
		$('.currency-input').each(function(){
			$(this).val($(this).unmask());
			console.log($(this).val());
		});

	});
});