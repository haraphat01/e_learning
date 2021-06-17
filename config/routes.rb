Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  resources :users, only: [:index]
  resources :courses
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
