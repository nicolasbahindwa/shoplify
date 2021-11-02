Rails.application.routes.draw do
  devise_for :users
  resources :products
  root 'products#index'
  resources :checkout, only: [:create]
  # post "buynow", to: "checkout#create"
  post "checkout/create", to: "checkout#create"
  resources :webhooks, only: [:create]
  get "success", to: "checkout#success"
  get "failure", to: "checkout#failure"
  get "cancel", to: "checkout#cancel"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
