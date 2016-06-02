Rails.application.routes.draw do

  get 'exercise/index'

  get 'exercise/show'

  get '/workouts' => 'workouts#index'

  get '/workouts/new' => 'workouts#new', as: :new_workout

  get '/workouts/:id' => 'workouts#show', as: :workout

  post '/workouts' => 'workouts#create'

  resources :workouts, :only => :show do
    resources :favourites
  end

  devise_for :users
  root to: "workouts#index"
end
