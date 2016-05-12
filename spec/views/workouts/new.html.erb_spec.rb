require 'rails_helper'

RSpec.describe "workouts/new.html.erb", type: :view do
  it "shows a title" do
    render
    assert_select 'h1', text: "Add a New Workout", count: 1
  end

  it "renders a form" do
    render
    expect(response).to render_template(:_form)
  end
end
