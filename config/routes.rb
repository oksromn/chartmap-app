Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :charts do
    resources :points, only: [:index, :create]
  end

  resources :words

  # Defines the root path route ("/")
  root "charts#index"
end
