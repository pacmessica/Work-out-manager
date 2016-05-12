require 'rails_helper'

RSpec.describe "workouts/index.html.erb", type: :view do
  let(:workouts) { FactoryGirl.create_list(:workout_with_exercises, 3)}
  before do
    assign(:workouts, workouts)
    render
  end

  it "shows a title" do
    assert_select 'h1', text: "My Workouts", count: 1
  end

  it "renders all the workouts" do
    assert_select 'tr', count: 3
    workouts.each do |workout|
      assert_select 'td', text: workout.name
    end
  end

  it "renders all the exercises" do
    workouts.each do |workout|
      workout.exercises.each do |exercise|
        assert_select 'td', text: exercise.name
      end
    end
  end
end
