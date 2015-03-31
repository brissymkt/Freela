class EnvironmentalAnalysisFactor < ActiveRecord::Base
	default_scope {order('id ASC')}

	belongs_to :environmental_analysis
	belongs_to :factor

	has_many :factor_sub_factors

	accepts_nested_attributes_for :factor_sub_factors, :reject_if => lambda{ |attributes| attributes[:name].blank?}

	validates :environmental_analysis_id, :presence => true
	validates :importance, :presence => true, :inclusion => {:in => (0..10).each.map {|allowed_value| allowed_value}}
	validates :environmental_analysis, :presence => true
	validates :grade, :presence => true

	def name 
		self.factor.try(:name)
	end

	def name=(name)
		self.factor = Factor.find_or_create_by({:name => name})
	end

	def update_grade!
		sum = 0.0
		importance = 0.0
		self.factor_sub_factors.each do |sub_factor|
			sum += sub_factor.situation * sub_factor.importance
			importance += sub_factor.importance
		end
		self.grade = importance > 0 ? (sum.to_f / importance) : 0.0
		self.save
	end


end
