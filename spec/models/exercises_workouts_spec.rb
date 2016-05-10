require 'rails_helper'

RSpec.describe ExercisesWorkouts, type: :model do
  it "should exist" do
    result = FactoryGirl.create :workouts_exercise, workout: FactoryGirl.create(:workout), exercise: FactoryGirl.create(:exercise)
  end
end
