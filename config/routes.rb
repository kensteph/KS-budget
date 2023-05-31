Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :new, :create]
  # Defines the root path route ("/")
  root "categories#index"
  get "/splash_screen", to: "users#splash"
end
