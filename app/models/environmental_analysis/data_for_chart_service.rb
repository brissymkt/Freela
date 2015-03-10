class EnvironmentalAnalysis::DataForChartService
	def self.call(user)
		data_for_chart = {}
		analyses = user.environmental_analyses.unscoped.order('year_and_month ASC')
		data_for_chart[:start_date] = analyses.first.year_and_month
		data_for_chart[:analyses] = []
		analyses.each do |analysis|
			if analysis.type_of_analysis?('weekly')
				data_for_chart[:analyses] << analysis.grade
			elsif analysis.type_of_analysis?('monthly')
				4.times {data_for_chart[:analyses] << analysis.grade}
			elsif analysis.type_of_analysis?('trimonthly')
				(3*4).times {data_for_chart[:analyses] << analysis.grade}
			elsif analysis.type_of_analysis?('annual')
				(12*4).times {data_for_chart[:analyses] << analysis.grade}
			end
		end
		return data_for_chart
	end
end