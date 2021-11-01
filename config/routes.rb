Rails.application.routes.draw do
  resources :products
  root 'products#index'
  resources :checkout, only: [:create]
  # post "buynow", to: "checkout#create"
  post "checkout/create", to: "checkout#create"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
