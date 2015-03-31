class EnvironmentalAnalysis::DataForChartService
	def self.call(user)
		analyses = user.environmental_analyses.unscoped.includes(:environmental_analysis_factors => :factor).order('year_and_month ASC')
		analyzed_factors = get_factors_to_be_plotted(analyses)
		data_for_chart = assembly_data(analyses, analyzed_factors)
		data_for_chart[:factors] = data_for_chart[:factors].values
		return data_for_chart
	end


	private

	def self.repeat_data_n_times(type_of_analysis)
		repeat_n_times = 1
		if type_of_analysis == 'weekly'
			repeat_n_times = 1			
		elsif type_of_analysis == 'monthly'
			repeat_n_times = 4
		elsif type_of_analysis == 'trimonthly'
			repeat_n_times = 4*3
		elsif type_of_analysis == 'annual'
			repeat_n_times = 12*4	
		end
		return repeat_n_times
	end

	def self.get_factors_to_be_plotted(analyses)
		return Factor.where(:id => EnvironmentalAnalysisFactor.where(:id => analyses.pluck(:id)).pluck(:factor_id))
	end

	def self.assembly_data(analyses, factors)
		data_for_chart = {}
		data_for_chart[:start_date] = analyses.first.year_and_month
		data_for_chart[:analyses] = []
		data_for_chart[:factors] = {}
		factors.each do |factor| 
			data_for_chart[:factors][factor.name] = {:name => factor.name, :data => []}
		end
		analyses.each do |analysis|
			(repeat_data_n_times(analysis.type_of_analysis)).times do 
				data_for_chart[:analyses] << analysis.grade
				factors.each do |factor|
					if analysis.environmental_analysis_factors.where(:factor_id => factor.id).any?
						data_for_chart[:factors][factor.name][:data] << analysis.environmental_analysis_factors.find_by(:factor_id => factor.id).grade
					else
						data_for_chart[:factors][factor.name][:data] << 0.0
					end	
				end
			end
		end
		return data_for_chart
	end
end