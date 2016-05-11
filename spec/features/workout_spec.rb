require 'rails_helper'

feature 'Begin Workout Animation', :js => true do
  let(:workout) { FactoryGirl.create(:workout_with_exercises)}

  scenario 'Hide Workout overview' do
    visit workout_path(workout)
    click_link("Start Workout")
    expect(page).not_to have_css('.workout-overview')
  end
end
