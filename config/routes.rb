Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "custom_sessions"}

  root to: 'pages#home'

  resources :baskets, only: [:index]
  resources :baskets, only: [:show] do
    member do
      get :edit
    end
  end

  resources :orders, only: [:create, :destroy]

  get '/cart/add', to: "carts#add_basket_to_cart"
  get '/cart/remove', to: "carts#remove_basket_from_cart"
  get '/cart/create', to: "carts#create_cart"

  get '/user/dashboard', to: "user#dashboard"
end
