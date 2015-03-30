class FactorSubFactor < ActiveRecord::Base
	default_scope {order('id ASC')}

	belongs_to :factor
	belongs_to :sub_factor
	belongs_to :environmental_analysis

	validates :environmental_analysis_id, :presence => true
	validates :factor_id, :presence => true
	validates :sub_factor_id, :presence => true
	validates :importance, :presence => true, :inclusion => {:in => (0..10).each.map {|allowed_value| allowed_value}}
	validates :situation, :presence => true, :inclusion => {:in => (0..10).each.map { |allowed_value| allowed_value}}

	before_save :set_sub_factor, :unless => Proc.new {|association| association.sub_factor.blank?}


	private

	def set_sub_factor
		name = self.sub_factor.name.strip.capitalize.split.join(' ')
		sub_factor = SubFactor.find_or_create_by({:name => name})
		self.sub_factor = sub_factor
	end
end
