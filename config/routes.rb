Rails.application.routes.draw do

  get 'exercise/index'

  get 'exercise/show'

  get '/workouts' => 'workouts#index'

  get '/workouts/new' => 'workouts#new', as: :new_workout

  get '/workouts/:id' => 'workouts#show', as: :workout

  post '/workouts' => 'workouts#create'

  post '/favourites' => 'favourites#create'

  devise_for :users
  root to: "workouts#index"
end
