Rails.application.routes.draw do
    get "users/new/customer", to: "users#new_customer"
    post "users/new/customer", to: "users#create_customer"

    get "users/new/merchant", to: "users#new_merchant"
    post "users/new/merchant", to: "users#create_merchant"

    get "users/new/admin", to: "users#new_admin"
    post "users/new/admin", to: "users#create_admin"

    get "users/buy_load", to: "users#buy_load"
    post "users/buy_load", to: "users#buyload"

    get "users/payment", to: "users#purchase"
    post "users/payment", to: "users#payment"

    get '/login' => 'session#new'
    post '/login' => 'session#create'
    get 'logout' => 'session#destroy'
    get "sign_up" => "users#new_customer", :as => "sign_up"

  resources :transactions
  resources :users
  resources :cards
  resources :rewards
  resources :qrs
  resources :receive_loads
  resources :purchases
  resources :buy_loads
  resources :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
