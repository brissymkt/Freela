class User::UsersController < UserController
	def index
		@users = User.all
	end

	def new
		@user = User.new()
	end

	def create
		@user = User.new user_params
		if @user.save
			redirect_to user_users_path, :notice => 'Usuário registrado com sucesso'
		else
			flash.now[:error] = "Erro"
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update user_params
			if params[:id].to_i == current_user.id
				sign_in @user, :bypass => true
			end
			redirect_to user_users_path, :notice => 'Usuário editado com sucesso'
		else
			flash.now[:error] = "Erro"
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit([:name, :email, :password])
	end
end