Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  #temp
  get '/tools/s', to: 'tools#index'

  resources :tools, except: [:edit, :update] do
    resources :bookings, only: [:new, :create] do
      resources :reviews, only: [:new, :create]
    end
  end
  resources :bookings, only: [:destroy, :index, :show]


  # resources :reviews
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
