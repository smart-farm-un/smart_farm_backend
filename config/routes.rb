Rails.application.routes.draw do
  resources :crops
  resources :terrains
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :reference_prices
  resources :crop_types
  resources :postal_codes
  resources :cities
  resources :departments

  resources :users, only: [:index, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
