class UserController < ApplicationController
	layout "user"
	before_action :authenticate_user!
	before_action :get_recent_analysis

	def get_recent_analysis
		@recent_analysis = current_user.environmental_analyses.first(4)
	end
end