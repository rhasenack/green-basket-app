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
end
