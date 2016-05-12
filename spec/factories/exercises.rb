FactoryGirl.define do
  factory :exercise do
    name Faker::Name.name
    image "lunge.jpg"
    description "MyText"
    user nil
  end



  # factory :workout do
  #   exercises {[FactoryGirl.create(:exercise)]}
  #   name Faker::Name.name
  #   description "MyText"
  #   interval 1
  #   user nil
  # end
end
