class Memo < ApplicationRecord
  belongs_to :child
  belongs_to :category

  has_many :comments, dependent: :destroy

  has_many_attached :images # ✅ これを追加！

  validates :title, presence: true
  validates :body, presence: true
  validates :category_id, presence: true
end
