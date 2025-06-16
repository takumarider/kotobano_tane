class Comment < ApplicationRecord
  belongs_to :memo
  belongs_to :parent

  validates :body, presence: true
end
