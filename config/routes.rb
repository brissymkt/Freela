Rails.application.routes.draw do
	localized do
		devise_for :users
		namespace :user do
			resources :environmental_analyses do
				resources :factors, :except => [:show]
				member do
					get "chart"
				end
			end
		end
		root :to => "public#home"
	end
end