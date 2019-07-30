Rails.application.routes.draw do
    get "/users/new/customer", to: "users#new_customer"
    post "/users/new/customer", to: "users#create_customer"
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
