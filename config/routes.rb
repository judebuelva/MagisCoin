Rails.application.routes.draw do

    get 'users/showqr' => 'users#showqr', :as => "show_qr"
    post 'users/showqr' => 'users#show_qr'


    get '/login' => 'session#new'
    post '/login' => 'session#create'
    get 'logout' => 'session#destroy'
    get "sign_up" => "users#new_customer", :as => "sign_up"

    get "users/new/customer", to: "users#new_customer", :as => "new_customer"
    post "users/new/customer", to: "users#create_customer"

    get "users/new/merchant", to: "users#new_merchant", :as => "new_merchant"
    post "users/new/merchant", to: "users#create_merchant"

    get "users/new/admin", to: "users#new_admin", :as => "new_admin"
    post "users/new/admin", to: "users#create_admin"

    get "users/buy_load", to: "users#buy_load", :as => "buy_load"
    post "users/buy_load", to: "users#buyload"

    get "users/payment", to: "users#purchase", :as => "payment"
    post "users/payment", to: "users#payment"

    get "users/withdraw", to: "users#withdrawal", :as => "with_draw"
    post "users/withdraw", to: "users#withdraw"

    get "users/confirmation", to: "users#confirmation_page", as: "confirmation_page"

    get "users/forget_pin", to: "users#forget_pin", as: "forget_pin"
    post "users/forget_pin", to: "users#forget_pin"

    get "users/getname/:id", to: "users#getname"

    get "/mlogin", to: "mobile_login#login"
    get "/mcreate_customer", to: "mobile_login#mcreate_customer"
    get "/mpayment", to: "mobile_login#mpayment"
    get "/mtransactions", to: "mobile_login#mtransactions"
    get "/mlogout", to: "mobile_login#mlogout"

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
  get '/404' , to: 'error#not_found'
  get '/422' , to: 'error#unacceptable'
  get '/500' , to: 'error#server_error'
end
