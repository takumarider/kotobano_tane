class Child < ApplicationRecord
  belongs_to :parent
  has_many :memos, dependent: :destroy

  validates :name, presence: true
  validates :birthday, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
