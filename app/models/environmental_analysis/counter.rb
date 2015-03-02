#coding: utf-8

class EnvironmentalAnalysis::Counter

	def self.analyses_for_user_in_period(user, start_date, end_date)
		EnvironmentalAnalysis.where(:user_id => user.id, :year_and_month => start_date..end_date).count
	end

end