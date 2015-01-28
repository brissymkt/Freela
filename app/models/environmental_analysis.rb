class EnvironmentalAnalysis < ActiveRecord::Base
	
	WEEKLY_ANALYSIS = 1
	MONTHLY_ANALYSIS = 2
	TRIMONTHLY_ANALYSIS = 3
	ANNUAL_ANALYSIS = 4

	TYPES_DESCRIPTION = {
		WEEKLY_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.weekly'),
		MONTHLY_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.monthly'),
		TRIMONTHLY_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.trimonthly'),
		ANNUAL_ANALYSIS => I18n.t('activerecord.attributes.environmental_analysis.types_description.annual')
	}

	VALID_TYPES = [WEEKLY_ANALYSIS, MONTHLY_ANALYSIS, TRIMONTHLY_ANALYSIS, ANNUAL_ANALYSIS]

	belongs_to :user
	has_many :factors, :dependent => :destroy

	validates :user_id, :presence => true
	validates :year_and_month, :presence => true
	validates :grade, :presence => true
	validates :type_of_analysis, :presence => true, :inclusion => {:in => VALID_TYPES }
	validate :year_and_month_in_the_future?

	accepts_nested_attributes_for :factors, :allow_destroy => true, :reject_if => lambda{ |attributes| attributes[:name].blank?}


	before_save :set_year_and_date_to_beginning_of_month


	private
	def year_and_month_in_the_future?
		errors.add(:year_and_month, I18n.t('activerecord.errors.date_in_the_future')) if self.year_and_month.future?
	end

	def set_year_and_date_to_beginning_of_month
		self.year_and_month = self.year_and_month.beginning_of_month
	end

end
