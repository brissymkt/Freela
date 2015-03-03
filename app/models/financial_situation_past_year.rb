class FinancialSituationPastYear < ActiveRecord::Base
	belongs_to :environmental_analysis

	validates :worst_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
	validates :total_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
	validates :best_income, :presence => true, :numericality => {:greater_than_or_equal_to => 0}

	validate :inconsistent_values?

	before_save :fix_incomes

	private

	def inconsistent_values?
		if self.worst_income > self.total_income  
			errors.add(:worst_income, I18n.t('activerecord.errors.worst_income_greater_than_total')) 
		end
		if self.worst_income > self.best_income
			errors.add(:worst_income, I18n.t('activerecord.errors.worst_income_greater_than_best')) 
		end
		if self.best_income < (self.total_income / 12)
			errors.add(:best_income, I18n.t('activerecord.errors.best_income_less_than_average'))
		end
		if self.best_income > self.total_income
			errors.add(:best_income, I18n.t('activerecord.errors.best_income_greater_than_total')) 
		end
		if self.total_income < self.best_income + self.worst_income
			errors.add(:total_income, I18n.t('activerecord.errors.invalid_total_income'))
		end
	end

	def fix_incomes
		self.worst_income /= 100
		self.total_income /= 100
		self.best_income /= 100
	end
end
