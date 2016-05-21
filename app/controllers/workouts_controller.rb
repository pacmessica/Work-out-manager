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
    @workout = Workout.new(workout_params)
    # exercsises_workouts_params = params.require(:exercsises_workouts).permit(:instructions, :time, :exercise_id)
    if @workout.save
      render json: { workout: @workout }
    else
      render json: { errors: @workout.errors, status: :unprocessable_entity }
    end
  end
end
