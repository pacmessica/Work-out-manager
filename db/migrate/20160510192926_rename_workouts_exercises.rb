class RenameWorkoutsExercises < ActiveRecord::Migration
  def change
    rename_table :workouts_exercises, :exercises_workouts
  end
end
