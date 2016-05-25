require 'rails_helper'

RSpec.describe "workouts/new.html.erb", type: :view do
  let(:workout) { FactoryGirl.build(:workout)}
  before do
    assign(:workout, workout)
    render
  end

  it "shows a title" do
    assert_select 'h1', text: "Add a New Workout", count: 1
  end
end
