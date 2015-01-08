Rails.application.routes.draw do
	localized do
		devise_for :users
		namespace :user do
			resources :analyses
		end
		root :to => "public#home"
	end
end