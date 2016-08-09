FactoryGirl.define do
  factory :tag do
    type { %w(h1 h2 h3).sample }
    content { Faker::Name.name }
    page
  end
end
