class EnvironmentalAnalysis < ActiveRecord::Base
	belongs_to :user
	has_many :factors, :dependent => :destroy
	validates :user_id, :presence => true
	validates :year_and_month, :presence => true
	validates :grade, :presence => true
	accepts_nested_attributes_for :factors, :allow_destroy => true, :reject_if => lambda{ |attributes| attributes[:name].blank?}
end
