yojs.define('OthsysUser.user.environmental_analyses.chart', function() {
	var chartOptions = {};
	var day, month, year;
	day = parseInt($('.js-market-environment-chart-data .start-date .day').html().trim());
	month = parseInt($('.js-market-environment-chart-data .start-date .month').html().trim());
	year = parseInt($('.js-market-environment-chart-data .start-date .year').html().trim());
	chartOptions.suffix = $('.js-market-environment-chart-data .suffix').html().trim();
	chartOptions.title = $('.js-market-environment-chart-data .title').html().trim();
	chartOptions.content = [];
	var data = [];
	$('.js-market-environment-chart-data .data').each(function() {
		data.push(parseFloat($(this).html()));
	});
	chartOptions.content.push({
		data: data,
		name: $('.js-market-environment-chart-data .series-name').html().trim(),
		pointInterval: 7 * 24 * 3600 * 1000,
		pointStart: new Date(year, month - 1, day).getTime()
	});
	console.log(new Date(year, month - 1, day).getTime());
	console.log(chartOptions.content);
	yojs.call('OthsysUser.user.chart', '.js-market-environment-chart', chartOptions);
});