FactoryGirl.define do
  sequence :email do |n|
    "customer#{n}@example.com"
  end
  sequence :name do |n|
    "山田 #{n}"
  end

  factory :customer do
    email
    name
    password              "test0000"
    password_confirmation "test0000"
  end
end