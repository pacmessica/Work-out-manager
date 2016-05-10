class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.text :description
      t.integer :interval
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
