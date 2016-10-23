Rails.application.routes.draw do
  authenticated :account do
    root to: 'books#index', as: :authenticated_root
  end
  root to: 'common_pages#home'
  get '/logged-out', to: 'common_pages#logged_out', as: 'logged_out'

  get 'accounts/show'
  resource :books

  devise_for :accounts
end
