Rails.application.routes.draw do
  resources :students, only: [:new, :create]
  resources :courses, only: [:new, :create] do
    member { put :add_student }
  end
  root to: 'home#index'
end
