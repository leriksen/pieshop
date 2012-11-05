# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_type do
    sequence(:typename) {|n| "typename#{n}"}
    level 1
  end
end
