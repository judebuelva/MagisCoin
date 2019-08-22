Rails.application.routes.draw do
    get "users/new/customer", to: "users#new_customer"
    post "users/new/customer", to: "users#create_customer"

    get "users/new/merchant", to: "users#new_merchant"
    post "users/new/merchant", to: "users#create_merchant"

    get "users/new/admin", to: "users#new_admin"
    post "users/new/admin", to: "users#create_admin"

    get "users/buy_load", to: "users#buy_load"
    post "users/buy_load", to: "users#buyload"

    get "users/new/purchase", to: "users#purchase"
    post "users/new/purchase", to: "users#payment"

  resources :transactions
  resources :users
  resources :cards
  resources :rewards
  resources :qrs
  resources :receive_loads
  resources :purchases
  resources :buy_loads
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
