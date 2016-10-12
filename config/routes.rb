Rails.application.routes.draw do
  root to: 'common_pages#home'

  devise_for :accounts
end
