FactoryBot.define do
  factory :memo do
    association :child
    association :category
    sequence(:title) { |n| "メモ#{n}" }
    sequence(:body) { |n| "メモの内容#{n}" }
  end
end
