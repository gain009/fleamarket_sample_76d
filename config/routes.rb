Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user

  resources :items, only: [:new, :show] do
    get "buy/confirmation", to: 'items#buy_confirmation'
  end
  
end
