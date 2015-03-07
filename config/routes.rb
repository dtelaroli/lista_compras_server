Rails.application.routes.draw do
  resources :shares

  resources :list_products

  resources :lists
  resources :products

  mount_devise_token_auth_for 'User', at: 'auth'
end
