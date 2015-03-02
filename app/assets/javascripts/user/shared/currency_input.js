yojs.define('OthsysUser.user.brCurrencyInput', function(){
	$('.currency-input').each(function(){
		$(this).priceFormat({
			prefix: 'R$ ',
			thousandsSeparator: '.',
			centsSeparator: ','
		});
	});
});

yojs.define('OthsysUser.user.enCurrencyInput', function() {
	$('.currency-input').each(function(){
		$(this).priceFormat({
			prefix: '$ ',
			thousandsSeparator: ',',
			centsSeparator: '.'
		});
	});
});