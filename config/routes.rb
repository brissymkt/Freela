Rails.application.routes.draw do
	localized do
		devise_for :users, :controllers => { :sessions => "user/sessions"}
		namespace :user do
		end
		root :to => "public#home"
	end
end