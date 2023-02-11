Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :tools, except: [:edit, :update] do
    resources :bookings, only: [:new, :create, :index] do
      resources :reviews, only: [:new, :create]
    end
  end
  resources :bookings, only: :destroy
  resources :reviews, only: :destroy
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
