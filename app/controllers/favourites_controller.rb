class WorkoutsController < ApplicationController
  def create
    favourite_params = params.require(:favourite).permit(:workout_id)
    workout = Workout.find( params[:workout_id])
      if favourite = Favourite.find_by( workout: workout, user: current_user )
           favourite.destroy
      else
         favourite = Favourite.new( workout: workout, user: current_user )
         favourite.save
      end
    redirect_to(:back)
  end
end
