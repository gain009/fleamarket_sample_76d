Rails.application.routes.draw do  
  get "items/buy_confirmation/:id", to: 'items#buy_confirmation', as: 'buy_confirmation'
  get 'purchase/index/:id', to: 'purchase#index', as: 'index'
  post 'pay/:id', to: 'purchase#pay'
  get 'purchase/done/:id', to: 'purchase#done'
  get 'card/new'
  get 'card/show'



  
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'destinations', to: 'users/registrations#new_destinations'
    post 'destinations', to: 'users/registrations#create_destinations'
  end

  root 'items#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :user
  resources :items, only: [:index, :new, :create, :show, :destroy] do


    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end 
  end
  resources :items do
    get "buy/confirmation", to: 'items#buy_confirmation'
    resources :likes, only: [:create, :destroy]
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

  resources :items do
    resources :purchase, only: [:index] do
      collection do
        post 'pay', to: 'purchase#pay'
        get 'done', to: 'purchase#done'
      end
    end
  end

end
