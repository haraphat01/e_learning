Rails.application.routes.draw do
  resources :lessons
  get 'users/index'
  get 'home/activity'
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :courses
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
