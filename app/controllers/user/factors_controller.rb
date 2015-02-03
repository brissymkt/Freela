class User::FactorsController < UserController

	def edit
		@environmental_analysis = current_user.environmental_analyses.find(params[:environmental_analysis_id])
		@factor = @environmental_analysis.factors.find(params[:id])
	end

	def update

	end

end