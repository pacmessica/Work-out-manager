Rails.application.routes.draw do

  get 'exercise/index'

  get 'exercise/show'

  get '/workouts' => 'workouts#index'

  get '/workouts/new' => 'workouts#new'

  get '/workouts/:id' => 'workouts#show', as: :workout

  devise_for :users
  root to: "workouts#index"
end
