
yojs.define('OthsysUser.user.chart', function(chartSelector, attributes) {
	$(chartSelector).highcharts({
		chart: {
			zoomType: 'x'
		},
		credits: {
			enabled: false
		},
		title: {
			text: attributes.title
		},
		yAxis: {
			title: {
				text: ''
			},
			labels: {
				format: '{value} %'
			},
			plotLines: [{
				id: 'reference',
				color: '#000000',
				dashStyle: 'ShortDash',
				width: 2,
				value: 0,
				zIndex: 0
    	}],
		},
		xAxis: {
			type: 'datetime',
			minRange: 7 * 24 * 3600 * 1000
		},
		tooltip: {
			valueSuffix: attributes.suffix
		},
		series: attributes.content
	});
});