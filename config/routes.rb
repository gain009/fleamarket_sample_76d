Rails.application.routes.draw do
  devise_for :users
  root 'items#index'

  resources :user
  resources :items, only: [:index, :new, :show] do
    get "buy/confirmation", to: 'items#buy_confirmation'
  end
  
end
