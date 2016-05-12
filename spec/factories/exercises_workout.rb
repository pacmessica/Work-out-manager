FactoryGirl.define do
  factory :exercises_workout, class: 'ExercisesWorkout' do
    time 5
    instructions "MyText"
    workout
    exercise
  end
end
