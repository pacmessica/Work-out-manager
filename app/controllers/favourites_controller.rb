class FavouritesController < ApplicationController
  def index
    @workouts = Workout.joins(:favourites).group( 'workouts.id' ).order( 'count(workout_id) DESC' ).having ( 'count( workout_id ) > 1' )
  end

  def create
    workout = Workout.find( params.require(:workout_id))
    if favourite = Favourite.find_by( workout: workout, user: current_user )
         favourite.destroy
    else
       favourite = Favourite.new( workout: workout, user: current_user )
       favourite.save
    end
    render json: { favourite: favourite }
  end
end
