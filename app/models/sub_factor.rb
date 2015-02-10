class SubFactor < ActiveRecord::Base
	belongs_to :factor
	validates :factor_id, :presence => true
	validates :name, :presence => true, :length => {:minimum => 3}
	validates :importance, :presence => true, :inclusion => {:in => (1..10).each.map {|allowed_value| allowed_value}}
	validates :situation, :presence => true, :inclusion => {:in => (1..10).each.map { |allowed_value| allowed_value}}
end
