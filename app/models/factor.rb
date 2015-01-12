class Factor < ActiveRecord::Base
	belongs_to :environmental_analysis
	has_many :sub_factors
	validates :name, :presence => true, :length => {:minimum => 3}
	validates :environmental_analysis_id, :presence => true
	validates :importance, :presence => true
	validates :environmental_analysis, :presence => true
	validates :grade, :presence => true
end
