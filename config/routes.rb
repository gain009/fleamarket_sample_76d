Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destinations'
    post 'destinations', to: 'users/registrations#create_destinations'
  end


  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :items, only: :show do
    get "buy/confirmation", to: 'items#buy_confirmation'
  end
  
end
