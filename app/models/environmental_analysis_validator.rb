#coding: utf-8

class EnvironmentalAnalysisValidator
	def self.can_create_analysis?(environmental_analysis)
		existing_analyses = 1.0/0
		if environmental_analysis.type_of_analysis?(EnvironmentalAnalysis::WEEKLY_ANALYSIS)
			existing_analyses = self.analysis_in_period(environmental_analysis, environmental_analysis.year_and_month.beginning_of_week, environmental_analysis.year_and_month.end_of_week)
		elsif environmental_analysis.type_of_analysis?(EnvironmentalAnalysis::MONTHLY_ANALYSIS)
			existing_analyses = self.analysis_in_period(environmental_analysis, environmental_analysis.year_and_month.beginning_of_month, environmental_analysis.year_and_month.end_of_month)
		elsif environmental_analysis.type_of_analysis?(EnvironmentalAnalysis::ANNUAL_ANALYSIS)
			existing_analyses = self.analysis_in_period(environmental_analysis, environmental_analysis.year_and_month.beginning_of_year, environmental_analysis.year_and_month.end_of_year)
		elsif environmental_analysis.type_of_analysis?(EnvironmentalAnalysis::TRIMONTHLY_ANALYSIS)
			existing_analyses = self.count_analysis_in_trimester(environmental_analysis)
		end
		puts "Existing analyses: #{existing_analyses}"
		return existing_analyses == 0
	end


	private 

	def self.count_analysis_in_trimester(environmental_analysis)
		if Date.new(environmental_analysis.year_and_month.year, 1, 1) <= environmental_analysis.year_and_month and environmental_analysis.year_and_month <= Date.new(environmental_analysis.year_and_month.year, 3, 31)
			return self.analysis_in_period(environmental_analysis, Date.new(environmental_analysis.year_and_month.year, 1, 1), Date.new(environmental_analysis.year_and_month.year, 3, 31))
		elsif Date.new(environmental_analysis.year_and_month.year, 4, 1) <= environmental_analysis.year_and_month and environmental_analysis.year_and_month <= Date.new(environmental_analysis.year_and_month.year, 6, 30)
			return self.analysis_in_period(environmental_analysis, Date.new(environmental_analysis.year_and_month.year, 4, 1), Date.new(environmental_analysis.year_and_month.year, 6, 30))
		elsif Date.new(environmental_analysis.year_and_month.year, 7, 1) <= environmental_analysis.year_and_month and environmental_analysis.year_and_month <= Date.new(environmental_analysis.year_and_month.year, 9, 30)
			return self.analysis_in_period(environmental_analysis, Date.new(environmental_analysis.year_and_month.year, 7, 1), Date.new(environmental_analysis.year_and_month.year, 9, 30))
		elsif Date.new(environmental_analysis.year_and_month.year, 10, 1) <= environmental_analysis.year_and_month and environmental_analysis.year_and_month <= Date.new(environmental_analysis.year_and_month.year, 12, 31)
			return self.analysis_in_period(environmental_analysis, Date.new(environmental_analysis.year_and_month.year, 10, 1), Date.new(environmental_analysis.year_and_month.year, 12 , 31))
		end
	end

	def self.analysis_in_period(environmental_analysis, start_date, end_date)
		return EnvironmentalAnalysisCounter.analyses_for_user_in_period(environmental_analysis.user, start_date, end_date)
	end


end