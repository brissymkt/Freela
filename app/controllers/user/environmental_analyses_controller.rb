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
			render :new
		end
	end

	def edit

	end

	def update

	end

	def show

	end

	def delete

	end

	def chart

	end
	private

	def environmental_analysis_params
		params.require(:environmental_analysis).permit(:year_and_month, :factors_attributes => [:name, :description, :importance, :_destroy])
	end
end