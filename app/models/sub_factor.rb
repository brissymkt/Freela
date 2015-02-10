class SubFactor < ActiveRecord::Base
	belongs_to :factor
	validates :factor_id, :presence => true
	validates :name, :presence => true, :length => {:minimum => 3}
	validates :importance, :presence => true, :inclusion => {:in => (1..10).each.map {|allowed_value| allowed_value}}
	validates :situation, :presence => true, :inclusion => {:in => (1..10).each.map { |allowed_value| allowed_value}}

	before_save :calculate_grade


	private

	def calculate_grade
		self.grade = Float((self.importance * self.situation) / 10.0)
		puts "CALCULATION: #{Float((self.importance * self.situation) / 10.0)}"
		puts  "SUBFACTOR GRADE: #{self.grade}"
	end
end
