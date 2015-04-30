Rails.application.routes.draw do
	
	scope "(:locale)", locale: /pt-BR|en/ do
		devise_for :users	
		namespace :user do
			resources :environmental_analyses, :except => [:show, :destory] do
				member do 
					get :delete
					patch :update_environmental_grade
				end
				resources :environmental_analysis_factors, :only => [:edit, :update]
				collection do
					get :chart
				end
			end
			resources :users, :except => [:destroy, :show]
		end
	root :to => "public#home"
	end
end