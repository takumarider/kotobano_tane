FactoryBot.define do
  factory :parent do
    sequence(:email) { |n| "parent#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    sequence(:name) { |n| "保護者#{n}" }
  end
end
