Rails.application.routes.draw do
  devise_for :users
  resources :categories, only: [:index, :new, :create] do
    resources :user_transactions, only: [:index, :new, :create]
  end
  # Defines the root path route ("/")
  root "categories#index"
  get "/splash_screen", to: "users#splash"
end
