FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com"}
    password "default"
    password_confirmation {|u| u.password}
    role :viewer
  end
end
