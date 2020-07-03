Rails.application.routes.draw do

	devise_for :users

	root "home#top"

	root "spots#index"

	get "home/about" => "home#about"

	resources :users, only: [:show, :edit, :update]

	resources :spots

	resources :users do
		member do
			get "check"
			patch "withdraw"
		end
	end

end
