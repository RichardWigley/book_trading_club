Rails.application.routes.draw do
  authenticated :account do
    root to: 'books#index', as: :books
  end
  root to: 'common_pages#home'
  get '/logged-out', to: 'common_pages#logged_out', as: 'logged_out'

  get 'accounts/show'
  resources :contacts, only: [:edit, :update]

  resources :books do
    resources :offers, only: [:new, :create]
    resources :wants, only: [:new, :create]
  end
  resources :offers, only: [:index, :show, :destroy]
  resources :wants, only: [:index, :show, :destroy]
  resources :trades, only: [:index]

  devise_for :accounts
end
