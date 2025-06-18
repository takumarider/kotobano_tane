class Memo < ApplicationRecord
  belongs_to :child
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many_attached :images

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true

  # スコープ例（by_categoryとsearch）
  scope :by_category, ->(category_name) {
    joins(:category).where(categories: { name: category_name })
  }

  scope :search, ->(keyword) {
    where("title LIKE ? OR body LIKE ?", "%#{keyword}%", "%#{keyword}%")
  }
end
