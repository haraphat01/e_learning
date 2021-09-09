Rails.application.routes.draw do
  
  resources :enrollments
  get 'users/index'
  get 'home/activity'
  devise_for :users
  resources :users, only: [:index, :edit, :show, :update]
  resources :courses do
    resources :lessons
  end

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
