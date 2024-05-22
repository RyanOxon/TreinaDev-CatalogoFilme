Rails.application.routes.draw do
  devise_for :users
  resources :movies
  resources :directors
  resources :genders
  
  root to: 'movies#index'

end
