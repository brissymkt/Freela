class EnvironmentalAnalysis < ActiveRecord::Base
	belongs_to :user
	has_many :factors, :dependent => :destroy

	validates :user_id, :presence => true
	validates :year_and_month, :presence => true
	validates :grade, :presence => true

	accepts_nested_attributes_for :factors, :allow_destroy => true, :reject_if => lambda{ |attributes| attributes[:name].blank?}


	before_save :set_year_and_date_to_beginning_of_month


	private

	def set_year_and_date_to_beginning_of_month
		self.year_and_month = @year_and_month.beginning_of_month
	end
end
