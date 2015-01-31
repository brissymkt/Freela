Rails.application.routes.draw do
	devise_for :users
	scope "(:locale)", locale: /pt-BR|en/ do
		namespace :user do
			resources :environmental_analyses do
				resources :factors, :except => [:show]
				member do
					get "chart"
				end
			end
		end
	end
	root :to => "public#home"
end