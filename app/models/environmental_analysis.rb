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
	validate :enough_existing_analysis?

	accepts_nested_attributes_for :factors, :allow_destroy => true, :reject_if => lambda{ |attributes| attributes[:name].blank?}


	before_save :set_year_and_date_to_beginning_of_month, :if => :needs_first_day?


	private

	def needs_first_day?
		self.type_of_analysis == MONTHLY_ANALYSIS or self.type_of_analysis == TRIMONTHLY_ANALYSIS 
	end

	def year_and_month_in_the_future?
		errors.add(:year_and_month, I18n.t('activerecord.errors.date_in_the_future')) if self.year_and_month.future?
	end

	def set_year_and_date_to_beginning_of_month
		self.year_and_month = self.year_and_month.beginning_of_month
	end

	def enough_existing_analysis?
		if self.type_of_analysis == WEEKLY_ANALYSIS
			errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) if (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, self.year_and_month.beginning_of_week, self.year_and_month.end_of_week) > 0 and !self.persisted?) or (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, self.year_and_month.beginning_of_week, self.year_and_month.end_of_week) > 1 and self.persisted?)
		elsif self.type_of_analysis == MONTHLY_ANALYSIS
			errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) if (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, self.year_and_month.beginning_of_month, self.year_and_month.end_of_month) > 0 and !self.persisted?) or (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, self.year_and_month.beginning_of_month, self.year_and_month.end_of_month) > 1 and self.persisted?)
		elsif self.type_of_analysis == TRIMONTHLY_ANALYSIS
			validation_for_trimonthly
		elsif self.type_of_analysis == ANNUAL_ANALYSIS
			errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) if (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, self.year_and_month.beginning_of_year, self.year_and_month.end_of_year) > 0 and !self.persisted?) or (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, self.year_and_month.beginning_of_year, self.year_and_month.end_of_year) > 1 and self.persisted?)
		end	
	end

	def validation_for_trimonthly
		if Date.new(self.year_and_month.year, 1, 1) <= self.year_and_month and self.year_and_month <= Date.new(self.year_and_month.year, 4, 30)
			puts "detect 1 tri"
			errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) if (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, Date.new(self.year_and_month.year, 1, 1), Date.new(self.year_and_month.year, 4, 30)) > 2 and !self.persisted?) or ( EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, Date.new(self.year_and_month.year, 1, 1), Date.new(self.year_and_month.year, 4, 30)) > 3 and self.persisted?)
		elsif Date.new(self.year_and_month.year, 5, 1) <= self.year_and_month and self.year_and_month <= Date.new(self.year_and_month.year, 8, 31)
			puts "detect 2 tri"
			errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) if (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, Date.new(self.year_and_month.year, 5, 1), Date.new(self.year_and_month.year, 8, 31)) > 2 and !self.persisted?) or ( EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, Date.new(self.year_and_month.year, 5, 1), Date.new(self.year_and_month.year, 8, 31)) > 3 and self.persisted?)
		elsif Date.new(self.year_and_month.year, 9, 1) <= self.year_and_month and self.year_and_month <= Date.new(self.year_and_month.year, 12, 31)
			puts "detect 3 tri"
			errors.add(:type_of_analysis, I18n.t('activerecord.errors.enough_analyses')) if (EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, Date.new(self.year_and_month.year, 9, 1), Date.new(self.year_and_month.year, 12, 31)) > 2 and !self.persisted?) or ( EnvironmentalAnalysisCounter.analyses_for_user_in_period(self.user, Date.new(self.year_and_month.year, 9, 1), Date.new(self.year_and_month.year, 12, 31)) > 3 and self.persisted?)
		end
			
	end
end
