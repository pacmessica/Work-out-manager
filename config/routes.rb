Rails.application.routes.draw do
  get 'workouts/index'

  get 'workouts/show'

  devise_for :users
  root to: "home#index"
end
