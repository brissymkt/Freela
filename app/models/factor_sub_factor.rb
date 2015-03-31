class FactorSubFactor < ActiveRecord::Base
	default_scope {order('id ASC')}

	belongs_to :environmental_analysis_factor
	belongs_to :sub_factor

	validates :environmental_analysis_factor_id, :presence => true
	validates :sub_factor_id, :presence => true
	validates :importance, :presence => true, :inclusion => {:in => (0..10).each.map {|allowed_value| allowed_value}}
	validates :situation, :presence => true, :inclusion => {:in => (0..10).each.map { |allowed_value| allowed_value}}

	def name
		self.sub_factor.try(:name)
	end

	def name=(name)
		sub_factor = SubFactor.find_or_create_by({:name => name})
		self.sub_factor = sub_factor
	end

end
