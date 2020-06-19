Rails.application.routes.draw do

	devise_for :users

	root "home#top"

	root "spots#index"

	get "home/about" => "home#about"

	resources :users, only: [:show, :edit, :update]

	resources :spots

end
