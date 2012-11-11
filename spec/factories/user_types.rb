# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_type do
    sequence(:typename) {|n| "typename#{n}"}
    level 1

    factory :admin_user_type do
      typename :admin
      level 99
    end
  end
end
