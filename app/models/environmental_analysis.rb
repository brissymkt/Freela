class EnvironmentalAnalysis < ActiveRecord::Base
	belongs_to :user
	has_many :factors
	validates :user_id, :presence => true
	validates :year_and_month, :presence => true
	validates :grade, :presence => true
end
