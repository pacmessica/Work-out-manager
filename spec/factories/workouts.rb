FactoryGirl.define do
  factory :workout do
    name Faker::Name.name
    description "MyText"
    interval 1
    user nil

    factory :workout_with_exercises do
      transient do
        exercises_count 5
      end

      after(:create) do |workout, evaluator|
        create_list(:exercises_workout, evaluator.exercises_count, workout: workout)
      end
    end
  end
end
