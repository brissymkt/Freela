
class EnvironmentalAnalysis < ActiveRecord::Base
		default_scope {order('year_and_month DESC')}

	VALID_TYPES = ['weekly', 'monthly', 'trimonthly', 'annual']

	belongs_to :user
	has_one :financial_situation_past_year, :dependent => :destroy
	has_many :factors, :dependent => :destroy

	validates :user_id, :presence => true
	validates :year_and_month, :presence => true
	validates :grade, :presence => true
	validates :type_of_analysis, :presence => true, :inclusion => {:in => VALID_TYPES }
	validate :year_and_month_in_the_future?
	validate :enough_existing_analysis?, :unless => :persisted?

	accepts_nested_attributes_for :factors, :allow_destroy => true, :reject_if => lambda{ |attributes| attributes[:name].blank?}
	accepts_nested_attributes_for :financial_situation_past_year

	def type_of_analysis?(type)
		self.type_of_analysis == type
	end

	def update_grade!
		importances = 0.0
		sum = 0.0
		self.factors.each do |factor|
			sum += factor.grade * factor.importance
			importances += factor.importance
		end
		grade = importances > 0 ? sum.to_f / importances : 0.0
		self.grade = EnvironmentalAnalysis::Calculator.calculate_grade(grade, self.financial_situation_past_year)
		self.save
		deactivate_update_flag!
	end

	def type_to_human
		I18n.t("activerecord.attributes.environmental_analysis.type_of_analysis_translation."+self.type_of_analysis)
	end

	def activate_update_flag!
		self.needs_to_be_updated = true
		self.save
	end

	def deactivate_update_flag!
		self.needs_to_be_updated = false
		self.save
	end

	private



	def year_and_month_in_the_future?
		errors.add(:year_and_month, I18n.t('activerecord.errors.date_in_the_future')) if self.year_and_month and self.year_and_month.future?
	end

	def set_year_and_date_to_beginning_of_month
		self.year_and_month = self.year_and_month.beginning_of_month
	end

	def enough_existing_analysis?
		errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) unless EnvironmentalAnalysis::Validator.can_create_analysis?(self)
	end

		
end


