require 'rails_helper'

RSpec.describe "workouts/show.html.erb", type: :view do
  let(:workout) { FactoryGirl.create(:workout_with_exercises)}
  before do
    assign(:workout, workout)
    render
  end

  it "shows a title" do
    assert_select 'h1', text: workout.name, count: 1
  end

  it "renders all the exercises" do
    assert_select '.exercise-panel', count: 5
  end

  it "renders all the exercise images" do
    assert_select '.exercise-image', count: 5
  end
end
