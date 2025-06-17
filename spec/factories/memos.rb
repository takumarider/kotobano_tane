FactoryBot.define do
  factory :memo do
    association :child
    sequence(:title) { |n| "メモ#{n}" }
    sequence(:body) { |n| "メモの内容#{n}" }
    category { Memo::CATEGORIES.sample }
  end
end
