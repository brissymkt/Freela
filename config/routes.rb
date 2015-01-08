Rails.application.routes.draw do
	localized do
		devise_for :users
		devise_scope :user do 
			authenticated :user do
				root :to => "home#home", :as => :authenticated_root
			end
			unauthenticated :user do
				root :to => "devise/sessions#new", :as => :unauthenticated_root
			end
		end
	end
end