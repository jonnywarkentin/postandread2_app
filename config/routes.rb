Rails.application.routes.draw do

  root :to => "microposts#index"

  resources :users, :except => [:destroy] do
    member do
      get :follower, :following
    end
  end
  resources :microposts, :only => [:index, :create, :destroy]
  resources :relationships, :only => [:create, :destroy]
  resources :user_sessions, :only => [:new, :create, :destroy]

  #match "users" => "users#index", via: [:get, :post]

  match "login" => "user_sessions#new", via: [:get, :post]
  match "logout" => "user_sessions#destroy", via: [:get, :post]
  match "edit_profile" => "users#edit", via: [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
