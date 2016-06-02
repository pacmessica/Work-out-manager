class FavouritesController < ApplicationController
  def create
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
