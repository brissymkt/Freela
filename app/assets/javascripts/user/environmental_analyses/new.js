yojs.define('OthsysUser.user.environmental_analyses.new', function() {
	var today = new Date();
	if ($('body').attr('data-locale') == 'pt-BR') {
		$('.js-datepicker').each(function(){
			$(this).DateTimePicker({
				maxDate: today.getDate()+'-'+(today.getMonth() + 1)+'-'+today.getUTCFullYear(),
				titleContentDate: $(this).attr('data-title'),
				setButtonContent: $(this).attr('data-pick-text'),
				clearButtonContent: $(this).attr('data-clear-text'),
				fullMonthNames: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
				shortMonthNames: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dec'],
				fullDayNames: ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'],
				shortDayNames: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb']
			});
		});
	} else {
		$('.js-datepicker').each(function(){
			$(this).DateTimePicker({
				maxDate: today.getDate()+'-'+(today.getMonth() + 1)+'-'+today.getUTCFullYear(),
				titleContentDate: $(this).attr('data-title'),
				setButtonContent: $(this).attr('data-pick-text'),
				clearButtonContent: $(this).attr('data-clear-text')
			});
		});
	}
});