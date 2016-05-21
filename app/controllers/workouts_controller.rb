class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
  end

  def new
    @workout = Workout.new
  end

  def create
    workout_params = params.require(:workout).permit(:name, :interval, :description)
    workout_params[:user] = current_user
    @workout = Workout.create(workout_params)
    exercises_workouts_params = params.require(:exercises_workouts).permit(:instructions, :time, :exercise_id)
    exercises_workouts_params[:workout_id] = @workout[:id]
    ExercisesWorkout.create(exercises_workouts_params)
    if @workout.save
      render json: { workout: @workout }
    else
      render json: { errors: @workout.errors, status: :unprocessable_entity }
    end
  end
end
