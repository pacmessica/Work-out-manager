FactoryGirl.define do
  factory :workouts_exercise, class: 'WorkoutsExercises' do
    workout nil
    exercise nil
    time 1
    instructions "MyText"
  end
end
