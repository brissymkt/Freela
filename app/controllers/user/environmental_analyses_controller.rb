class User::EnvironmentalAnalysesController < UserController

	def index
		@analyses = current_user.environmental_analyses.all
	end

	def new
		@analysis = EnvironmentalAnalysis.new
	end

	def create
		@analysis = EnvironmentalAnalysis.new environmental_analysis_params
		@analysis.user = current_user
		if @analysis.valid? 
			@analysis.save
			redirect_to locale_link_to("edit_user_environmental_analysis", {:id => @analysis.id})
		else
			flash.now[:error] = I18n.t('error_message_form')
			render :new
		end
	end

	def edit
		@analysis = EnvironmentalAnalysis.find params[:id]
	end

	def update
		@analysis = EnvironmentalAnalysis.find params[:id]
		if @analysis.update environmental_analysis_params
			@analysis.save
			redirect_to locale_link_to("user_environmental_analyses"), :notice => "#{I18n.t :environmental_analysis_updated_successfully}"
		else
			flash.now[:error] = I18n.t('error_message_form')
			render :edit
		end
	end

	def show

	end

	def delete

	end

	def chart

	end
	private

	def environmental_analysis_params
		params.require(:environmental_analysis).permit(:year_and_month, :type_of_analysis, :factors_attributes => [:id, :name, :description, :importance, :_destroy])
	end
end