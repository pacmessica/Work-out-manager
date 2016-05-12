Rails.application.routes.draw do

  get 'exercise/index'

  get 'exercise/show'

  get '/workouts' => 'workouts#index'

  get '/workouts/:id' => 'workouts#show', as: :workout

  get '/workouts/new' => 'workouts#new'

  devise_for :users
  root to: "workouts#index"
end
