Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  root 'items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user
  resources :items, only: [:index, :new, :show] do
    get "buy/confirmation", to: 'items#buy_confirmation'
  end

  get 'mypage/index', to: 'mypage#index'
  get 'logout/index', to: 'logout#index'

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

end
