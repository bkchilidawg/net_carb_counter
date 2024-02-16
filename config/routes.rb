Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_for :users

  namespace :api do
    namespace :v0 do

      resources :foods, only: [:index, :show]
    end
  end
  resources :foods, only: [:index, :show]
  resources :eaten_foods, only: [:create, :destroy]

  root to: 'foods#index'
end
