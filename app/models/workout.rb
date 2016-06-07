class Workout < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :exercises_workouts
  has_many :exercises, through: :exercises_workouts
  has_many :favourites
  has_many :users, :through => :favourites
end
