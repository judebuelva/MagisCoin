Rails.application.routes.draw do
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