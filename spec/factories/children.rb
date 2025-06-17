FactoryBot.define do
  factory :child do
    association :parent
    sequence(:name) { |n| "子ども#{n}" }
    birthday { Date.today - 10.years }
    after(:build) do |child|
      if child.birthday.present?
        child.age = ((Date.today - child.birthday).to_i / 365)
      end
    end
  end
end
