yojs.define('OthsysUser.user.environmental_analyses.chart', function() {
	if ($('body').attr('data-locale') == 'pt-BR') {
		yojs.call('OthsysUser.user.chart-ptBR');
	}
	if ($('.js-market-environment-chart-data').length > 0){
		var chartOptions = {};
		var day, month, year;
		day = parseInt($('.js-common-data .start-date .day').html().trim());
		month = parseInt($('.js-common-data .start-date .month').html().trim());
		year = parseInt($('.js-common-data .start-date .year').html().trim());
		chartOptions.suffix = $('.js-market-environment-chart-data .suffix').html().trim();
		chartOptions.content = [];
		var data = [];
		$('.js-market-environment-chart-data .data').each(function() {
			data.push(parseFloat($(this).html()));
		});
		chartOptions.content.push({
			data: data,
			name: $('.js-market-environment-chart-data .series-name').html().trim(),
			pointInterval: 7 * 24 * 3600 * 1000,
			pointStart: new Date(year, month - 1, day).getTime(),
			negativeColor: '#8C8C8C'
		});
		yojs.call('OthsysUser.user.chart', '.js-market-environment-chart', chartOptions);
	}
	if ($('.js-factor-timeline').length > 0) {
		var chartFactorOptions = {};
		var day, month, year;
		day = parseInt($('.js-common-data .start-date .day').html().trim());
		month = parseInt($('.js-common-data .start-date .month').html().trim());
		year = parseInt($('.js-common-data .start-date .year').html().trim());
		chartFactorOptions.content = [];
		var series = [];
		$('.js-factor-timeline').each(function() {
			var data = [];
			$(this).find('.grade').each(function() {
				data.push(parseFloat($(this).html()));
			});
			series.push({name: $(this).find('.name').html().trim(), data: data});
		});
		$('.js-market-environment-factors').highcharts({
			chart: {
				zoomType: 'x',
				resetZoomButton: {
					position: {
						x: 0,
						y: -30
					},
					theme: {
						fill: 'white',
						stroke: 'silver',
						r: 0,
						states: {
							hover: {
								fill: '#29B1AB',
								style: {
									color: 'white'
								}
							}
						}
					}
				}
			},
			plotOptions: {
				series: { 
					pointStart: new Date(year, month - 1, day).getTime(),
					pointInterval: 7 * 24 * 3600 * 1000
				}
			},
			credits: {
				enabled: false
			},
			title: {
				text: ''
			},
			subtitle: {
				text: $('.environmental-chart-subtitle').html().trim()
			},
			yAxis: {
				title: {
					text: ''
				},
				gridLineWidth: 0,
				lineColor: '#8C8C8C',
				lineWidth: 1,
				labels: {
					format: '{value}'
				},
				min: 0,
				max: 10
			},
			xAxis: {
				type: 'datetime',
				minRange: 7 * 24 * 3600 * 1000,
				lineColor: '#8C8C8C',
				lineWidth: 1
			},
			tooltip: {
				valueSuffix: ''
			},
			series: series
		});
	}
});