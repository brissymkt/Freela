class Factor < ActiveRecord::Base
	validates :name, :presence => true, :length => {:minimum => 3}
	has_many :environmental_analyses, :through => :environmental_analysis_factors
	has_many :environmental_analysis_factors

	has_many :sub_factors, :through => :factor_sub_factors
	has_many :factor_sub_factors

end
