require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :workouts }
  it { is_expected.to have_many :favourites }
  it { is_expected.to have_many(:favourite_workouts).through(:favourites) }
end
