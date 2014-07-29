# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    user_id 1
    activity_type 1
    description "MyText"
  end
end
