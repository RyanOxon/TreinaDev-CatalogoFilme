Rails.application.routes.draw do
  devise_for :users
  
  resources :movies do
    post :add_list, on: :member
  end

  resources :user_profiles, only: %i[ new create show edit update ]
  resources :movies
  resources :directors
  resources :genders
  
  root to: 'movies#index'


end
