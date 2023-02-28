Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations'}
  root to: 'top#index'
  resources :top do
    member do
      get :move_higher
      get :move_lower
      get :move_left
      get :move_right
    end
  end
  resources :lists, only: [:new, :create, :edit, :update, :destroy] do
    resources :cards, only: [:new, :create, :show, :edit, :update, :destroy] 
  end
end
