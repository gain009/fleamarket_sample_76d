Rails.application.routes.draw do
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



  resources :items, only: :show
  get "items/:id/buy/confirmation", to: 'items#buy_confirmation'
end
