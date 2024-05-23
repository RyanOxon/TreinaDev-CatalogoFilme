Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    post :add_list, on: :member
  end
  resources :directors
  resources :genders
  
  root to: 'movies#index'


end
