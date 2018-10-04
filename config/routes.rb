Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
