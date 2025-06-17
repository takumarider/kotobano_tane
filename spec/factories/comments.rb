FactoryBot.define do
  factory :comment do
    association :memo
    association :parent
    sequence(:body) { |n| "コメント#{n}" }
  end
end
