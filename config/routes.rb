Rails.application.routes.draw do
  resources :movies
  resources :directors
  resources :genders
  
  root to: 'movies#index'

end
