require 'rails_helper'

def new_workout
  visit root_path
  click_link "Add New Workout"
end

feature 'Add Exercises', :js => true do
  before do
    login_user
  end

  scenario 'Select an exercise' do
    new_workout
    click_button "add-exercise-entry"
    expect(page).to have_css('#exercise-select', count: 1)
  end

  scenario 'Select Mutliple exercises' do
    new_workout
    click_button "add-exercise-entry"
    click_button "add-exercise-entry"
    expect(page).to have_css('#exercise-select', count: 2)
  end
end
