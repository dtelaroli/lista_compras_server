Rails.application.routes.draw do
  resources :lists
  resources :products

  mount_devise_token_auth_for 'User', at: 'auth'
end
