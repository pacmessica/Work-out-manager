require 'rails_helper'

RSpec.describe Workout, type: :model do
  it { is_expected.to have_many :exercises }
  it { is_expected.to have_many :exercises_workouts }
end
