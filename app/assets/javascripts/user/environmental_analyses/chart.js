yojs.define('OthsysUser.user.environmental_analyses.chart', function() {
	var chartOptions = {};
	chartOptions.suffix = $('.js-market-environment-chart-data .suffix').html().trim();
	chartOptions.title = $('.js-market-environment-chart-data .title').html().trim();
	chartOptions.dataName = $('.js-market-environment-chart-data .data-name').html().trim();
	chartOptions.content = [];
	var data = [];
	$('.js-market-environment-chart-data .data').each(function() {
		data.push(parseFloat($(this).html()));
	});
	chartOptions.content.push({data: data, name: $('.js-market-environment-chart-data .title').html().trim()});
	console.log(chartOptions);
	yojs.call('OthsysUser.user.chart', '.js-market-environment-chart', chartOptions);
});