require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it { is_expected.to have_many :workouts }
  it { is_expected.to have_many :exercises_workouts }
end
