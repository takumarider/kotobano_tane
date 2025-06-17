class Memo < ApplicationRecord
  belongs_to :child
  belongs_to :category  # これでOK

  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true
end
