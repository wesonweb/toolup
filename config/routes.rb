Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :tools, except: [:edit, :update] do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: :create
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
