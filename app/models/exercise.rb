class Exercise < ActiveRecord::Base
  belongs_to :user
  has_many :exercises_workouts
  has_many :workouts, through: :exercises_workouts
end
