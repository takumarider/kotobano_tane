class Child < ApplicationRecord
  belongs_to :parent
  has_many :memos, dependent: :destroy

  validates :name, presence: true
  validates :birthday, presence: true

  def age
    return nil unless birthday.present?

    today = Date.today
    age = today.year - birthday.year
    age -= 1 if today < birthday + age.years
    age
  end
end
