Rails.application.routes.draw do
  devise_for :users
  get 'memos/index'
  root to: "memos#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:new, :create]
end
