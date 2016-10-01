Rails.application.routes.draw do
  resources :students, only: [:new, :create]
  resources :courses, only: [:new, :create]
  root to: 'home#index'
end
