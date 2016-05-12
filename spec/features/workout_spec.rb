require 'rails_helper'

def start_workout()
  visit workout_path(workout)
  click_link("Start Workout")
end

feature 'Begin Workout Animation', :js => true do
  let(:workout) { FactoryGirl.create(:workout_with_exercises)}

  scenario 'Hide Workout overview' do
    start_workout()
    expect(page).not_to have_css('.workout-overview')
  end

  scenario 'Show Workout Animation' do
    start_workout()
    expect(page).to have_css('.workout-animation')
  end

  scenario 'Show initial break' do
    start_workout()
    expect(page).to have_css('.rest-countdown')
    expect(page).not_to have_css('.exercise-view')
  end

  scenario 'Show only first exercise after initial break interval' do
    start_workout()
    sleep workout.interval + 0.3
    expect(page).to have_css('.exercise-view', count: 1, text: workout.exercises.first.name)
    expect(page).not_to have_css('.rest-countdown')
  end

  scenario 'Show break after first exercise' do
    start_workout()
    sleep workout.interval + workout.exercises_workouts.first.time + 0.3
    expect(page).not_to have_css('.exercise-view')
    expect(page).to have_css('.rest-countdown')
  end

  scenario 'Show second exercise after break' do
    start_workout()
    sleep workout.interval + workout.exercises_workouts.first.time + 0.3
    expect(page).to have_css('.exercise-view', count: 1, text: workout.exercises.second.name)
    expect(page).not_to have_css('.rest-countdown')
  end
end
