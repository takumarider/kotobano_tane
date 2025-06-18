# app/models/comment_template.rb
class CommentTemplate < ApplicationRecord
  belongs_to :parent

  validates :title, presence: true
  validates :content, presence: true
end
