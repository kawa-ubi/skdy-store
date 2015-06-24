FactoryGirl.define do
  sequence :title do |n|
    "本 #{n}"
  end

  factory :book do
    title
    price 1000
  end
end