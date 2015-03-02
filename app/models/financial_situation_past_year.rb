class FinancialSituationPastYear < ActiveRecord::Base
	belongs_to :environmental_analysis

	validates :worst_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
	validates :total_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
	validates :best_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

	before_save :fix_incomes

	private

	def fix_incomes
		self.worst_income /= 100
		self.total_income /= 100
		self.best_income /= 100
	end
end
