class User::EnvironmentalAnalysesController < UserController

	def index
		@analyses = current_user.environmental_analyses.all
	end

	def new

	end

	def create

	end

	def edit

	end

	def update

	end

	def show

	end

	def delete

	end

end