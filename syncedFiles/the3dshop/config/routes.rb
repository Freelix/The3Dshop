Rails.application.routes.draw do

  # Checkout
  resource :checkouts

  # Cart
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :users
  resources :items

  # Home
  root to: "items#index"

  # User page
  get 'user' => 'user#show'
end
