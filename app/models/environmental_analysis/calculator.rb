class EnvironmentalAnalysis::Calculator

	def self.calculate_grade(analysis_grade, financial_situation)
		analysis_landscape = self.set_indexes(financial_situation)
		growing_percentage = self.calculate_growing_percentage(analysis_grade, analysis_landscape)
		return ((growing_percentage * 100) - 100)
	end

	def self.get_indexes(financial_situation_past_year)
		indexes = {}
		indexes[:neutral_factor] = 1.0
		average_income = financial_situation_past_year.total_income / 12.0
		indexes[:lower_bound] = (financial_situation_past_year.worst_income.to_f / average_income * 100) - 100
		indexes[:upper_bound] = (financial_situation_past_year.best_income.to_f / average_income * 100) - 100
		return indexes
 	end

	private
	def self.set_indexes(financial_situation_past_year)
		indexes = {}
		indexes[:neutral_factor] = 1.0
		average_income = financial_situation_past_year.total_income / 12.0
		indexes[:lower_bound] = financial_situation_past_year.worst_income.to_f / average_income
		indexes[:upper_bound] = financial_situation_past_year.best_income.to_f / average_income
		return indexes
 	end

 	

 	def self.calculate_growing_percentage(grade, analysis_landscape)
		if grade < 5 
			grade_in_percentage = (grade*(1 - analysis_landscape[:lower_bound])/(5.0)) + analysis_landscape[:lower_bound]
		elsif grade == 5
			grade_in_percentage = 1.0
		else
			grade_in_percentage = ((grade - 5)*(analysis_landscape[:upper_bound] - 1)/(5.0)) + 1
		end
		return grade_in_percentage
 	end
end