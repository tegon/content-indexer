FactoryGirl.define do
  factory :link do
    href { Faker::Internet.url }
    page
  end
end
