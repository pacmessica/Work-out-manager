FactoryGirl.define do
  factory :workouts_exercise, class: 'ExercisesWorkouts' do
    workout nil
    exercise nil
    time 1
    instructions "MyText"
  end
end
