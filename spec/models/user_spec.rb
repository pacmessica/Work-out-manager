require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :workouts }
  it { is_expected.to have_many :favourites }
end
