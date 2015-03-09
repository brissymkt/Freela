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
				text: attributes.dataName
			}
		},
		tooltip: {
			valueSuffix: attributes.suffix
		},
		series: attributes.content
	});
});