class Child < ApplicationRecord
  belongs_to :parent
  has_many :memos, dependent: :destroy

  validates :name, presence: true
  validates :birthday, presence: true

  def age
    return nil unless birthday.present?  # birthdayがなければnilを返す

    today = Date.today
    age = today.year - birthday.year

    # 今年の誕生日がまだ来ていなければ1歳引く
    if today < birthday + age.years
      age -= 1
    end

    age
  end
end
