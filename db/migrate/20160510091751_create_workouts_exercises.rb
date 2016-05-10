class CreateWorkoutsExercises < ActiveRecord::Migration
  def change
    create_table :workouts_exercises do |t|
      t.references :workout, index: true, foreign_key: true
      t.references :exercise, index: true, foreign_key: true
      t.integer :time
      t.text :instructions

      t.timestamps null: false
    end
  end
end
