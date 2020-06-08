Rails.application.routes.draw do
  resources :reference_prices
  resources :crop_types
  resources :postal_codes
  resources :cities
  resources :departments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
