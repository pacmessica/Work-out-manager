require 'rails_helper'

RSpec.describe ExercisesWorkout, type: :model do
  it "should exist" do
    result = FactoryGirl.create :exercises_workout, workout: FactoryGirl.create(:workout), exercise: FactoryGirl.create(:exercise)
  end
end
