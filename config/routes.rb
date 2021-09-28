Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :baskets, only: [:index]

  resources :baskets, only: [:show] do
  member do
    get :edit
  end
  end

  get '/cart/add', to: "carts#add_basket_to_cart"
  get '/cart/remove', to: "carts#remove_basket_from_cart"


end
