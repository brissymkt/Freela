class User::EnvironmentalAnalysesController < UserController

	def index
		@analyses = current_user.environmental_analyses.all
	end

	def new
		@analysis = EnvironmentalAnalysis.new
		@analysis.financial_situation_past_year = FinancialSituationPastYear.new
	end

	def create
		@analysis = EnvironmentalAnalysis.new environmental_analysis_params
		@analysis.user = current_user
		if @analysis.valid? 
			@analysis.save
			redirect_to edit_user_environmental_analysis_path(@analysis.id)
		else
			flash.now[:error] = I18n.t('error_message_form')
			render :new
		end
	end

	def edit
		@analysis = current_user.environmental_analyses.find params[:id]
		if @analysis.environmental_analysis_factors.empty?
			base_analysis = EnvironmentalAnalysis.where('year_and_month < ? ', @analysis.year_and_month).first
			unless base_analysis.nil?
				base_analysis.environmental_analysis_factors.each do |ea_factor|
					@analysis.environmental_analysis_factors.build(name: ea_factor.name, description: ea_factor.description, importance: ea_factor.importance)
				end
			end
		end
	end

	def delete
		@analysis = current_user.environmental_analyses.find params[:id]
		if @analysis.destroy
			redirect_to user_environmental_analyses_path, :notice => "#{I18n.t :environmental_analysis_exclusion_success}"
		else
			render :index
		end
	end

	def update
		@analysis = current_user.environmental_analyses.includes(:financial_situation_past_year).find params[:id]
		if @analysis.update environmental_analysis_params
			@analysis.update_grade!
			redirect_to edit_user_environmental_analysis_path(params[:id]), :notice => "#{I18n.t :environmental_analysis_updated_successfully}"
		else
			flash.now[:error] = I18n.t('error_message_form')
			render :edit
		end
	end

	def chart
		@chart_data = EnvironmentalAnalysis::DataForChartService.call(current_user)
	end
	
	def update_environmental_grade
		@analysis = current_user.environmental_analyses.find params[:id]
		@analysis.update_grade!
		@analysis.deactivate_update_flag!
		redirect_to edit_user_environmental_analysis_path(params[:id]), :notice => "#{I18n.t :environmental_grade_updated}"
	end

	private

	def environmental_analysis_params
		params.require(:environmental_analysis).permit(:id, :year_and_month, :type_of_analysis, :environmental_analysis_factors_attributes => [:id, :description, :importance, :_destroy, :name], :financial_situation_past_year_attributes => [:worst_income, :total_income, :best_income])
	end
end