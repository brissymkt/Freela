class User::EnvironmentalAnalysisFactorsController < UserController

	def edit
		@environmental_analysis = current_user.environmental_analyses.find(params[:environmental_analysis_id])
		@factor = @environmental_analysis.environmental_analysis_factors.find(params[:id])
	end

	def update
		@environmental_analysis = current_user.environmental_analyses.find(params[:environmental_analysis_id])
		@factor = @environmental_analysis.environmental_analysis_factors.find(params[:id])
		if @factor.update factor_params
			@factor.update_grade!
			@environmental_analysis.activate_update_flag!
			redirect_to edit_user_environmental_analysis_path(params[:environmental_analysis_id]), :notice => "#{I18n.t('environmental_factor_updated_successfully')}", :needs_to_update_analysis => true
		else
			flash.now[:error] = I18n.t('error_message_form')
			render :edit
		end
	end

	private

	def factor_params
		params.require(:environmental_analysis_factor).permit(:id, :factor_sub_factors_attributes => [:id, :name, :description, :importance, :situation, :_destroy])
	end

end