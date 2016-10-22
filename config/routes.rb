Rails.application.routes.draw do
  authenticated :account do
    root to: 'books#index', as: :authenticated_root
  end
  root to: 'common_pages#home'

  get 'accounts/show'
  resource :books

  devise_for :accounts
end
