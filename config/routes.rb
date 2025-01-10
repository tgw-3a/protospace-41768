Rails.application.routes.draw do
  devise_for :users
  root to: 'prototypes#index'
  resources :users, only:[:show]
  resources :prototypes, except: [:index] do
    resources :comments, only: [:create]
  end
end
