Rails.application.routes.draw do
  get 'exercise/index'

  get 'exercise/show'

  get 'workouts/index'

  get 'workouts/show'

  devise_for :users
  root to: "home#index"
end
