
class EnvironmentalAnalysis < ActiveRecord::Base
	
	WEEKLY_ANALYSIS = 1
	MONTHLY_ANALYSIS = 2
	TRIMONTHLY_ANALYSIS = 3
	ANNUAL_ANALYSIS = 4

	TYPES_DESCRIPTION = {
		ANNUAL_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.annual'),
		TRIMONTHLY_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.trimonthly'),
		MONTHLY_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.monthly'),
		WEEKLY_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.weekly')
	}

	VALID_TYPES = [WEEKLY_ANALYSIS, MONTHLY_ANALYSIS, TRIMONTHLY_ANALYSIS, ANNUAL_ANALYSIS]

	belongs_to :user
	has_many :factors, :dependent => :destroy

	validates :user_id, :presence => true
	validates :year_and_month, :presence => true
	validates :grade, :presence => true
	validates :type_of_analysis, :presence => true, :inclusion => {:in => VALID_TYPES }
	validate :year_and_month_in_the_future?
	validate :enough_existing_analysis?, :unless => :persisted?

	accepts_nested_attributes_for :factors, :allow_destroy => true, :reject_if => lambda{ |attributes| attributes[:name].blank?}


	def type_of_analysis?(type)
		self.type_of_analysis == type
	end

	def update_grade
		importances = 0.0
		sum = 0.0
		self.factors.each do |factor|
			sum += factor.grade * factor.importance
			importances += factor.importance
		end
		puts "SUM: #{sum}"
		puts "Importances: #{importances}"
		grade = sum.to_f / importances
		self.grade = grade
		puts "#{self.grade}"
		self.save
	end

	private



	def year_and_month_in_the_future?
		errors.add(:year_and_month, I18n.t('activerecord.errors.date_in_the_future')) if self.year_and_month.future?
	end

	def set_year_and_date_to_beginning_of_month
		self.year_and_month = self.year_and_month.beginning_of_month
	end

	def enough_existing_analysis?
		errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) unless EnvironmentalAnalysisValidator.can_create_analysis?(self)
	end

		
end


