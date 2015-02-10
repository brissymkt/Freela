class User::FactorsController < UserController

	def edit
		@environmental_analysis = current_user.environmental_analyses.find(params[:environmental_analysis_id])
		@factor = @environmental_analysis.factors.find(params[:id])
	end

	def update
		@environmental_analysis = current_user.environmental_analyses.find(params[:environmental_analysis_id])
		@factor = @environmental_analysis.factors.find(params[:id])
		if @factor.update factor_params
			redirect_to edit_user_environmental_analysis_path(params[:environmental_analysis_id]), :notice => "#{I18n.t('environmental_factor_updated_successfully')}"
		else
			flash.now[:error] = I18n.t('error_message_form')
			render :edit
		end
	end

	private

	def factor_params
		params.require(:factor).permit(:id, :sub_factors_attributes => [:id, :name, :importance, :situation, :_destroy])
	end

end