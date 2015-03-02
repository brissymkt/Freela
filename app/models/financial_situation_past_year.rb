class FinancialSituationPastYear < ActiveRecord::Base
	belongs_to :environmental_analysis

	validates :worst_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
	validates :total_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
	validates :best_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
end
