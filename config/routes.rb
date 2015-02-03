Rails.application.routes.draw do
	
	scope "(:locale)", locale: /pt-BR|en/ do
		devise_for :users	
		namespace :user do
			resources :environmental_analyses do
				resources :factors, :only => [:edit, :create]
				member do
					get "chart"
				end
			end
		end
	root :to => "public#home"
	end
	
end