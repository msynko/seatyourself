Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'restaurants#index'
  get 'restaurants/index'

  resources :restaurants
  resources :reservations
  resource :user

end
