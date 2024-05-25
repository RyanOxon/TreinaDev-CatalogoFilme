Rails.application.routes.draw do
  devise_for :users
  
  resources :movies do
    member do
      post :add_list
      post :remove_list
    end
    post :add_list, on: :member
  end

  resources :user_profiles, only: %i[ new create show edit update ] do
    resources :lists, only: %i[ show ]
  end
  resources :movies
  resources :directors
  resources :genders
  
  root to: 'movies#index'


end
