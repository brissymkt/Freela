
yojs.define('OthsysUser.user.chart', function(chartSelector, attributes) {
	$(chartSelector).highcharts({
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
		credits: {
			enabled: false
		},
		title: {
			text: attributes.title
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
				format: '{value} %'
			},
			plotLines: [{
				id: 'reference',
				color: '#29B1AB',
				width: 3,
				value: 0,
				zIndex: 0
    	}]
		},
		xAxis: {
			type: 'datetime',
			minRange: 7 * 24 * 3600 * 1000,
			lineColor: '#8C8C8C',
      lineWidth: 1
		},
		tooltip: {
			valueSuffix: attributes.suffix
		},
		series: attributes.content
	});
});


yojs.define('OthsysUser.user.chart-ptBR', function() {
	if ($('body').attr('data-locale') == 'pt-BR') {
		Highcharts.setOptions({
			lang: {
	      loading: 'Aguarde...',
	      months: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
	      weekdays: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
	      shortMonths: ['Jan', 'Fev', 'Mar', 'Abr', 'Maio', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
	      exportButtonTitle: "Exportar",
	      printButtonTitle: "Imprimir",
	      rangeSelectorFrom: "De",
	      rangeSelectorTo: "Até",
	      rangeSelectorZoom: "Periodo",
	      downloadPNG: 'Download imagem PNG',
	      downloadJPEG: 'Download imagem JPEG',
	      downloadPDF: 'Download documento PDF',
	      downloadSVG: 'Download imagem SVG',
	      resetZoom: "Voltar à escala original",
	      resetZoomTitle: "Reset",
	      thousandsSep: ".",
	      decimalPoint: ','
	    }
		});
	}
});