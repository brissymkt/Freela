Rails.application.routes.draw do
	
	scope "(:locale)", locale: /pt-BR|en/ do
		devise_for :users	
		namespace :user do
			resources :environmental_analyses, :except => [:show] do
				resources :factors, :only => [:edit, :update]
				collection do
					get "chart"
				end
			end
		end
	root :to => "public#home"
	end
	
end