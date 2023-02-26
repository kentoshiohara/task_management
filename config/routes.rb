Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: 'top#index'
  resources :lists, only: [:new, :create, :edit, :update, :destroy]
end
