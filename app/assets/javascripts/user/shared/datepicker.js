yojs.define('OthsysUser.user.brDatepicker', function(datepicker) {
	var today = new Date();
	$(datepicker).DateTimePicker({
		maxDate: today.getDate()+'-'+(today.getMonth() + 1)+'-'+today.getUTCFullYear(),
		titleContentDate: $(datepicker).attr('data-title'),
		setButtonContent: $(datepicker).attr('data-pick-text'),
		clearButtonContent: $(datepicker).attr('data-clear-text'),
		fullMonthNames: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
		shortMonthNames: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dec'],
		fullDayNames: ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'],
		shortDayNames: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb']
	});
});

yojs.define('OthsysUser.user.enDatepicker', function(datepicker) {
	var today = new Date();
	$(datepicker).DateTimePicker({
		maxDate: today.getDate()+'-'+(today.getMonth() + 1)+'-'+today.getUTCFullYear(),
		titleContentDate: $(datepicker).attr('data-title'),
		setButtonContent: $(datepicker).attr('data-pick-text'),
		clearButtonContent: $(datepicker).attr('data-clear-text')
	});
});