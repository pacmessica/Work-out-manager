class WorkoutsController < ApplicationController
  def index
    @workouts = current_user.favourite_workouts
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

    exercises_workouts_params = params.permit(exercises_workouts: [:exercise_id, :instructions, :time]).require(:exercises_workouts)
    exercises_workouts_params.each do |param|
      param[:workout_id] = @workout[:id]
      ExercisesWorkout.create(param)
    end

    if @workout.save
      redirect_to workout_path(@workout)
    else
      render :new
    end
  end
end
