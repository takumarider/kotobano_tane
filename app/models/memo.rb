# frozen_string_literal: true

class Memo < ApplicationRecord
  CATEGORIES = [
    "ことば",
    "きもち",
    "がっこう",
    "おうち",
    "ともだち",
    "その他"
  ].freeze

  belongs_to :child
  has_many :comments, dependent: :destroy
  has_many_attached :images

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }

  scope :search, ->(query) {
    return all unless query.present?
    where("title LIKE ? OR body LIKE ?", "%#{query}%", "%#{query}%")
  }

  scope :by_category, ->(category) {
    return all unless category.present?
    where(category: category)
  }

  scope :recent, -> { order(created_at: :desc) }
  scope :oldest, -> { order(created_at: :asc) }
  scope :title_asc, -> { order(title: :asc) }
  scope :title_desc, -> { order(title: :desc) }
end
