class Analysis < ActiveRecord::Base
	belongs_to :user
	validates :user_id, :presence => true
	validates :year_and_month, :presence => true
	validates :grade, :presence => true
end
