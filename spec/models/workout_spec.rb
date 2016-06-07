require 'rails_helper'

RSpec.describe Workout, type: :model do
  it { is_expected.to have_many :exercises }
  it { is_expected.to have_many :exercises_workouts }
  it { is_expected.to have_many :favourites }
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:users).through(:favourites) }

  describe "validations" do
    it "requires a name" do
      workout = Workout.new(name:"")
      workout.valid?
      expect(workout.errors).to have_key(:name)
    end
    it "does not require a description" do
      workout = Workout.new(description: nil)
      workout.valid?
      expect(workout.errors).not_to have_key(:description)
    end
  end
end
